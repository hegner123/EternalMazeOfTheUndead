function _draw()
    local c = game.croom
    local r = game.rooms
    cls(1)
    --    if (player.action != "idle") then
    --   end
    --printobject(player)
    if (game.state == "play") then
        camera(r[c].x1, r[c].y1)
        draw(player.dir, player.x, player.y)
        if (#r[c].enemys ~= 0) then
            draw_all_enemies(game)
        end
    elseif (game.state == "log") then
        camera(0, 0)
        foreach(event, print)
    end
end
