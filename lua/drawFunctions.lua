--draw functions
function draw(s, sx, sy)
    spr(s, sx, sy)
end

function draw_enemy(enemy)
    spr(enemy.spr, enemy.x, enemy.y)
end

function draw_all_enemies(game)
    for room_index, room in pairs(game.rooms) do
        for enemy_index, enemy in pairs(room.enemys) do
            draw_enemy(enemy)
        end
    end
end
