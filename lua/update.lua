function _update()
    if (game.state == "play") then
        local c = game.croom
        local r = game.rooms
        local current_room = r[c]
        local enemy_count = count_all_enemies(game)
        
        game.to_draw = create_list(player)
        player.update()
        inputs()
        if (enemy_count ~= 0) then
            update_all_enemies(game, current_room)
            --end
            --    if (game.rooms[c].spawn < game.rooms[c].rmax) then
            --        spawn(t)
        end
        game.check(player.x, player.y, current_room.x1, current_room.y1)
        game.t = game.t + 1
    elseif (game.state == "log") then
        log_inputs()
    end
    --end
end
