inputbox = {}
tick = getTickCount()

local group = {}
local limit = 10

function addInputBox(placeholder, x, y, w, h)
    if #inputbox == 0 then
        tickTimer = setTimer(function()
            tick = getTickCount()
        end, 1000, 0)
    end

    for i = 1, limit do
        if not inputbox[i] then
            inputbox[i] = {placeholder, x, y, w, h, false, {0, 0, 0}, ""}

            if group[sourceResource] then
                table.insert(group[sourceResource], i)
            else
                group[sourceResource] = {i}
            end
        
            return i
        end
    end
    return false
end

function removeInputBox(id)
    if id == 0 and group[sourceResource] then
        for k, v in pairs(group[sourceResource]) do
            removeInputBox(v)
        end

        group[sourceResource] = nil

        return true
    else
        if inputbox[id] then
            inputbox[id] = nil

            if length() == 0 then
                killTimer(tickTimer)
            end

            return true
        end
    end
    return false
end

function getInputBoxText(id)
    if inputbox[id] then
        return inputbox[id][8]
    end
    return false
end

function length()
    local count = 0
    for _ in pairs(inputbox) do
        count = count + 1
    end
    return count
end