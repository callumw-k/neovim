local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local leap_ok, leap = pcall(require, "leap")
if not leap_ok then
  return
end

local comment_ok, comment = pcall(require, "Comment")
if not comment_ok then
  return
end

which_key.setup {}
leap.set_default_keymaps()
comment.setup()
