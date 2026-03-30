local OR, AND = 1, 4

local HANDLING_FLAGS = {
    256, -- HF_FREEWHEEL_NO_GAS
}

local ADVANCED_FLAGS = {
    134217728, -- CF_USE_DOWNFORCE_BIAS
}

local LOWRIDERS = {
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

local function bitOper(flag, checkFor, oper)
    local result, mask, sum = 0, 2 ^ 31

    repeat
        sum, flag, checkFor = flag + checkFor + mask, flag % mask, checkFor % mask
        result, mask = result + mask * oper % (sum - flag - checkFor), mask / 2
    until mask < 1

    return result
end

local function isLowrider(vehicle)
    local model = GetEntityModel(vehicle)
    local modelName = GetDisplayNameFromVehicleModel(model):lower()

    if LOWRIDERS[modelName] then
        return true
    end

    return GetVehicleModKitType(vehicle) == 1
end

local function applyFlags(vehicle, handlingClass, fieldName, flagsToApply)
    local flags = GetVehicleHandlingInt(vehicle, handlingClass, fieldName)
    local changed = false

    for i = 1, #flagsToApply do
        local flagValue = flagsToApply[i]

        if bitOper(flags, flagValue, AND) ~= flagValue then
            flags = bitOper(flags, flagValue, OR)
            changed = true
        end
    end

    if changed then
        SetVehicleHandlingField(vehicle, handlingClass, fieldName, math.floor(flags))
    end
end

local function applyVehicleFlags(vehicle)
    applyFlags(vehicle, 'CHandlingData', 'strHandlingFlags', HANDLING_FLAGS)

    if not isLowrider(vehicle) then
        applyFlags(vehicle, 'CCarHandlingData', 'strAdvancedFlags', ADVANCED_FLAGS)
    end
end

CreateThread(function()
    local lastVehicle = nil

    while true do
        Wait(500)

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and vehicle ~= lastVehicle then
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                lastVehicle = vehicle
                applyVehicleFlags(vehicle)
            end
        elseif vehicle == 0 then
            lastVehicle = nil
        end
    end
end)
