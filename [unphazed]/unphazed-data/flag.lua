local OR, XOR, AND = 1, 3, 4

local function bitOper(flag, checkFor, oper)
    local result, mask, sum = 0, 2 ^ 31
    repeat
        sum, flag, checkFor = flag + checkFor + mask, flag % mask, checkFor % mask
        result, mask = result + mask * oper % (sum - flag - checkFor), mask / 2
    until mask < 1
    return result
end

local lowriders = {
    voodoo = true,
    chino2 = true,
    faction2 = true,
    faction3 = true,
    moonbeam2 = true,
    primo2 = true,
    buccaneer2 = true,
    sabregt2 = true,
    minivan2 = true,
    tornado5 = true,
    peyote3 = true,
    manana2 = true,
    slamvan3 = true,
    virgo2 = true,
}

local function isLowrider(vehicle)
    local model = GetEntityModel(vehicle)
    local modelName = GetDisplayNameFromVehicleModel(model):lower()

    if lowriders[modelName] then
        return true
    end

    if GetVehicleModKitType(vehicle) == 1 then
        return true
    end

    return false
end

local function addDownforceFlag(vehicle)
    if isLowrider(vehicle) then
        return
    end

    local adv_flags = GetVehicleHandlingInt(vehicle, 'CCarHandlingData', 'strAdvancedFlags')
    local hasDownforceFlag = bitOper(adv_flags, 134217728, AND) == 134217728

    if not hasDownforceFlag then
        adv_flags = bitOper(adv_flags, 134217728, OR)
        SetVehicleHandlingField(vehicle, 'CCarHandlingData', 'strAdvancedFlags', math.floor(adv_flags))
    end
end

CreateThread(function()
    local lastVehicle = nil

    while true do
        Wait(500)

        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)

        if veh ~= 0 and veh ~= lastVehicle then
            if GetPedInVehicleSeat(veh, -1) == ped then
                lastVehicle = veh
                addDownforceFlag(veh)
            end
        elseif veh == 0 then
            lastVehicle = nil
        end
    end
end)
