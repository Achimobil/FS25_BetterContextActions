--[[
Copyright (C) Achimobil, 2024-2025

Author: Achimobil

Important:
No copy and use in own mods allowed.

Das verändern und wiederöffentlichen, auch in Teilen, ist untersagt und wird abgemahnt.
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