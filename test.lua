local _ = require "demo.shim"

local queue = {}

local function ok(val, msg)
	assert(true == val, msg)
end

local function equal(val, excepted, msg)
	if val ~= excepted then
		assert(false, msg or tostring(val) .. '=' .. tostring(excepted))
	end
end

local function deepEqual(val, excepted, msg)
	local ok = _.isDeepEqual(val, excepted)
	if not ok then
		assert(false, msg or tostring(val) .. '=' .. tostring(excepted))
	end
end

local function getT()
	return {
		ok = ok,
		equal = equal,
		deepEqual = deepEqual
    }
end

local function report(ok, title, msg)
	if ok then
		ngx.say('pass ' .. title)
	else
		ngx.say('fail ' .. title .. ' ' .. msg)
	end
end

local function execTest(title, func)
	local t = getT()
	local ok, ret = pcall(func, t)
	if ok then
		report(ok, title)
	else
		local  info = debug.getinfo(1)
		report(ok, title, info.short_src .. ":" .. info.currentline)
	end
end

local function test(title, func)
	if _.isFunction(title) then
		return test('untitled', title)
	end

	if _.isFunction(func) then
		execTest(title, func)
	end
end 
return test