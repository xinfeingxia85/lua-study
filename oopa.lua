function newObject(defaultName)
	local self = {name = defaultName}
	local getName = function ()
		return self.name
	end
	local setName = function(v)
		self.name = v
	end
	return {setName = setName, getName = getName}
end

local objectA = newObject("fankm")
objectA.setName("JellyThink")
print(objectA.getName())