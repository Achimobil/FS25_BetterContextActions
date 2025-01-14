--[[
Copyright (C) Achimobil, 2024

Author: Achimobil

Contact:
https://github.com/Achimobil/FS25_BetterContextActions


Important:
No copy and use in own mods allowed.

Das verändern und wiederöffentlichen, auch in Teilen, ist untersagt und wird abgemahnt.
]]

BetterContextActions = {}
BetterContextActions.Debug = true;

BetterContextActions.metadata = {
    title = "BetterContextActions",
    author = "Achimobil",
    info = "Das verändern und wiederöffentlichen, auch in Teilen, ist untersagt und wird abgemahnt."
};
BetterContextActions.modDir = g_currentModDirectory;

--- Print the given Table to the log
-- @param string text parameter Text before the table
-- @param table myTable The table to print
-- @param integer? maxDepth depth of print, default 2
function BetterContextActions.DebugTable(text, myTable, maxDepth)
    if not BetterContextActions.Debug then return end
    if myTable == nil then
        print("ActivatableObjectsSystemExtensionDebug: " .. text .. " is nil");
    else
        print("ActivatableObjectsSystemExtensionDebug: " .. text)
        DebugUtil.printTableRecursively(myTable,"_",0, maxDepth or 2);
    end
end

---Print the text to the log. Example: ProductionInfoHud.DebugText("Alter: %s", age)
-- @param string text the text to print formated
-- @param any ... format parameter
function BetterContextActions.DebugText(text, ...)
    if not BetterContextActions.Debug then return end
    print("ActivatableObjectsSystemExtensionDebug: " .. string.format(text, ...));
end