-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- for harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

---------------------
-- General Keymaps
---------------------

-- saving shortcuts
keymap.set("n", "<leader>sf", ":w<CR>")
keymap.set("n", "<leader>sa", ":wa<CR>")
keymap.set("n", "<leader>sq", ":wq<CR>")
keymap.set("n", "<leader>qf", ":q<CR>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------
--
-- toggle netrw
keymap.set("n", "<leader>rw", ":Ex<CR>")

-- keymaps for harpoon file manager
keymap.set("n", "<leader>a", mark.add_file)
keymap.set("n", "<C-e>", ui.toggle_quick_menu)

keymap.set("n", "<leader>1", function()
  ui.nav_file(1)
end)
keymap.set("n", "<leader>2", function()
  ui.nav_file(2)
end)
keymap.set("n", "<leader>3", function()
  ui.nav_file(3)
end)
keymap.set("n", "<leader>4", function()
  ui.nav_file(4)
end)

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
