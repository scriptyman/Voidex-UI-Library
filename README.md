# Voidex UI Library

A modern, clean, and powerful Roblox UI library with full flag support, notifications, and dynamic element control.

Full API support for:
Voidex (Recommended), 
Rayfield  ,     
OrionLib      , 
Linoria        , 
Kavo           , 
Censura        , 
Fluent       , 
Zyra          , 
WindUI, 


---

## 📥 Install-tion

```lua
local Voidex = loadstring(game:HttpGet("https://raw.githubusercontent.com/nothubman/Voidex-UI-Library/refs/heads/main/Library.lua"))()


---

🪟 Create Window

local Window = Voidex.new({
    Name = "Your Hub Name"
})


---

📑 Create Tab

local Tab = Window:CreateTab("Main", 4483362458) -- icon optional


---

📂 Create Section

Tab:CreateSection("Section Name")


---

🔘 Toggle

local Toggle = Tab:CreateToggle({
    Name = "Toggle Name",
    Flag = "ToggleFlag",
    CurrentValue = false,
    Callback = function(Value)
        print(Value)
    end
})

Toggle:Set(true)


---

🎚 Slider

local Slider = Tab:CreateSlider({
    Name = "Slider Name",
    Flag = "SliderFlag",
    Range = {0, 100},
    Increment = 1,
    CurrentValue = 0,
    Callback = function(Value)
        print(Value)
    end
})

Slider:Set(50)


---

🔘 Button

Tab:CreateButton({
    Name = "Button Name",
    Callback = function()
        print("Clicked")
    end
})


---

⌨ Textbox

Tab:CreateTextbox({
    Name = "Textbox Name",
    Flag = "TextboxFlag",
    PlaceholderText = "Enter text",
    CurrentValue = "",
    Callback = function(Value, PressedEnter)
        print(Value, PressedEnter)
    end
})


---

📋 Dropdown

local Dropdown = Tab:CreateDropdown({
    Name = "Dropdown Name",
    Flag = "DropdownFlag",
    Options = {"Option 1","Option 2"},
    CurrentValue = "Option 1",
    Callback = function(Value)
        print(Value)
    end
})

Dropdown:Set("Option 2")
Dropdown:Refresh({"New Option"})


---

🎨 Color Picker

local ColorPicker = Tab:CreateColorPicker({
    Name = "Color Picker",
    Flag = "ColorFlag",
    Color = Color3.fromRGB(255,255,255),
    Callback = function(Color)
        print(Color)
    end
})

ColorPicker:Set(Color3.fromRGB(255,0,0))


---

⌨ Keybind

local Keybind = Tab:CreateKeybind({
    Name = "Keybind Name",
    Flag = "KeybindFlag",
    CurrentKeybind = "RightShift",
    Callback = function(Key)
        print(Key.Name)
    end
})

Keybind:Set("F")


---

🏷 Label

Tab:CreateLabel("Label Text")


---

📄 Paragraph

Tab:CreateParagraph({
    Title = "Paragraph Title",
    Content = "Paragraph content here."
})


---

🔔 Notifications

Voidex:Notify({
    Title = "Notification Title",
    Content = "Notification Content",
    Duration = 3,
    Type = "info"
})

Types

info
success
warning
error


---

🚩 Flags System

All elements with a Flag automatically store their value.

print(Voidex.Flags["ToggleFlag"])


---

✅ Features

• Toggle, Slider, Button, Textbox
• Dropdown (Set & Refresh supported)
• Color Picker
• Keybind system
• Notifications
• Flags system
• Clean & modern design


---

📌 Example

local Voidex = loadstring(game:HttpGet("YOUR_URL"))()

local Window = Voidex.new({ Name = "Example Hub" })
local Tab = Window:CreateTab("Main", 4483362458)

Tab:CreateToggle({
    Name = "Test",
    Flag = "TestFlag",
    CurrentValue = false,
    Callback = function(v)
        print(v)
    end
})

---

VOIDEX UI LIBRARY V4 - API ADDITIONS
=====================================

Voidex.new() - New Config Options
-----------------------------------

ColorPicker
  Tints the entire UI to a custom colour. Every shade of purple across
  backgrounds, gradients, strokes, separators, borders, hover states,
  scrollbars, particles and indicators is derived from this hue.
  Usage: ColorPicker = "#0ea5e9"
  Accepts: any hex string with or without #, e.g. "#FF0000", "FF0000", "#f00"
  Aliases: WindowColor, WinColor, BgColor, BackgroundColor, ColorHex,
           and colour-spelt variants of each

FontColor
  Overrides all text and font colours across the entire UI. Automatically
  derives three tints: primary (100%), sub (80% brightness), muted (62%).
  Usage: FontColor = "#ffffff"
  Accepts: any hex string
  Aliases: FontColour, TextColor, TextColour, LabelColor, LabelColour, FontHex

LoadingTitle
  Replaces "VOIDEX" on the loading screen.
  Usage: LoadingTitle = "PHANTOM"
  Aliases: LoadTitle, LoadText, ScreenTitle

LoadingSubtitle
  Replaces "U I    L I B R A R Y" on the loading screen.
  Usage: LoadingSubtitle = "initialising..."
  Aliases: LoadingSubtitle, LoadSub, LoadSubText, ScreenSub


Defaults
---------
ColorPicker    - not set: original purple theme used, nothing changes
FontColor      - not set: text is auto-derived as a light tint of the
                 ColorPicker hue, or original T.White / T.TextMuted if
                 no ColorPicker is set either
LoadingTitle   - not set: shows "VOIDEX"
LoadingSubtitle - not set: shows "U I    L I B R A R Y"


Example
--------
local Window = Voidex.new({
    Name            = "Phantom Hub",
    ColorPicker     = "#0ea5e9",
    FontColor       = "#ffffff",
    LoadingTitle    = "PHANTOM",
    LoadingSubtitle = "initialising...",
})
