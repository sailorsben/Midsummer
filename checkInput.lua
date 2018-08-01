local _midsummer, _midsummerNS = ...

-- Continent Selection Keywords
local easternKingdomValidEntries = {"ek", "eastern kingdoms", "eastern", "east", "1"};
local kalimdorValidEntries = {"kmdr","kalimdor","kali", "2"};
local outlandValidEntries = {"ol", "outland", "out", "3"};
local northrendValidEntries = {"nr", "north", "rend", "northrend", "wotlk", "4"};
local cataclysmValidEntries = {"cata", "catclysm", "cat", "5"};
local pandariaValidEntries = {"pandaria", "pan", "panda", "mop", "6"};
local draenorValidEntries = {"wod", "draenor", "warlords", "warlords of draenor", "7"};
local brokenIslesValidEntries = {"bi", "broken isles", "broken", "isles", "legion", "8"};

-- Conditional Selections
local toggleRemainingValidEntries = {"remaining", "all", "toggle", "switch"}
local honorVsExtinguishValidEntries = {""}

--Input Found Toggle
local inputFound = false;

function _midsummerNS.checkInput(msg)
    local checkValue = string.lower(msg)
   
    _midsummerNS.checkInputValue(msg);

end

function _midsummerNS.checkInputValue(msg)
    _midsummerNS.checkEasternKingdoms(msg)
    _midsummerNS.checkKalimdor(msg)
    _midsummerNS.checkOutland(msg)
    _midsummerNS.checkNorthrend(msg)
    _midsummerNS.checkCataclysm(msg)
    _midsummerNS.checkPandaria(msg)
    _midsummerNS.checkDraenor(msg)
    _midsummerNS.checkBrokenIsles(msg)

    if inputFound == false then 
        _midsummerNS.commandInput(msg)
    end

    inputFound = false;
end

function _midsummerNS. commandInput(msg)
    checkValue = msg;
    if checkValue == "missing" then
        checkAll = false;
        print("Midsummer will now only show locations you haven't visited.")
    elseif checkValue == "all" then
        checkAll = true;
        print("Midsummer will now show all locations that you have and have not visited.")
    elseif checkValue == "extinguish" then
        extinguish = true;
        print ("Now checking Extinguish objectives. You can switch back to Honor objectives with the 'Honor' parameter.")
    elseif checkValue == "honor" then
        extinguish = false;
        print ("Now checking Honor the Flame objectives. You can switch back to Extinguish with the 'Extinguish' paramater.")
    elseif checkValue == "show" then
        extinguish = false;
        MidsummerFrame:Show();
    else
        _midsummerNS.instructions()
    end
end

function _midsummerNS.checkEasternKingdoms(msg)
    for k, v in pairs(easternKingdomValidEntries)
        do
            if easternKingdomValidEntries[k] == msg then
                if extinguish == false then
                    _midsummerNS.outputProcess(ek, ekQuests)
                else 
                    _midsummerNS.outputProcess(extinguishEk, extinguishEkQuests)
                end
                inputFound = true;
            end 
    end
end

function _midsummerNS.checkKalimdor(msg)
    for k, v in pairs(kalimdorValidEntries)
        do
            if kalimdorValidEntries[k] == msg then
                if extinguish == false then
                    _midsummerNS.outputProcess(kmdr, kmdrQuests)
                else 
                    _midsummerNS.outputProcess(extinguishKmdr, extinguishKmdrQuests)
                end
                inputFound = true;
            end 
    end
end

function _midsummerNS.checkOutland(msg)
    for k, v in pairs(outlandValidEntries)
        do
            if outlandValidEntries[k] == msg then
                if extinguish == false then
                    _midsummerNS.outputProcess(outland, outlandQuests)
                else 
                    _midsummerNS.outputProcess(extinguishOutland, extinguishOutlandQuests)
                end
                inputFound = true;
            end 
    end
end

function _midsummerNS.checkNorthrend(msg)
    for k, v in pairs(northrendValidEntries)
        do
            if northrendValidEntries[k] == msg then
                if extinguish == false then
                    _midsummerNS.outputProcess(northrend, northrendQuests)
                else 
                    _midsummerNS.outputProcess(extinguishNorthrend, extinguishNorthrendQuests)
                end
                inputFound = true;
            end 
    end
end

function _midsummerNS.checkCataclysm(msg)
    for k, v in pairs(cataclysmValidEntries)
        do
            if cataclysmValidEntries[k] == msg then
                if extinguish == false then
                    _midsummerNS.outputProcess(cataclysm, cataclysmQuests)
                else 
                    _midsummerNS.outputProcess(extinguishCataclysm, extinguishCataclysmQuests)
                end
                inputFound = true;
            end 
    end
end

function _midsummerNS.checkPandaria(msg)
    for k, v in pairs(pandariaValidEntries)
        do
            if pandariaValidEntries[k] == msg then
                if extinguish == false then
                    _midsummerNS.outputProcess(pandaria, pandariaQuests)
                else 
                    _midsummerNS.outputProcess(extinguishPandaria, extinguishPandariaQuests)
                end
                inputFound = true;
            end 
    end
end

function _midsummerNS.checkDraenor(msg)
    for k, v in pairs(draenorValidEntries)
        do
            if draenorValidEntries[k] == msg then
                if extinguish == false then
                    _midsummerNS.outputProcess(draenor, draenorQuests)
                else 
                    _midsummerNS.outputProcess(extinguishDraenor, extinguishDraenorQuests)
                end
                inputFound = true;
            end 
    end
end

function _midsummerNS.checkBrokenIsles(msg)
    for k, v in pairs(brokenIslesValidEntries)
        do
            if brokenIslesValidEntries[k] == msg then
                if extinguish == false then
                    _midsummerNS.outputProcess(brokenIsles, brokenIslesQuests)
                else 
                    _midsummerNS.outputProcess(extinguishBrokenIsles, extinguishBrokenIslesQuests)
                end
                inputFound = true;
            end 
    end
end
