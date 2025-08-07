return {
	"milanglacier/minuet-ai.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "Davidyz/VectorCode" },
	config = function()
		require("vectorcode").setup({
			n_query = 1,
		})
		local has_vc, vectorcode_config = pcall(require, "vectorcode.config")
		local vectorcode_cacher = nil
		if has_vc then
			vectorcode_cacher = vectorcode_config.get_cacher_backend()
		end

		local RAG_Context_Window_Size = 1024

		require("minuet").setup({
			virtualtext = {
				auto_trigger_ft = { "lua", "go", "python", "typescript", "sql" },
				keymap = {
					accept = "<C-h>",
				},
				show_on_completion_menu = true,
			},
			throttle = 0,
			debounce = 0,
			request_timeout = 1,
			provider = "openai_fim_compatible",
			n_completions = 1,
			context_window = 512,
			provider_options = {
				openai_fim_compatible = {
					api_key = "TERM",
					name = "Ollama",
					end_point = "http://192.168.15.2:1234/v1/completions",
					model = "qwen2.5-coder-7b-instruct",
					optional = {
						max_tokens = 56,
						top_p = 0.8,
						temperature = 0.1,
						stop = { "\t" },
					},
					template = {
						prompt = function(pref, suff, _)
							local prompt_message = ""
							if has_vc then
								for _, file in ipairs(vectorcode_cacher.query_from_cache(0)) do
									prompt_message = prompt_message
										.. "<|file_sep|>"
										.. file.path
										.. "\n"
										.. file.document
								end
							end

							prompt_message = vim.fn.strcharpart(prompt_message, 0, RAG_Context_Window_Size)

							return prompt_message
								.. "<|fim_prefix|>"
								.. pref
								.. "<|fim_suffix|>"
								.. suff
								.. "<|fim_middle|>"
						end,
						suffix = false,
					},
				},
			},
		})
	end,
}
