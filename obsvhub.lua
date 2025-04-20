local HttpService = game:GetService("HttpService")
local d = assert(loadstring(game:HttpGet("https://sirius.menu/rayfield", true)))()
repeat task.wait() until game:IsLoaded()
local e = d:CreateWindow({Name="ObservationHub | by R.K",LoadingTitle="ObservationHub",LoadingSubtitle="by R.K",ConfigurationSaving={Enabled=false},KeySystem=false})
local f = e:CreateTab("Main",4483362458)
f:CreateInput({Name="Enter Your Key",PlaceholderText="Paste your key here…",RemoveTextAfterFocusLost=false,Callback=function(raw)
    local key = raw:gsub("`",""):match("([%w%-]+)")
    if not key then return d:Notify({Title="Error",Content="Please paste just the key (no backticks)",Duration=5}) end
    local ok,res = pcall(function()
        return game:HttpGet("https://observationhaki.onrender.com/validateKey?key="..HttpService:UrlEncode(key),true)
    end)
    if not ok then return d:Notify({Title="Error",Content="Could not reach validation server",Duration=5}) end
    local success,data = pcall(function() return HttpService:JSONDecode(res) end)
    if not success then return d:Notify({Title="Error",Content="Unexpected server response",Duration=5}) end
    if data.valid then
        d:Notify({Title="Success",Content="Key accepted! Press F to toggle observation.",Duration=5})
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/legend09271/0bs3rvasy0n/refs/heads/main/ESP_Remote.lua",true))()
        end)
        task.delay(5,function() pcall(function() d:Destroy() end) end)
    else
        d:Notify({Title="Invalid Key",Content=data.message or"Key not found or expired.",Duration=6})
    end
end})
f:CreateButton({Name="Get Key",Callback=function()
    setclipboard("https://lootdest.org/s?SpkvPv1Z")
    d:Notify({Title="Copied!",Content="Ad link copied to clipboard.",Duration=4})
end})
d:Notify({Title="Get a Key",Content="Click OK to visit our ad link to generate a key.",Duration=6.5,Actions={Ignore={Name="OK",Callback=function()
    setclipboard("https://lootdest.org/s?SpkvPv1Z")
    d:Notify({Title="Copied!",Content="Ad link copied to clipboard.",Duration=4})
end}}})
