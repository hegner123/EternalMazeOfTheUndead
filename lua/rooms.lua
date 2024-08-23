-- room functions
function roomcheck(px, py, rx, ry)
    if (px < rx) then
        room.x1 -= 128
        room.x2 -= 128
        gorooml()
    end
    if (px > rx + w) then
        room.x1 += 128
        room.x2 += 128
        goroomr()
    end
    if (py < ry) then
        room.y1 -= 128
        room.y2 -= 128
        goroomu()
    end
    if (py > ry + h) then
        room.y1 += 128
        room.y2 += 128
        goroomd()
    end
end

function roominit(area)
    local new;
    local roomcopy = roomdefault
    if (area) then
        roomcopy.area = area
        new = roomcopy
    else
        roomcopy.area = { 0, 0 }
        new = roomcopy
        new.max = flr(rnd(5))
        while (new.spawn > 0) do
            enquespawn(game.t)
            new.spawn -= 1;
        end
        add(game.rooms, new)
    end
end

function enquespawn(tick)
    local delay = flr(rnd(100)) + tick
end

function moveroom(direction)
    local newroom;
    if (direction == "left") then
        newroom = gorooml()
    elseif (direction == "right") then
        newroom = goroomr()
    elseif (direction == "up") then
        newroom = goroomu()
    elseif (direction == "down") then
        newroom = goroomd()
    end
    roominit(newroom)
end

function gorooml()
    room.area.x = room.area.x - 1;
    loge(tostr(game.t), "exit room left")
    return room.area
end

function goroomr()
    room.area.x = room.area.x + 1;
    loge(tostr(game.t), "exit room right")
    return room.area
end

function goroomu()
    room.area.y = room.area.y - 1;
    loge(tostr(game.t), "exit room up")
    return room.area
end

function goroomd()
    room.area.y = room.area.y + 1;
    loge(tostr(game.t), "exit room down")
    return room.area
end

function getspawn(area)
end
