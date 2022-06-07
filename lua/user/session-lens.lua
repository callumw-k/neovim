local status_ok, session_lens = pcall(require, "session-lens")
if not status_ok then
	return
end
local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
	return
end

auto_session.setup {
  log_level = 'info',
  auto_session_suppress_dirs = {'~/'}
}



session_lens.setup({
	path_display = { "shorten" },
	previewer = true,
})
