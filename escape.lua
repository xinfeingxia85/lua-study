s = [[name=al&query=a%2Bb+%3D+c&q=yes+or+no]]
function unescape(s)
	s = string.gsub(s, "+", "")
	s = string.gsub(s, "%%(%x%x)", function(h)
		return string.char(tonumber(h, 16))
	end)
	return s
end

function escape(s)
	s = string.gsub(s, "[%c=+&]", function (c)
		return string.format("%%%02x", string.byte(c))
	end)

	s = string.gsub(s, " ", "+")
	return s
end

function encode(t)
	local s = ""
	for k,v in pairs(t) do
		s = s .. "&" .. escape(k) .. "=" .. escape(v)
	end
	return string.sub(s, 2)
end

function decode(s)
	local cgi = {}
	-- gfind在高版本中废弃，可以直接考虑用gmatch
	-- for name, value in string.gfind(s, "([^&=]+)=([^&=]+)") do
		-- name = unescape(name)
		-- value = unescape(value)
		-- cgi[name] = value
	
	for name, value in string.gmatch(s, "([^&=]+)=([^&=]+)") do
		name = unescape(name)
		value = unescape(value)
		cgi[name] = value
    end
 	-- string.gsub(s, "([^&=]+)=([^&=]+)", function( ... )
 	-- 	local t = {...}
 	-- 	name = unescape(t[1])
 	-- 	value = unescape(t[2])
 	-- 	cgi[name] = value
 	-- end)
    return cgi
end
-- for k,v in pairs(decode(s)) do
-- 	print(k,v)
-- end
-- print(escape("fang=\nkm"))
t = {name = "al", query = "a+b = c", q="yes or no"}
print(encode(t))
