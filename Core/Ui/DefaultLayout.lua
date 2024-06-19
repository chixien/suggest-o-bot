print("Hello, welcome to suggest-o-bot")

-- Create the slash command
SLASH_SBOT1 = "/sob"
SLASH_SBOT2 = "/sbot"
SLASH_NEWRELOAD1 = "/rl"

-- For quick reloads
SlashCmdList.NEWRELOAD = ReloadUI
SlashCmdList["SBOT"] = function(msg)
    SuggestOBotFrame_ToggleFrame()
end

-- Function to create and show the frame
function SuggestOBotFrame_CreateFrame()
    if not SuggestOBotFrame then
        -- Create the frame
        local frame = CreateFrame("Frame", "SuggestOBotFrame", UIParent, "BackdropTemplate")
        local playerName = UnitName("player") or "Unknown Player"  
        frame:SetSize(300, 200)  -- Set the size of the frame (width, height)
        frame:SetPoint("CENTER") -- Position the frame in the center of the screen

        -- Set the backdrop (background) of the frame
        frame:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true,
            tileSize = 32,
            edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 }
        })

        -- Optional: Set the frame to be draggable
        frame:EnableMouse(true)
        frame:SetMovable(true)
        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnDragStart", frame.StartMoving)
        frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

        -- Create a FontString for the text
        local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        text:SetPoint("CENTER", frame, "CENTER", 0, 0)    -- Position the text in the center of the frame
        text:SetText(string.format("Hello, welcome to Suggest-O-Bot, %s!", playerName))  -- Set the text to display

        -- Save the frame to the global variable
        SuggestOBotFrame = frame
        SuggestOBotFrame.text = text
    end
end

-- Function to toggle the frame visibility
function SuggestOBotFrame_ToggleFrame()
    if not SuggestOBotFrame then
        SuggestOBotFrame_CreateFrame()
        SuggestOBotFrame:Show()
    else
        if SuggestOBotFrame:IsShown() then
            SuggestOBotFrame:Hide()
        else
            SuggestOBotFrame:Show()
        end
    end
end