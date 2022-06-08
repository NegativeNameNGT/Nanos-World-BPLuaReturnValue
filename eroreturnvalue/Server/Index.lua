Events.Subscribe("ServerGetValue", function(player, code, name)
	local value = load(code)()
	Events.CallRemote("ServerReturnValueCallback", player, value, name)
end)