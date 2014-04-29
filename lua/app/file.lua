--[[
 File Class
]]


local fileExist
function fileExist(filePath)
	local file = io.open(filePath, "r");

	if file ~= nil then
		io.close(file);
		return true;
	else
		return false;
	end
end

return {fileExist = fileExist};
