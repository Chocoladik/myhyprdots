{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
    withNodeJs = false;

    plugins = with pkgs.vimPlugins; [
      blink-cmp
      (nvim-treesitter.withPlugins (p: [
        p.lua p.luadoc p.vim p.vimdoc p.query
        p.nix p.bash p.fish p.json p.yaml p.toml
        p.markdown p.markdown_inline
      ]))
    ];

    initLua = ''
      vim.loader.enable()

      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.g.mapleader = " "
      vim.g.maplocalleader = " "

      local o = vim.o
      o.number = true
      o.relativenumber = true
      o.termguicolors = true
      o.signcolumn = "yes"
      o.cursorline = true
      o.scrolloff = 8
      o.mouse = "a"
      o.ignorecase = true
      o.smartcase = true
      o.undofile = true
      o.updatetime = 250
      o.splitright = true
      o.splitbelow = true
      o.expandtab = true
      o.shiftwidth = 2
      o.tabstop = 2
      vim.schedule(function() o.clipboard = "unnamedplus" end)

      vim.pack.add({
        "https://github.com/AvengeMedia/base46",
        "https://github.com/nvim-tree/nvim-web-devicons",
        "https://github.com/nvim-tree/nvim-tree.lua",
        "https://github.com/folke/lazydev.nvim", -- Neovim API types for lua_ls
        "https://github.com/stevearc/conform.nvim",
      }, { confirm = false })

      require("base46").setup({ transparency = false })
      if not pcall(vim.cmd.colorscheme, "dms") then
        vim.cmd.colorscheme("base46-gruvchad")
      end

      require("nvim-tree").setup({
        view = { width = 32 },
        renderer = { group_empty = true },
        git = { enable = true },
      })
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File tree" })

      require("blink.cmp").setup({
        keymap = { preset = "super-tab" },
        completion = {
          ghost_text = { enabled = true },
          documentation = { auto_show = true, auto_show_delay_ms = 250 },
        },
        signature = { enabled = true },
        sources = {
          default = { "lazydev", "lsp", "path", "snippets", "buffer" },
          providers = {
            lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
          },
        },
        fuzzy = { implementation = "prefer_rust" },
      })

      require("lazydev").setup({})

      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })
      vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".stylua.toml", "stylua.toml", ".git" },
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            completion = { callSnippet = "Replace" },
            telemetry = { enable = false },
          },
        },
      })
      vim.lsp.config("nixd", {
        cmd = { "nixd" },
        filetypes = { "nix" },
        root_markers = { "flake.nix", ".git" },
      })
      vim.lsp.enable({ "lua_ls", "nixd" })
      vim.diagnostic.config({ virtual_text = true, severity_sort = true })

      require("conform").setup({
        formatters_by_ft = { lua = { "stylua" }, nix = { "nixfmt" } },
        format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev) pcall(vim.treesitter.start, ev.buf) end,
      })
    '';
  };
}
