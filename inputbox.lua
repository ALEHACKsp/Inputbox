local sx, sy = guiGetScreenSize()
local font = dxCreateFont("font.ttf", 14)

addEventHandler("onClientRender", getRootElement(), function()
    for k, v in pairs(inputbox) do
        dxDrawRectangle(v[2], v[3], v[4], v[5], tocolor(40, 40, 40, 150))
        dxDrawRectangle(v[2] + 2, v[3] + 2, v[4] - 4, v[5] - 4, tocolor(40, 40, 40, (isCursorHover(v[2], v[3], v[4], v[5]) or v[6]) and 180 or 150))

        if start then
            v[7][1] = interpolateBetween(v[7][2], 0, 0, v[7][3], 0, 0, (getTickCount() - start) / 150, "Linear")
        end

        dxDrawRectangle(v[2] + 2, v[3] + v[5] - 4, (v[7][1] - 4) < 0 and 0 or (v[7][1] - 4), 2, tocolor(50, 168, 82, 180))

        dxDrawText(v[6] and v[8] .. (getTickCount() - tick < 500 and "|" or "") or (v[8] == "" and v[1]) or v[8], v[2] + 6, v[3] + 6, v[2] + v[4] - 6, v[3] + v[5] - 6, tocolor(255, 255, 255, (v[6] or v[8] ~= "") and 200 or 100), 1, font, "left", "center")
    end
end)

addEventHandler("onClientKey", getRootElement(), function(key, press)
    if not press or length() == 0 then return end
    if key == "mouse1" then
        for k, v in pairs(inputbox) do
            start = getTickCount()
            v[7][2] = v[7][1]
            v[7][3] = 0
            v[6] = false

            if isCursorHover(v[2], v[3], v[4], v[5]) then
                tick = getTickCount()
                start = tick
                v[7][2] = v[7][1]
                v[7][3] = 250
                v[6] = true
            end
        end
    elseif key == "backspace" then
        for k, v in pairs(inputbox) do
            if v[6] then
                v[8] = string.gsub(v[8], "[%z\1-\127\194-\244][\128-\191]*$", "")
            end
        end
    end
end)

addEventHandler("onClientCharacter", getRootElement(), function(character)
    for k, v in pairs(inputbox) do
        if v[6] then
            v[8] = v[8] .. character
        end
    end
end)

function isCursorHover(x, y, w, h)
    if not isCursorShowing() then return false end
    
	local cx, cy = getCursorPosition()
	local cx, cy = cx * sx, cy * sy
	
	return (cx >= x and cx <= x + w) and (cy >= y and cy <= y + h)
end