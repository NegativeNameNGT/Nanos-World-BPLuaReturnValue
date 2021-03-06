local timer_interval = 20

utils = Blueprint(
	Vector(0,0,0),
	Rotator(0,0,0),
	"bp-returnvalue::UtilActor"
)

function GetUtilsActor()
	return utils
end
Package.Export("GetUtilsActor", GetUtilsActor)

local function ParseIntoArray(s, delimiter)
    local result = {};
        for match in (s..delimiter):gmatch("(.-)"..delimiter) do
            table.insert(result, match)
        end
        return result
end

Package.Subscribe("Load", function()
    Timer.SetInterval(function()
         for k,v in pairs(utils:GetActorTags()) do
             local name = ParseIntoArray(v, "&")
             local params = ParseIntoArray(name[2], "||")
             Events.Call(name[1], table.unpack(params))
             utils:RemoveActorTag(v)
         end
    end, timer_interval)
end)


Events.Subscribe("OnReturnValueBP", function(is_serverside, name, code)
	
	if is_serverside == 'true' then
		Events.CallRemote("ServerGetValue", code, name)
	else
		local value = load(code)()
		utils:CallBlueprintEvent("ExecuteReturnValueCallback", value, name)
	end
	
end)

Events.Subscribe("ServerReturnValueCallback", function(value, name)
	utils:CallBlueprintEvent("ExecuteReturnValueCallback", value, name)
end)
