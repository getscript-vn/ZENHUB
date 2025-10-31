local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local AZT_ = loadstring(game:HttpGet("https://new.cswz.site/script.lua"))()
getgenv().AZTSettings = {
    Hub="ZENHUB",
    Key=false,
    script_loaded=false,
    file="ZenHubKey.txt",
}
function N_(text)
    Fluent:Notify({
        Title = "ZEN HUB",
        Content = text,
        SubContent = "AZT-Version-1.0.1",
        Duration = 5
    })
end
function Load()
loadstring(game:HttpGet('https://upload.cswz.site/api/423835553404195.lua'))()
end
function AZT()
    if getgenv().AZTSettings.Key == false then
        N_("Vui Lòng Nhập Key.")
        else 
        local AZT_call,AZT_log=AZT_(tostring(getgenv().AZTSettings.Key))
        if AZT_call then
        Load()
        getgenv().AZTSettings.script_loaded = true
        writefile(file,tostring(getgenv().AZTSettings.Key))
        return true
        else
        N_(AZT_log)
        end
    end
end
if isfile(tostring(getgenv().AZTSettings.file)) then getgenv().AZTSettings.Key = readfile(tostring(getgenv().AZTSettings.file)) AZT() end
if getgenv().AZTSettings.script_loaded then N_('ZEN HUB Đã Hoạt Động') return end
local Window = Fluent:CreateWindow({Title = "ZENHUB " .. Fluent.Version,SubTitle = "Loader",TabWidth = 160,Size = UDim2.fromOffset(580, 460),Acrylic = true,Theme = "Darker",MinimizeKey = Enum.KeyCode.LeftControl})
local Tabs = {Main = Window:AddTab({ Title = "Main", Icon = "" })}
Tabs.Main:AddInput("Keybox",{Title="Vui Lòng Nhập Key Vào Textbox",Default="",Placeholder="Key",Numeric=false,Finished=false,Callback=function(a)getgenv().AZTSettings.Key=a end})
Tabs.Main:AddButton({Title="Kiểm Tra Key",Description="Kiểm Tra Key ZenHub để có thể sử dụng",Callback=function() if AZT() then Window:Destroy() end end})
Tabs.Main:AddButton({Title="Sao Chép Link Get Key",Description="Sao Chép Link Để Nhận Key",Callback=function()setclipboard('https://new.cswz.site/ZENHUB')N_("Đã Copy Link")end})
Window:SelectTab(1)
