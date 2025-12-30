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


WoodHarvesterExtension = {}
function WoodHarvesterExtension:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
    local spec = self.spec_woodHarvester;
    if self.isClient then
        local actionEvent = spec.actionEvents[InputAction.IMPLEMENT_EXTRA2];
        if actionEvent ~= nil then
            local showAction = false
            if spec.hasAttachedSplitShape then
                if not spec.isAttachedSplitShapeMoving and self:getAnimationTime(spec.cutAnimation.name) == 1 then
                    showAction = true
                end
            elseif spec.curSplitShape ~= nil then
                showAction = true
            end

            if showAction then
                g_currentMission.hud.contextActionDisplay:setContext(InputAction.IMPLEMENT_EXTRA2, ContextActionDisplay.CONTEXT_ICON.FILL_BOWL, spec.texts.actionCut, HUD.CONTEXT_PRIORITY.HIGH, g_i18n:getText("ui_action"));
            end
        end
    end
end

WoodHarvester.onUpdateTick = Utils.appendedFunction(WoodHarvester.onUpdateTick, WoodHarvesterExtension.onUpdateTick)