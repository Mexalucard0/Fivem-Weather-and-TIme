--Made by Ramlov
players = {}

RegisterServerEvent("Z:newplayer")
AddEventHandler("Z:newplayer", function(id)
    players[source] = id
    TriggerClientEvent("Z:playerUpdate", -1, players)
end)

AddEventHandler("playerDropped", function(reason)
    players[source] = nil
    TriggerClientEvent("Z:cleanup", source)
    TriggerClientEvent("Z:playerUpdate", -1, players)
end)


AddEventHandler("onResourceStop", function()
	 TriggerClientEvent("Z:cleanup", -1)
end)

function stringSplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end