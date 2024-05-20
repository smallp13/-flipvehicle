-- Flip car script

RegisterCommand("flip", function(source, args, rawCommand)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if DoesEntityExist(vehicle) then
        local vehicleRotation = GetEntityRotation(vehicle, 2)

        -- Calculate the flipped rotation by rotating 180 degrees along the pitch axis
        local flippedRotation = vector3(vehicleRotation.x + 180.0, vehicleRotation.y, vehicleRotation.z + 180.0)

        SetEntityRotation(vehicle, flippedRotation.x, flippedRotation.y, flippedRotation.z, 2, true)

        drawNotification("~g~Vehicle Flipped.")
    else
        drawNotification("~r~You are not in a vehicle!")
    end
end, false)

function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end