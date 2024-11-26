CheckCar = -1
amount = 0 
Last_CarHP = 0 
local carEx

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end 
    lua_thread.create(CarCheckings)
    sampRegisterChatCommand("hpchecker", checkhp)
end

function checkhp(arg)
    local argum = tonumber(arg)  -- Use local variable to prevent global scope pollution
    if argum then
        CheckCar = -1
amount = 0 
Last_CarHP = 0
        sampAddChatMessage('Warmateba!', -1)
        result, carEx = sampGetCarHandleBySampVehicleId(argum)
        Last_CarHP = getCarHealth(carEx)  -- Assuming getCarHealth is valid and works with the car ID
        CheckCar = argum  -- Store the car ID in a global or predefined variable
    else 
        sampAddChatMessage('Invalid argument!', -1)  -- Improved error message for clarity
    end
end

function CarCheckings()
    while  true do 
        wait(100)
if CheckCar ~= -1 then
    if getCarHealth(carEx) ~= Last_CarHP then 
        amount = amount + 1 
        sampAddChatMessage(string.format('NewHP - %s | OLD HP - %s ', tostring(getCarHealth(carEx)), tostring(Last_CarHP)), -1)
        sampAddChatMessage('Manqanas Daaklda HP Raodenoba -> '..amount, -1)
        sampSendChat(string.format('NewHP - %s | OLD HP - %s  | DMG: %s', tostring(getCarHealth(carEx)), tostring(Last_CarHP), tostring(amount)), -1)
    end 
    Last_CarHP = getCarHealth(carEx)
end
end
end

