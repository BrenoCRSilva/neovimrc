return {
	"milanglacier/minuet-ai.nvim",
	config = function()
		require("minuet").setup({
			virtualtext = {
				auto_trigger_ft = { "lua", "go", "python", "typescript" },
				keymap = {
					accept = "<C-i>",
				},
				show_on_completion_menu = true,
			},
			throttle = 0,
			debounce = 0,
			request_timeout = 1,
			provider = "openai_fim_compatible",
			n_completions = 1,
			context_window = 1500,
			provider_options = {
				openai_fim_compatible = {
					api_key = "TERM",
					name = "Ollama",
					end_point = "http://192.168.15.2:1234/v1/completions",
					model = "qwen2.5-coder-7b-instruct",
					optional = {
						max_tokens = 50,
						top_p = 0.8,
						temperature = 0.1,
						stop = { "\n", " {\n", ") {\n", "} " },
					},
				},
			},
		})
	end,
}
