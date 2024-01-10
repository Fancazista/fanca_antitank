CreateThread(function()
    Debug("my ped: " .. cache.ped)
    SetPedConfigFlag(cache.ped, 438, Config.disableHelmetArmor)

    do
        local rianima = function()
            if IsEntityDead(cache.ped) then
                NetworkResurrectLocalPlayer(GetEntityCoords(cache.ped), 0.0)
                cache.ped = PlayerPedId()
            end

            -- SetEntityVisible(cache.ped, true, true)
            -- SetEntityAlpha(cache.ped, 255, false)
            -- SetBlockingOfNonTemporaryEvents(cache.ped, false)
            ClearPedBloodDamage(cache.ped)
            ClearPedLastDamageBone(cache.ped)
            ClearEntityLastDamageEntity(cache.ped)
    
            lib.notify({description="Ped revived."})
        end

        if Config.respawnOnScriptStart then
            rianima()
        end

        if Config.respawnCommand then
            RegisterCommand("rianima", rianima)
        end
    end
end)

local function check(ped)
    return DoesEntityExist(ped) and not GetPlayerInvincible(ped)
end

lib.callback.register("fanca_antitank:damage", function(ped, damage)
    local targetPed = NetworkGetEntityFromNetworkId(ped)

    if check(targetPed) then
        Debug("apply damage " .. damage .. " to ped " .. targetPed)
        ApplyDamageToPed(targetPed, damage, true)
    end
end)

lib.callback.register("fanca_antitank:kill", function(ped)
    local targetPed = NetworkGetEntityFromNetworkId(ped)

    if check(targetPed) then
        Debug("fatal hit to ped " .. targetPed)
        SetEntityHealth(targetPed, 0)
    end
end)
