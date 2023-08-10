require("steven.plugins-setup")
require("steven.core.options")
require("steven.core.keymaps")
require("steven.core.colorscheme")
require("steven.plugins.comment")
require("steven.plugins.nvim-tree")
require("steven.plugins.lualine")
require("steven.plugins.telescope")
require("steven.plugins.nvim-cmp")
require("steven.plugins.lsp.mason")
require("steven.plugins.lsp.lspsaga")
require("steven.plugins.lsp.lspconfig")
require("steven.plugins.lsp.null-ls")
require("steven.plugins.autopairs")
require("steven.plugins.treesitter")
require("steven.plugins.gitsigns")

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local on_attach = function(client, bufnr)
  vim.notify("sapcds_lsp attached to buffer", vim.log.levels.WARN)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("nnoremap <silent><buffer> gf :lua vim.lsp.buf.format({async = true})<CR>")
  end

  if client.server_capabilities.documentRangeFormattingProvider then
    vim.cmd("xnoremap <silent><buffer> gf :lua vim.lsp.buf.range_formatting({})<CR>")
  end
end

configs.sapcds_lsp = {
  default_config = {
    cmd = { vim.fn.expand("$HOME/bin/cds/cds-start") }, -- this executable must be there
    filetypes = { "cds" },
    root_dir = function(fname)
      return vim.fn.getcwd()
    end,
    settings = {},
  },
}
if lspconfig.sapcds_lsp.setup then
  lspconfig.sapcds_lsp.setup({
    on_attach = on_attach,
    autostart = true,
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  })
end
