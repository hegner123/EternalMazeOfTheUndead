local function loge(tick, message)
    add(event, tostr(tick) .. ": " .. message)
end

local function printobject(t)
    for k, v in pairs(t) do
        if (type(v) == "table") then
            printobject(v)
        else
            print(k .. "  " .. tostr(v))
        end
    end
end

function generate_uuid()
    local chars = "0123456789abcdef"
    local uuid = ""
    for i = 1, 32 do
        uuid = uuid .. sub(chars, flr(rnd(#chars)) + 1, flr(rnd(#chars)) + 1)
    end
    return uuid
end

function count_all_enemies(game)
    local total_enemies = 0
    for room_index, room in pairs(game.rooms) do
        total_enemies = total_enemies + #room.enemys
    end
    return total_enemies
end

function distance(x1, y1, x2, y2)
    return sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end
