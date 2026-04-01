vim.api.nvim_create_augroup("autoread_checktime", { clear = true })

local autoread_poll = false
local poll_interval = 3000

local function poll_checktime()
	if vim.fn.mode() ~= "c" then
		vim.cmd("checktime")
	end
	if autoread_poll then
		vim.defer_fn(poll_checktime, poll_interval)
	end
end

vim.api.nvim_create_autocmd("FocusLost", {
	group = "autoread_checktime",
	callback = function()
		autoread_poll = true
		vim.defer_fn(poll_checktime, poll_interval)
	end,
	pattern = { "*" },
})

vim.api.nvim_create_autocmd("FocusGained", {
	group = "autoread_checktime",
	callback = function()
		autoread_poll = false
	end,
	pattern = { "*" },
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	group = "autoread_checktime",
	callback = function()
		if not autoread_poll and vim.fn.mode() ~= "c" then
			vim.cmd("checktime")
		end
	end,
	pattern = { "*" },
})
