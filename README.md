# ⚙️ Neovim Configuration by Breno

Bem-vindo à minha configuração pessoal do **Neovim**, feita para ser simples, rápida e produtiva.  
Ideal para quem quer começar com uma base funcional ou turbinar o próprio setup!

---

## 🚀 Como usar

### 1. Requisitos

- [Neovim](https://neovim.io/) `v0.8+`

💡 **Recomendado:** Instalar a versão mais recente diretamente do GitHub:

```bash
# Baixe e instale a última versão do Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

### 2. Backup (recomendado)

Antes de aplicar, faça backup da sua configuração atual:

```bash
mv ~/.config/nvim ~/.config/nvim_backup
```

### 3. Clone esta configuração

```bash
git clone https://github.com/BrenoCRSilva/neovimrc ~/.config/nvim
```

### 4. Abra o Neovim

```bash
nvim
```

Na primeira inicialização, os plugins serão instalados automaticamente com o **Lazy.nvim**.  
Aguarde a instalação e reinicie o Neovim.

---

## 🧩 Estrutura

```
nvim/
├── init.lua         # Arquivo principal de configuração
├── lua/             # Configurações organizadas por arquivos
│   ├── plugins/     # Plugins configurados com Lazy
│   └── core/        # Módulos base (atalhos, LSP, etc)
```

---

## ✨ Funcionalidades

- 🧠 Autocompletion com nvim-cmp
- 🛠️ LSP configurado (pronto para várias linguagens)
- 🌈 Tema bonito e legível
- 🧹 Linters e formatadores
- 🚀 Startup rápido com Lazy.nvim e plugins otimizados

---

## 🧪 Testado em

- Linux (Ubuntu/Debian-based)
- Neovim 0.8+

---

## 👨‍💻 Autor

Feito por [BrenoCRSilva](https://github.com/BrenoCRSilva)  
Curte o setup? Dá uma estrela ⭐ e compartilha!

---

## 📘 Licença

Este repositório está licenciado sob a licença MIT.
