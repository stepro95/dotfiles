
local util = require("lspconfig/util")

require("lspconfig.configs").cds_lsp = {
  default_config = {
    name = "cds-lsp",
    cmd = { "cds-lsp" },
    filetypes = { "cds" },
    root_dir = util.path.dirname,
  },
}
