--[[
  util module contains some tool functions which are useful
  to simplify developing.

  @author Mark Snoopy
]]

--[[
  
  @param str the 	string to be spearate
  @param spearator 	spearator to spearate the param str,
  					support mutiple char such as '__'  and so on.
  @return table which contain elements spearated by spearator
]]
local strSplit
function strSplit(str, separator)  

	local startIndex = 1
	local splitIndex = 1
	local splitTable = {}

	while true do
	   local lastIndex = string.find(str, separator, startIndex)
	   if not lastIndex then  
	   		splitTable[splitIndex] = string.sub(str, startIndex, string.len(str))
	    	break
	   end
	   
	   splitTable[splitIndex] = string.sub(str, startIndex, lastIndex - 1)
	   startIndex = lastIndex + string.len(separator)
	   splitIndex = splitIndex + 1
	end

	return splitTable

end

local checkParam

function checkParam(nginxImageParamTable, legalParamTable)

	local paramTable = {};

	for key, value in pairs(legalParamTable) do
		
		local paramValue = nginxImageParamTable[key];
		if paramValue ~= nil and value[paramValue] ~= nil then
		 	paramTable[key] = value[paramValue];
		 else
		 	paramTable[key] = "0";
		 end
	end

	return paramTable;
end

local parseParam
function parseParam(nginxImageParamTable)

	local paramTable = {};

	for key, value in pairs(nginxImageParamTable) do

		local paramKey = string.sub(value, 1, 2);
		local paramValue = string.sub(value, 3, string.len(value));
		paramTable[paramKey] = paramValue;

	end

	return paramTable;
end

local generateBash
function generateBash(paramTable)
	local ge = paramTable["ge"];
	local ro = paramTable["ro"];
	local qu = paramTable["qu"];
	local rt = paramTable["rt"];
	local gt = paramTable["gt"];

	local cmd = " convert ";

	if ge ~= 0 then
		cmd = cmd .. " -thumbnail " .. ge;

		if gt ~= 0 then
			cmd = cmd .. gt
		end
	end

	if qu ~= 0 then
		cmd = cmd .. " -quality " .. qu;
	end

	
	print(cmd)
end

return {strSplit = strSplit,
		checkParam = checkParam,
		parseParam = parseParam,
		generateBash = generateBash
};
