--global objects
function make_game(room)
    game = {
        level = 0,
        needs_to_make_room = false,
        needs_to_change_room = false,
        kills=0,
        w = 128,
        h = 128,
        cx = 0,
        cy = 0,
        cspace = 10,
        ecount = 0,
        dif = 1,
        state = "play",
        t = 0,
        croom = 1,
        carea = { x = 0, y = 0 },
        rareas = { [1] = { x = 0, y = 0 } },
        rooms = {[1]=room},
        to_draw=create_list(player),
        event = {}
    }
    function game.check()
        local px = player.x
        local py = player.y
        local c = game.croom
        local r = game.rooms
        local current_room = r[c]
        if game.needs_to_change_room == false then
            if px - 1 < current_room.x1 and player.is_moving_left == true then
                game.go_l()
                game.cx = game.cx - 128
            end
            if px + 1 > current_room.x2 and player.is_moving_right == true then
                game.go_r()
                game.cx = game.cx + 128
            end
            if py - 1 < current_room.y1 and player.is_moving_up == true then
                game.go_u()
                game.cy = game.cy - 128
            end
            if py + 1 > current_room.y2 and player.is_moving_down == true then
                game.go_d()
                game.cy = game.cy + 128
            end
        end
    end

    function game.go_l()
        game.needs_to_change_room = true
        game.carea.x = game.carea.x - 1;
        game.check_and_create_room()
        loge(tostr(game.t), "exit room left")
    end

    function game.go_r()
        game.needs_to_change_room = true
        game.carea.x = game.carea.x + 1;
        game.check_and_create_room()
        loge(tostr(game.t), "exit room right")
    end

    function game.go_u()
        game.needs_to_change_room = true
        game.carea.y = game.carea.y - 1;
        game.check_and_create_room()
        loge(tostr(game.t), "exit room up")
    end

    function game.go_d()
        game.needs_to_change_room = true
        game.carea.y = game.carea.y + 1;
        game.check_and_create_room()
        loge(tostr(game.t), "exit room down")
    end

    function game.check_and_create_room()
        local exists = false

        -- Check if carea already exists in rareas
        for area_index, area in pairs(game.rareas) do
            --loge(tostr(game.t), tostr(area.x))
            if area.x == game.carea.x and area.y == game.carea.y then
                exists = true
                game.croom = area_index
                game.carea = area
                break
            end
        end
        -- If it doesn't exist, add it to rareas and call make_room
        if not exists then
            add(game.rareas, { x = game.carea.x, y = game.carea.y })
            local new_dimensions = game.new_dimensions(game.carea.x, game.carea.y)
            add(game.rooms, make_room(new_dimensions))
            game.needs_to_change_room = false
        end
    end

    function game.new_dimensions(x, y)
        local x1 = 128 * x
        local x2 = 128 * x + 128
        local y1 = 128 * y
        local y2 = 128 * y + 128
        return { [x1] = x1, [x2] = x2, [y1] = y1, [y2] = y2 }
    end
end
