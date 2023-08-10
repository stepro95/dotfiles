local util = require("lspconfig/util")

require("lspconfig.configs").cds_lsp = {
  default_config = {
    name = "cds-lsp",
    cmd = { "cds-lsp" },
    filetypes = { "cds" },
    root_dir = util.path.dirname,
  },
}

local lsp = require("lsp-zero").preset({
  name = "minimal",
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.configure("cds_lsp", { force_setup = true })
