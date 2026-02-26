-- Voidex UI Library - Example Script
-- Load the library
local Voidex = loadstring(game:HttpGet("https://raw.githubusercontent.com/nothubman/Voidex-UI-Library/refs/heads/main/Library.lua"))()

-- Voidex.Flags holds all current values, indexed by the Flag you pass to each element
-- Example: Voidex.Flags["AimbotEnabled"] gives you the current toggle state
local Flags = Voidex.Flags

-- Create the main window
-- Name = the title shown in the title bar
local Window = Voidex.new({
    Name = "My Hub",
})

-- ─────────────────────────────────────────────
--  TABS
--  Window:CreateTab(name, iconId)
--  iconId is a Roblox asset id for the tab icon (optional, pass nil to skip)
-- ─────────────────────────────────────────────

local MainTab    = Window:CreateTab("Main",    4483362458)
local CombatTab  = Window:CreateTab("Combat",  4483362458)
local MiscTab    = Window:CreateTab("Misc",    nil)

-- ─────────────────────────────────────────────
--  SECTION  (visual divider / header inside a tab)
--  Tab:CreateSection(name)
-- ─────────────────────────────────────────────

MainTab:CreateSection("Player")

-- ─────────────────────────────────────────────
--  TOGGLE
--  Tab:CreateToggle({ Name, Flag, CurrentValue, Callback })
--  Name         = label shown next to the toggle
--  Flag         = key used to read the value from Voidex.Flags
--  CurrentValue = starting state (true / false)
--  Callback     = function called every time the toggle changes
-- ─────────────────────────────────────────────

local MyToggle = MainTab:CreateToggle({
    Name         = "God Mode",
    Flag         = "GodMode",
    CurrentValue = false,
    Callback     = function(value)
        print("God Mode:", value)
    end,
})

-- You can also set the toggle from code at any time
-- MyToggle:Set(true)

-- Read the current value anywhere via Flags
-- print(Voidex.Flags["GodMode"])

-- ─────────────────────────────────────────────
--  SLIDER
--  Tab:CreateSlider({ Name, Flag, Range, Increment, CurrentValue, Callback })
--  Range     = { min, max }
--  Increment = step size between values
-- ─────────────────────────────────────────────

local SpeedSlider = MainTab:CreateSlider({
    Name         = "Walk Speed",
    Flag         = "WalkSpeed",
    Range        = { 16, 250 },
    Increment    = 1,
    CurrentValue = 16,
    Callback     = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
})

-- SpeedSlider:Set(100) -- set from code

local JumpSlider = MainTab:CreateSlider({
    Name         = "Jump Power",
    Flag         = "JumpPower",
    Range        = { 0, 500 },
    Increment    = 5,
    CurrentValue = 50,
    Callback     = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end,
})

-- ─────────────────────────────────────────────
--  BUTTON
--  Tab:CreateButton({ Name, Callback })
-- ─────────────────────────────────────────────

MainTab:CreateButton({
    Name     = "Teleport to Spawn",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char then
            char.HumanoidRootPart.CFrame = CFrame.new(0, 5, 0)
        end
    end,
})

-- ─────────────────────────────────────────────
--  TEXTBOX
--  Tab:CreateTextbox({ Name, Flag, PlaceholderText, CurrentValue, Callback })
--  Callback fires when the textbox loses focus
--  The second argument to Callback is true if the user pressed Enter
-- ─────────────────────────────────────────────

MainTab:CreateTextbox({
    Name            = "Set Name Tag",
    Flag            = "NameTag",
    PlaceholderText = "Enter name...",
    CurrentValue    = "",
    Callback        = function(value, pressedEnter)
        print("Name tag set to:", value, "| Pressed enter:", pressedEnter)
    end,
})

-- ─────────────────────────────────────────────
--  DROPDOWN
--  Tab:CreateDropdown({ Name, Flag, Options, CurrentValue, Callback })
--  Options      = table of string choices
--  CurrentValue = which option is selected by default
-- ─────────────────────────────────────────────

