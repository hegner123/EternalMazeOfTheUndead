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
        enemys={},
        spawnque = {}
    }
    if (dimensions) then
        room.x1=dimensions.x1
        room.x2=dimensions.x2
        room.y1=dimensions.y1
        room.y2=dimensions.y2
    end
    function room.check(px, py, rx, ry)
        if (px < rx) then
            room.x1 -= 128
            room.x2 -= 128
            room.go_l()
        end
        if (px > rx + w) then
            room.x1 += 128
            room.x2 += 128
            room.go_r()
        end
        if (py < ry) then
            room.y1 -= 128
            room.y2 -= 128
            room.go_u()
        end
        if (py > ry + h) then
            room.y1 += 128
            room.y2 += 128
            room.go_d()
        end
    end



    function room.go_l()
        room.area.x = room.area.x - 1;
        loge(tostr(game.t), "exit room left")
        return room.area
    end

    function room.go_r()
        room.area.x = room.area.x + 1;
        loge(tostr(game.t), "exit room right")
        return room.area
    end

    function room.go_u()
        room.area.y = room.area.y - 1;
        loge(tostr(game.t), "exit room up")
        return room.area
    end

    function room.go_d()
        room.area.y = room.area.y + 1;
        loge(tostr(game.t), "exit room down")
        return room.area
    end
    function room.enemys.new(t)
        local e = {}
        for k, v in pairs(t) do game.entity[k] = v end
        loge(0, "entity created")
        return e;
    end


    return room
end
