# Inputbox
Simple inputbox script for Multi Theft Auto.

## Syntax

This function creates an inputbox.
```
int exports.[resource-name]:addInputBox(string placeholder, float startX, float startY, float width, float height)
```

* **placeholder:** A string representing the placeholder text when the inputbox is empty.
* **startX:** A float representing the absolute origin X position of the inputbox, represented by pixels on the screen.
* **startY:** A float representing the absolute origin Y position of the inputbox, represented by pixels on the screen.
* **width:** A float representing the width of the inputbox, drawn in a right direction from the origin.
* **height:** A float representing the height of the inputbox, drawn in a downwards direction from the origin.

This function removes an inputbox.
```
bool exports.[resource-name]:removeInputBox(int id)
```

* **id:** An int represeting the inputbox ID you wish to remove. (Use 0 to remove all inputbox created by the current resource)

This function retrieves the text from an inputbox.
```
string exports.[resource-name]:getInputBoxText(int id)
```

* **id:** An int represeting the inputbox ID you wish to remove. (Use 0 to remove all inputbox created by the current resource)

## Example

This example creates an inputbox, waits 5 seconds, then outputs the input text into the chatbox and removes it.
```
local sx, sy = guiGetScreenSize()

local username = exports.inputbox:addInputBox("Username", sx / 2 - 125, sy / 2 - 20, 250, 40)

setTimer(function()
    outputChatBox(exports.inputbox:getInputBoxText(username))
    exports.inputbox:removeInputBox(username)
end, 5000, 1)
```
