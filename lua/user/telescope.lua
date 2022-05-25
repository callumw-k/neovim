local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

require 'telescope'.load_extension('project')
