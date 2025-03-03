local M = {}

---@param file_name string
---@return boolean
M.if_file_exist = function(file_name) -- Correct the name here
	if type(file_name) ~= "string" then
		return false
	end

	local file = vim.fs.find(function(name, path)
		if path:match("node_modules") then
			return false
		end
		return name:match(file_name)
	end, { limit = 1, type = "file", path = "." })

	return file[1] ~= nil
end

return M
