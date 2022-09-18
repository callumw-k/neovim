local leap_ok, leap = pcall(require, "leap")
if not leap_ok then
  return
end

local comment_ok, comment = pcall(require, "Comment")
if not comment_ok then
  return
end


leap.set_default_keymaps()
comment.setup()
