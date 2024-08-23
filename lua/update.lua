function _update()
    local c = game.croom
    local r = game.rooms
    local enemy_count = count_all_enemies(game)
    player.update()
    inputs()

    --if (enemy_count ~= 0) then
        update_all_enemies(game,player)
    --end
    --    if (game.rooms[c].spawn < game.rooms[c].rmax) then
    --        spawn(t)
    --    end
    game.t = game.t + 1
    --end
end
