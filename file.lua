local imgFile = "/www/demo1/html/fangkm/1.jpg"

-- 检查文件是否文目录
local function isDir(sPath)
	if type(sPath) ~= "string" then return false end
	local response = os.execute("cd " .. sPath)
	if response then
		return true
	else
		return false
	end
end

-- 文件是否存在
function fileExists(fileName)
	local f = io.open(fileName, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false 
	end
end

-- 获取文件的路径
function getFileNameDir(fileName)
	return string.match(fileName, "(.*)/[^/]*%.%w+$")
end

-- 获取文件名
function  stripPath(fileName)
	return string.match(fileName, ".*/([^/]*%.%w+)$")
end

-- 获取文件路径和文件名
function getFileInfo(fileName)
	local t = {}
	local _, _, fPath, fName = string.find(fileName, "(.*)/([^/]*%.%w+)$")
	table.insert(t, fPath)
	table.insert(t, fName)
	return t
end

-- 去除文件扩展名
function stripExtension(fileName)
	local idx = fileName:match(".+()%.%w+$")
	if idx then
		return fileName:sub(1, idx-1)
	else
		return fileName
	end
end

-- 获取扩展名
function getExtension(fileName)
	return string.match(fileName, ".+%.(%w+)$")
end

-- 开始执行
if not isDir(getFileNameDir(imgFile)) then
	os.execute("mkdir -p " .. getFileNameDir(imgFile))
end

-- 获取宽或者高
local uri = ngx.var.img_size
local width = string.sub(uri, 1, 1)
local height = 0

if width == "-" then
	width = 0
	height = string.sub(uri, 2, string.len(uri))
else
	width = string.sub(uri, 1, string.len(uri)-1)
	height = 0
end