local TeamDropdown = MainTab:CreateDropdown({
    Name         = "Select Team",
    Flag         = "SelectedTeam",
    Options      = { "Red", "Blue", "Green", "Yellow" },
    CurrentValue = "Red",
    Callback     = function(value)
        print("Team selected:", value)
    end,
})

-- TeamDropdown:Set("Blue")             -- set selected option from code
-- TeamDropdown:Refresh({ "A", "B" })   -- replace the options list entirely

-- ─────────────────────────────────────────────
--  LABEL
--  Tab:CreateLabel(text)
--  Simple read-only text line, no interaction
-- ─────────────────────────────────────────────

MainTab:CreateLabel("Some info text here")

-- ─────────────────────────────────────────────
--  PARAGRAPH
--  Tab:CreateParagraph({ Title, Content })
--  A small card with an optional bold title and body text
-- ─────────────────────────────────────────────

MainTab:CreateParagraph({
    Title   = "About",
    Content = "This hub was made with Voidex v2.0.\nDrag the window anywhere on screen.",
})

-- ─────────────────────────────────────────────
--  COMBAT TAB
-- ─────────────────────────────────────────────

CombatTab:CreateSection("Aimbot")

CombatTab:CreateToggle({
    Name         = "Aimbot",
    Flag         = "AimbotEnabled",
    CurrentValue = false,
    Callback     = function(value)
        print("Aimbot:", value)
    end,
})

CombatTab:CreateSlider({
    Name         = "FOV",
    Flag         = "AimbotFOV",
    Range        = { 10, 500 },
    Increment    = 10,
    CurrentValue = 100,
    Callback     = function(value)
        print("Aimbot FOV:", value)
    end,
})

CombatTab:CreateSlider({
    Name         = "Smoothness",
    Flag         = "AimbotSmooth",
    Range        = { 1, 100 },
    Increment    = 1,
    CurrentValue = 50,
    Callback     = function(value)
        print("Aimbot Smooth:", value)
    end,
})

CombatTab:CreateSection("Visual")

CombatTab:CreateToggle({
    Name         = "ESP",
    Flag         = "ESPEnabled",
    CurrentValue = false,
    Callback     = function(value)
        print("ESP:", value)
    end,
})

CombatTab:CreateColorPicker({
    Name     = "ESP Color",
    Flag     = "ESPColor",
    Color    = Color3.fromRGB(255, 0, 0),
    Callback = function(value)
        -- value is a Color3
        print("ESP Color changed:", value)
    end,
})

-- ─────────────────────────────────────────────
--  MISC TAB
-- ─────────────────────────────────────────────

MiscTab:CreateSection("Keybinds")

-- KEYBIND
-- Tab:CreateKeybind({ Name, Flag, CurrentKeybind, Callback })
-- Click the keybind box in-game then press any key to set it
-- Callback fires when a new key is bound, with the KeyCode as the argument
local UIKeybind = MiscTab:CreateKeybind({
    Name           = "Toggle UI",
    Flag           = "UIKeybind",
    CurrentKeybind = "RightShift",
    Callback       = function(keyCode)
        print("New keybind set:", keyCode.Name)
    end,
})

-- UIKeybind:Set("F") -- set from code

MiscTab:CreateSection("Settings")

MiscTab:CreateButton({
    Name     = "Reset All Flags",
    Callback = function()
        for k in pairs(Voidex.Flags) do
            Voidex.Flags[k] = nil
        end
        print("All flags cleared")
    end,
})

-- ─────────────────────────────────────────────
--  NOTIFY  (global popup notification)
--  Voidex:Notify({ Title, Content, Duration, Type })
--  Type = "info" | "success" | "warning" | "error"
-- ─────────────────────────────────────────────

Voidex:Notify({
    Title    = "Voidex Loaded",
    Content  = "Hub injected successfully.",
    Duration = 4,
    Type     = "success",
})

-- More notification examples:
-- Voidex:Notify({ Title = "Warning", Content = "Something went wrong.", Duration = 3, Type = "warning" })
-- Voidex:Notify({ Title = "Error",   Content = "Script failed.",        Duration = 3, Type = "error"   })
-- Voidex:Notify({ Title = "Info",    Content = "Just letting you know.",Duration = 3, Type = "info"    })
