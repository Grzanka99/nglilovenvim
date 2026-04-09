local function is_remote()
  for _, arg in ipairs(vim.v.argv) do
    if arg == "--server" or arg == "--remote" or arg == "--remote-silent" or arg == "--remote-send" or arg == "--remote-wait" or arg == "--remote-tab" then
      return true
    end
  end
  return false
end

local function get_sock_path()
  local cwd = vim.fn.getcwd()
  local escaped = cwd:gsub("/", "_")
  return "/tmp/" .. escaped .. "+nvim.sock"
end

if not is_remote() then
  local sock = get_sock_path()
  if vim.fn.filereadable(sock) == 1 then
    vim.notify("Server socket already exists at " .. sock, vim.log.levels.WARN)
  else
    vim.fn.serverstart(sock)
  end
end
