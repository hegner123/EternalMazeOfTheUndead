--draw functions

function draw_enemy(enemy)
    spr(enemy.spr, enemy.x, enemy.y)
end

function draw_all_enemies(current_room, to_draw)
    for _, enemy in pairs(current_room.enemys) do
        add(to_draw, enemy)
    end
end
