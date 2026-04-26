local URL = "https://raw.githubusercontent.com/RNMAMNS/lol/main/test4_remote.obf.lua"

local ok, source = pcall(function()
    return game:HttpGet(URL, true)
end)

if not ok or type(source) ~= "string" or #source < 1 then
    error("[test4_loader] failed to fetch remote script: " .. tostring(source))
end

local chunk, loadErr = loadstring(source)
if not chunk then
    error("[test4_loader] failed to compile remote script: " .. tostring(loadErr))
end

return chunk()
