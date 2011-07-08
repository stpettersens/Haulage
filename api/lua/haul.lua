--
-- Haul module [for Lua code].
-- Haulage source code manager.
-- Copyright (c) 2011 Sam Saint-Pettersen.
--
-- Released under the MIT/X11 License.
--

-- globals
rubyexec = 'ruby'

-- specify as module.
module(..., package.seeall)

-- version iformation
_VERSION = [[ haul Lua API module 1.0
Copyright (c) 2011 Sam Saint-Pettersen]]

function init()
	print('Initialized haul module.\n')
end

function version()
	local out = __callHaul('version()')
	print(out[1]) -- in Lua, indexes start at 1, not 0.
end

function pull(depfile, quiet)
	depfile = depfile or 'haul.deps'
	quiet = quiet or false
	local out = __callHaul('pull("' .. depfile .. '", false)')
	for i, v in ipairs(out) do
		print(v)
	end
end

function __callHaul(method)
	local tmp = 'haul.txt'
	local pipe = io.popen(rubyexec .. ' haulapi.rb > ' .. tmp, 'w')
	pipe:write('Haul.' .. method)
	pipe:close()
	pipe = io.open(tmp)
	local result = pipe:read('*all')
	pipe:close()
	os.remove(tmp)
	return __sanitize(result)
end

function __sanitize(contents)
	local result = {}
	for line in string.gmatch(contents, "[%w%s%d\"-_.]+") do
		table.insert(result, line)
	end
	return result
end
