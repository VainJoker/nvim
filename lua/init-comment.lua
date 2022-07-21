local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  vim.notify("Could not load Comment module")
  return
end

comment.setup()
