local _ = require "demo.shim"

local Url = {
	version = "1.0.1"
}

function splitTwo(str, sp)
	local arr = _.split(str, sp)
	local first = arr[1]
	local second = _.join(_.slice(arr, 2), sp)
	return first, second
end

function splicePattern(str, pattern)
	local matched
	if _.isString(str) then
		str = str:gsub(pattern, function(_matched)
			matched = _matched
			return ''
		end)
	end
	return matched, str
end

function Url.parse(str, shouldParseQuery)
	if not _.isString(str) then
		return str
	end

	local url = {}
	local rest = str

	--分析#
	rest, url.hash = splitTwo(str, '#')
	if url.hash then
		url.hash = '#' .. url.hash
	end

	--分析?
	rest, url.query = splitTwo(rest, '?')

	--分析协议
	url.protocol, rest = splicePattern(rest, '^[a-zA-z][a-zA-z0-9.]*:')
	if _.startWith(rest, '//') then
		rest = _.slice(rest, 3)
	end
	--url.protocol = _.slice(url.protocol, 1, _.len(url.protocol))

	--分析pathname
	rest, url.pathname = splitTwo(rest, '/')
	if not url.pathname then
		url.pathname = ''
	end
	url.pathname = '/' .. url.pathname

	--分析auth
	local auth, host = splitTwo(rest, '@')
	if _.empty(host) then
		host = auth
		auth = nil
	end
	url.auth = auth

	--分析host
	url.hostname, url.port = splitTwo(host, ':')
	if url.port then
		url.port = tonumber(url.port)
	end

	return url
end

return Url