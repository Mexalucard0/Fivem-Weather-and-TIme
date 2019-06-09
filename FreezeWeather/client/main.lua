--Made By Ramlov --

-- Allows you to set if weather should be frozen and what type of weather
local freezeWeather = true
local weather = "CLEAR"

-- Allows you to set if time should be frozen and what time
local freezeTime = false
local hours = 0
local minutes = 0

-- CODE -- Blackout means the city is all black
Citizen.CreateThread(function()
	SetBlackout(false)

	while true do
		Wait(1)

		if forceFirstPerson then
			SetFollowPedCamViewMode(4)
		end

        SetPlayerWantedLevel(PlayerId(), 0, false)
        SetPlayerWantedLevelNow(PlayerId(), false)

		if freezeWeather then
			SetWeatherTypePersist(weather)
        	SetWeatherTypeNowPersist(weather)
       		SetWeatherTypeNow(weather)
       		SetOverrideWeather(weather)
       	end

       	if freezeTime then
       		NetworkOverrideClockTime(hours, minutes, 0)
       	end
	end
end)

RegisterNetEvent("Z:timesync")
AddEventHandler("Z:timesync", function(time)
	if not freezeTime then
		NetworkOverrideClockTime(time.h, time.m, time.s)
	end
end)