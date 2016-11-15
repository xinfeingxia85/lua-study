local function search(k, pParentList)
	for i=1, #pParentList do
		local v = pParentList[i][k]
		if v then
			return v
		end
	end
end 

function createClass( ... )
	local c = {} -- 新类
	local parents = {...}
	setmetatable(c, {__index = function(t, k)
		return search(k, parents)
	end})

	-- 将c作为其实例的元素
	c.__index = c

	-- 为这个新类构造一个新的构造函数
	function c:new(o)
		o = o or {}
		setmetatable(o, self)
		return o
	end

	return c
end


-- 第一个类CA
local CA = {}
function CA:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function CA:setName(strName)
	self.name = strName
end

-- 第一个类CB
local CB = {}
function CB:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function CB:getName()
	return self.name
end

local  c = createClass(CA, CB)
local objC = c:new{name="Jelly"}
objC:setName("JellyThink")
local newName = objC:getName()
print(newName)
