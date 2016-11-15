-- string.gmatch(str, pattern)
-- s = "hello world from lua"
-- for w in string.gmatch(s, "%a+") do
--	print(w, v)
-- end

-- string.gsub
-- lookuptable = {hello = "hola", world = "mundo"}

-- print(string.gsub("hello world", "(%w+)", lookuptable))

-- print(string.gsub("hello world", "(%w+)", function (s)
	-- return ""
-- end))
-- print(string.match("abcdefg", "a"))
-- print(string.reverse("abcde"))

-- function aa()
-- 	print("dd")
-- end
-- print(string.dump(aa))
--print(string.gsub("hello, up-down", "%A", "."))
-- test = "int x; /* x */ int y; /* y */"
-- print(string.gsub(test, "/%*.*%*/", "<COMMENT
-- print(string.gsub("a(enclosed (in) parenttheses) line", '%(.*%)', ""))
-- pair = "name = Anna"
-- _, _, m1, m2 = string.find(pair, "(%a+)%s*=%s*(%a+)")
-- print(m1, m2)
-- s = [[then he said: "it's all right"!]]
-- a, b, c, quotedPart = string.find(s, "(\")(.-)%1")
-- print(quotedPart)
-- print(c) 
-- print(string.gsub("hello Lua!", "(%a)", "%1-%1"))
-- s = [[the \quote{task} is to \em{change} that.]]
-- s1 = string.gsub(s, "\\(%a+){(.-)}", "<%1>%2<%1>")
-- print(s1)
-- function handle
-- name = "Lua"
-- status = "great"
-- eStr = [[$name is $status, isn't it?]]
-- print((string.gsub(eStr, "$(%w+)", function (n)
-- 	return _G[n]
-- end)))
-- s = "sin(3) = $[math.sin(3)]; 2^5 = $[2^5]"
-- print((string.gsub(s, "$(%b[])", function (x)
--     x = "return " .. string.sub(x, 2, -2)
--     local f = loadstring(x)
--     return f()
-- end)))

