AddEventHandler("weaponDamageEvent", function(player, data)
    CancelEvent()

    local targetPed = NetworkGetEntityFromNetworkId(data.hitGlobalId)
    local target = NetworkGetEntityOwner(targetPed)

    Debug(("Player: %s | Target: %s"):format(player, target))

    if target then
        -- local isTargetInvincible = GetPlayerInvincible(targetPed)
        Debug(("Data: %s"):format(json.encode(data, {indent=true})))
        -- if isTargetInvincible then return end

        if (data.willKill) then
            SetPedArmour(targetPed, 0)
            lib.callback.await("fanca_antitank:kill", -1, data.hitGlobalId)
        elseif (GetEntityHealth(targetPed) > 0) then
            lib.callback.await("fanca_antitank:damage", -1, data.hitGlobalId, data.weaponDamage)
        end
    end
end)