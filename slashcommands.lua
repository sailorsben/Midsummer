local _midsummer, _midsummerNS = ...

SLASH_COMMAND_MIDSUMMER1 = "/midsummer"
SLASH_COMMAND_MIDSUMMER2 = "/ms"

SlashCmdList["COMMAND_MIDSUMMER"] = function(msg)
    
    if msg ~= "" then
        _midsummerNS.checkInput(msg)
    else
        _midsummerNS.instructions()
    end
end