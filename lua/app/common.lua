--[[
  const variable's get and set function
]]

-- gm bin path
local graphicsMagickBinPath = "/usr/local/service/GraphicsMagick1.3.18/bin/gm"

-- imager bash path
local imagerBashPath = "/usr/local/service/nginx-gm/bash/bin/imager"

-- geometries whick are allowd to use.
local legalGeometryTable = {
	["0"] = "0",
	["200x333"] = "200x333" 
};

-- rotates whick are allowd to use.
local legalRotateTable = {
	["0"] = "0",
	["90"] = "90"
};

-- quantities whick are allowd to use.
local legalQualityTable = {
        ["0"] = "95",
        ["80"] = "80",
        ["95"] = "95",
        ["75"] = "75",
        ["65"] = "65",
        ["55"] = "55",
        ["45"] = "45"
};

local legalRotateTypeTable = {
	["0"] = "0",
	["1"] = "1"
};

-- geometry type which are allowed to use
local legalGeometryTypeTable = {
	["0"] = "0",
	["1"] = "^",
	["2"] = "!",
	["3"] = ">",
	["4"] = "<",
	["5"] = "w",
	["6"] = "h"
};

-- path which origin image to store
local originImagePath = "";

-- path which target image to store
local targetImagePath = "";

-- default path which target image to store
local defaultTargetImagePath = "";

local getGraphicsMagickBinPath
function getGraphicsMagickBinPath()
	return graphicsMagickBinPath;
end

local getImagerBashPath
function getImagerBashPath()
	return imagerBashPath;
end

local getLegalGeometryTable
function getLegalGeometryTable()
	return legalGeometryTable;
end

local getLegalRotateTable
function getLegalRotateTable()
	return legalRotateTable;
end

local getLegalQualityTable
function getLegalQualityTable()
	return legalQualityTable;
end

local setOriginImagePath
function setOriginImagePath(originImagePathStr)
	originImagePath = originImagePathStr;
end

local getTargetImagePath
function getTargetImagePath()
	return targetImagePath;
end

local getLegalRotateTypeTable
function getLegalRotateTypeTable()
	return legalRotateTypeTable;
end

local getLegalGeometryTypeTable
function getLegalGeometryTypeTable()
	return legalGeometryTypeTable;
end

return { getGraphicsMagickBinPath = getGraphicsMagickBinPath,
		 getImagerBashPath = getImagerBashPath,
		 getLegalGeometryTable = getLegalGeometryTable,
		 getLegalRotateTable = getLegalRotateTable,
		 getLegalQualityTable = getLegalQualityTable,
		 setOriginImagePath = setOriginImagePath,
		 getTargetImagePath = getTargetImagePath,
		 getLegalRotateTypeTable = getLegalRotateTypeTable,
		 getLegalGeometryTypeTable = getLegalGeometryTypeTable
};
