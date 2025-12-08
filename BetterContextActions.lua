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