local Url = require "demo.url"
local test = require "demo.test"

test('Url.parse',  function(t)
	-- 第一个测试
	local  url = Url.parse('http://user:pass@host.com:8080/p/a/t/h?query=string#hash')
	t.deepEqual(url, {
		protocol = 'http:',
		auth = 'user:pass',
		hostname = 'host.com',
		port = 8080,
		pathname = '/p/a/t/h',
		query = 'query=string',
		hash = '#hash'
	})

	-- 第二个测试
	local url2 = Url.parse('https://www.google.com/#q=search')
	t.deepEqual(url2, {
		protocol = 'https:',
		auth = nil,
		hostname = 'www.google.com',
		port = nil,
		pathname = '/',
		query = '',
		hash = '#q=search'
	})
	
end)