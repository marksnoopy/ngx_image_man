--[[
   	edit source image file and generate new image file by nginx request.
	
	param list:
	ge : geometry, such as 256x256 and so on. support legalGeometryTable in common.lua
	ro : rotate, such as 90 and so on. support legalRotateTable in common.lua
	qu : quality, such as 95 and so on. support legalQualityTable in commmon.lua
	rt : rotate type, 0 indicate rotating image by the relation of the origin file's height and width,
		if the width > height , then rotate ; otherwise , not rotate . 1 indicate force to rotate image
		no mater the relation of the width and height.
	gt : geometry type, 

   	@author Mark Snoopy
]]

-- custom user package path
package.path = "/usr/local/service/nginx-gm/lua/app/?.lua";

-- import module
local common = require "common";
local util = require "util";
local file = require "file";

local originImageFile = ngx.var.origin_file;

local imageParam = ngx.var.arg_p;

if not file.fileExist(originImageFile) then 
	ngx.exit(404);
end

if not file.fileExist(common.getGraphicsMagickBinPath()) then
	ngx.exit(404);
end

if not file.fileExist(common.getImagerBashPath()) then
	ngx.exit(404);
end


local targetImageFile = ngx.var.target_file;

local legalVar = {["ge"] = common.getLegalGeometryTable(),
				 ["ro"] = common.getLegalRotateTable(),
				 ["qu"] = common.getLegalQualityTable(),
				 ["rt"] = common.getLegalRotateTypeTable(),
				 ["gt"] = common.getLegalGeometryTypeTable()};


local nginxImageParamTable = util.strSplit(imageParam, "_");
nginxImageParamTable = util.parseParam(nginxImageParamTable);

nginxImageParamTable = util.checkParam(nginxImageParamTable, legalVar);

local cmd = common.getImagerBashPath() .. " " .. nginxImageParamTable["ge"] .. " " .. nginxImageParamTable["ro"] .. " " .. nginxImageParamTable["qu"] .. " " .. nginxImageParamTable["rt"] .. " '" .. nginxImageParamTable["gt"] .. "' \"" .. originImageFile .."\"" .. " " .. "\"" .. targetImageFile .."\""
os.execute(cmd);
print(cmd);
ngx.req.set_uri(ngx.var.request_uri, false);
