--[[
Copyright (c) 2024-2025 Achimobil. All rights reserved.

Author:  Achimobil
Contact: https://github.com/Achimobil/FS25_BetterContextActions

License / Nutzung:
This script is part of the mod "FS25_BetterContextActions".
You are NOT allowed to copy, modify, redistribute, re-upload, or use this script
(or parts of it) in your own mods or other projects.

Urheberrecht / Nutzung:
Dieses Skript ist Bestandteil des Mods „FS25_BetterContextActions“.
Das Kopieren, Verändern, Weitergeben oder Wiederveröffentlichen –
ganz oder in Teilen – sowie die Verwendung in eigenen Mods
oder anderen Projekten ist ohne vorherige, schriftliche Zustimmung
strengstens untersagt und wird abgemahnt.
]]



ActivatableObjectsSystemExtension = {}

---Called on update
-- @param float dt time since last call in ms
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
--             BetterContextActions.DebugTable("ContextActionDisplay", ContextActionDisplay.CONTEXT_ICON, 1)
--             BetterContextActions.DebugTable("currentActivatableObject", currentActivatableObject)

            -- Filltype mit anzeigen, wenn vorhanden
            local activateText = currentActivatableObject.activateText;

            if currentActivatableObject.fillTypeIndex ~= nil then
                local fillTypeName = g_fillTypeManager:getFillTypeTitleByIndex(currentActivatableObject.fillTypeIndex);
                activateText = string.format("%s (%s)", activateText, fillTypeName);
            end

            g_currentMission.hud.contextActionDisplay:setContext(InputAction.ACTIVATE_OBJECT, ContextActionDisplay.CONTEXT_ICON.ATTACH, activateText, HUD.CONTEXT_PRIORITY.LOW, g_i18n:getText("ui_action"));
            -- g_currentMission.hud.contextActionDisplay:setContext(InputAction.ACTIVATE_OBJECT, "gui.icon_options_help2", currentActivatableObject.activateText, HUD.CONTEXT_PRIORITY.LOW, "$l10n_Activateable object")
            -- g_currentMission.hud.contextActionDisplay:setContext(InputAction.ACTIVATE_OBJECT, nil, currentActivatableObject.activateText, HUD.CONTEXT_PRIORITY.LOW, "Activateable object")
        end
    end
end

ActivatableObjectsSystem.update = Utils.appendedFunction(ActivatableObjectsSystem.update, ActivatableObjectsSystemExtension.update)