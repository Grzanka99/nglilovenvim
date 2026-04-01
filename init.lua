vim.g.__ = {
	gui = {
		numberLines = true,
		relativeLineNumber = false,
		allowTransparency = false,
	},
	codestyle = {
		tab_size = 2,
		expandtab = true,
	},
}

-- Security
vim.opt.exrc = true
vim.g.mapleader = " "

-- Manually source .nvim.lua early so flags are available
local exrc = vim.fn.fnamemodify(".nvim.lua", ":p")
if vim.fn.filereadable(exrc) == 1 then
  vim.cmd("sandbox source " .. exrc)
end

require("config.options")
require("config.keybindings")
require("config.autocommands")

require("agentic.autoread")

require("plugins")
