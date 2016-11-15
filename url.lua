local Url = require "resty.url"
local t = Url.parse("https://www.baidu.com/1.html", "")
--print(t)
for k, v in pairs(t) do
	ngx.say(k, '-', v)
end