--[[
Copyright (C) Achimobil, 2024-2025

Author: Achimobil

Important:
No copy and use in own mods allowed.

Das verändern und wiederöffentlichen, auch in Teilen, ist untersagt und wird abgemahnt.
]]

ActivatableObjectsSystemExtension = {}
function ActivatableObjectsSystemExtension:update(dt)

    local activatableObjectsSystem = g_currentMission.activatableObjectsSystem;
    local currentActivatableObject = activatableObjectsSystem.currentActivatableObject;

    if currentActivatableObject ~= nil then

        -- Auswerten wann es nicht angezeigt werden darf
        local showAction = true;
        if currentActivatableObject.getIsActivatable ~= nil then
            if currentActivatableObject:getIsActivatable(activatableObjectsSystem.dirX, activatableObjectsSystem.dirY, activatableObjectsSystem.dirZ) == false then
                showAction = false;
            end
        end

        if showAction and currentActivatableObject.getHasAccess ~= nil then
            local farmId = g_currentMission:getFarmId();
            if currentActivatableObject:getHasAccess(farmId) == false then
                showAction = false;
            end
        end

        if activatableObjectsSystem.actionEventId ~= nil and showAction then

            -- BetterContextActions.DebugTable("InGameMenu", InGameMenu, 1)
            -- BetterContextActions.DebugTable("ContextActionDisplay", ContextActionDisplay.CONTEXT_ICON, 1)

            g_currentMission.hud.contextActionDisplay:setContext(InputAction.ACTIVATE_OBJECT, ContextActionDisplay.CONTEXT_ICON.ATTACH, currentActivatableObject.activateText, HUD.CONTEXT_PRIORITY.LOW, g_i18n:getText("ui_action"));
            -- g_currentMission.hud.contextActionDisplay:setContext(InputAction.ACTIVATE_OBJECT, "gui.icon_options_help2", currentActivatableObject.activateText, HUD.CONTEXT_PRIORITY.LOW, "$l10n_Activateable object")
            -- g_currentMission.hud.contextActionDisplay:setContext(InputAction.ACTIVATE_OBJECT, nil, currentActivatableObject.activateText, HUD.CONTEXT_PRIORITY.LOW, "Activateable object")
        end
    end
end

ActivatableObjectsSystem.update = Utils.appendedFunction(ActivatableObjectsSystem.update, ActivatableObjectsSystemExtension.update)