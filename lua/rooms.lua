function make_room(dimensions)
    local room = {
        id = generate_uuid(),
        area = {
            x = 0,
            y = 0
        },
        x1 = 0,
        x2 = 128,
        y1 = 0,
        y2 = 128,
        rmax = 0,
        spawn = 0,
        enemys = {},
        spawnque = {}
    }
    if (dimensions) then
        room.x1 = dimensions.x1
        room.x2 = dimensions.x2
        room.y1 = dimensions.y1
        room.y2 = dimensions.y2
    end

    return room
end

function is_in_room(rm, obj)
    if obj.x > rm.x1 and obj.x < rm.x2 and obj.y > rm.y1 and obj.y < rm.y2 then
        return true
    else
        return false
    end
end
