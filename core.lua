local _midsummer, _midsummerNS = ...

local growthAmount = 66
local checkAll = false;
local extinguish = true;
local open = false
local continentButtons = {MidsummerFrameEasternKingdomsButton, MidsummerFrameKalimdorButton, MidsummerFrameOutlandButton, MidsummerFrameNorthrendButton, MidsummerFrameCataclysmButton, MidsummerFramePandariaButton, MidsummerFrameDraenorButton, MidsummerFrameBrokenIslesButton};

function _midsummerNS.outputProcess(result, objectives)
    local missingLocations = {}
    if checkAll == true then
        for k,v in pairs(objectives) 
                do 
                    print( k .. " " .. result[k] .. " " ..  tostring(IsQuestFlaggedCompleted(v))) 
        end
    else 
        for k, v in pairs(objectives)
            do 
                local testValue = IsQuestFlaggedCompleted(v)
                if (testValue == false) then
                    table.insert(missingLocations, result[k])
                end
        end
        
        if table.getn(missingLocations) > 0 then
            print ("You still need to visit the following locations: ")
            for k, v in pairs(missingLocations)
                do 
                    print(missingLocations[k])
            end
        else 
            print("You've completed all the objectives for this achievement.")
        end
    end        
end

function _midsummerNS.frameClicked(self)
    local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint();

    if (self:GetHeight() < 127 ) then 
        self:SetHeight(128)
        for k, v in pairs(continentButtons) do
            local vPoint, vRelativeTo, vRelativePOint, vXOfs, vYOfs = v:GetPoint()
            if (yOfs > vYOfs) then
                v:SetPoint("TOPLEFT", "MidsummerFrame", vXOfs, tostring((tonumber(vYOfs)) - (growthAmount)))
            end
        end
        if (open == false) then
            MidsummerFrame:SetHeight(MidsummerFrame:GetHeight() + (growthAmount))
            open = true
        end
    else
        self:SetHeight(62)
        for k, v in pairs(continentButtons) do
            local vPoint, vRelativeTo, vRelativePOint, vXOfs, vYOfs = v:GetPoint()
            if (yOfs > vYOfs) then
                v:SetPoint("TOPLEFT", "MidsummerFrame", vXOfs, tostring((tonumber(vYOfs)) + (growthAmount)))
            end
        end
        if (open == true) then
            MidsummerFrame:SetHeight(MidsummerFrame:GetHeight() - (growthAmount))
            open = false
        end
    end
end
