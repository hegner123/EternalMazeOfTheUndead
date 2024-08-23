function make_enemy()
    local enemy = {
        id = generate_uuid(),
        x = 16,
        y = 16,
        spr = 6,
        health = 10,
        str = 10,
        range = 10

    }

    -- Function to check if any enemies are within a 10-pixel radius of the player
    function enemy:check_near_player(radius,player)
        if distance(player.x, player.y, self.x, self.y) <= radius then
            return true
        end
    end
    return enemy
end

function update_enemy(enemy,player)
    -- Example of what the update function might do
    -- This function would be defined according to your game's logic
    enemy.check_near_player(enemy.range,player)
    enemy.x = enemy.x + 1
    enemy.y = enemy.y + 1
end

function update_all_enemies(game,player)
    for room_index, room in pairs(game.rooms) do
        for enemy_index, enemy in pairs(room.enemys) do
            update_enemy(enemy,player)
        end
    end
end
