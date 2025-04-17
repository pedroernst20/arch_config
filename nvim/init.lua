-- Bootstrap de Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configurar plugins
require("lazy").setup({
  -- Tema tokyonight
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

  -- Barra de estado
  { "nvim-lualine/lualine.nvim" },

  -- Árbol de archivos
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },

    -- Resaltar sintaxis
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c", "cpp", "python", "latex", "verilog", "lua", "bash"
        },
        highlight = { enable = true },
      })
    end
  },

  -- Autocompletado
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  -- Navegador de archivos
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup{
        view = {
          width = 30,
          side = 'left',
        }
      }
    end
  },

  -- Comentarios rápidos
  { "numToStr/Comment.nvim", config = true },

  -- Telescope: buscador de archivos
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end
  },

  -- LSP y autocompletado
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
})

require('nvim-tree').setup({
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "", 
          staged = "✓",
          untracked = "",
          renamed = "➜",
          unmerged = "",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
})

require'nvim-web-devicons'.setup {
  override_by_filename = {
    ["py"] = {
      icon = "",
      color = "#3572A5",
      name = "Python"
    },
    ["c"] = {
      icon = "",
      color = "#599eff",
      name = "C"
    },
    ["cpp"] = {
      icon = "",
      color = "#f34b7d",
      name = "Cpp"
    },
    ["tex"] = {
      icon = "",
      color = "#3D6117",
      name = "TeX"
    },
    ["txt"] = {
      icon = "",
      color = "#89dceb",
      name = "Text"
    },
    ["v"] = {
      icon = "",
      color = "#ffb86c",
      name = "Verilog"
    },
    ["vh"] = {
      icon = "",
      color = "#ffb86c",
      name = "VerilogHeader"
    },
    ["sv"] = {
      icon = "",
      color = "#ffb86c",
      name = "SystemVerilog"
    },
  },
}

-- Abrir el árbol de archivos al iniciar
vim.cmd([[autocmd VimEnter * NvimTreeOpen]])

-- Configuración general
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"

-- Tema
vim.cmd.colorscheme("tokyonight")

-- Lualine
require("lualine").setup()

-- Nvim Tree (Ctrl+n para abrir/cerrar)
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- Telescope (Ctrl+p para buscar archivos)
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>")

-- LSP (ejemplo con pyright, podés instalar más)
require("lspconfig").pyright.setup({})

-- Establecer la cantidad de espacios para la tabulación
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2      
vim.o.expandtab = true

-- Mapea <Leader>e para abrir/cerrar nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


