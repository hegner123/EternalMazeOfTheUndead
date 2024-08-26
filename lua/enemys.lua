function make_enemy(spawn_x,spawn_y)
    local enemy = {
        id = generate_uuid(),
        movement_cooldown = 0,
        hit_cooldown = 0,
        state="normal",
        x = spawn_x,
        y = spawn_y,
        w=4,
        h=8,
        spr = 6,
        health = 10,
        str = 10,
        range = 10,
        spd = 1,
        is_in_range = false,
        paths = {
            [1] = "l8 r8",
            [2] = "u8 d8",
            [3] = "u8 r8 d8 l8",
            [4] = "d8 r8 u8 l8",
        },
        draw = "sprite"
    }
    function enemy.walk_left()
        enemy.x = enemy.x - enemy.spd;
        if enemy.state == "normal" then
            enemy.spr = 6
        elseif enemy.state == "hit" then
            enemy.spr = 22
        end
    end

    function enemy.walk_right()
        enemy.x = enemy.x + enemy.spd;
        if enemy.state == "normal" then
            enemy.spr = 7
        elseif enemy.state == "hit" then
            enemy.spr = 23
        end
    end

    function enemy.walk_up()
        enemy.y = enemy.y - enemy.spd;
        if enemy.state == "normal" then
            enemy.spr = 8
        elseif enemy.state == "hit" then
            enemy.spr = 24
        end
    end

    function enemy.walk_down()
        enemy.y = enemy.y + enemy.spd;
        if enemy.state == "normal" then
            enemy.spr = 9
        elseif enemy.state == "hit" then
            enemy.spr = 25
        end
    end

    function enemy.get_hit()
        enemy.hit_cooldown = 5
        enemy.state = "hit"
    end

    function enemy.move(player)
        
    local room_x_min = game.rooms[game.croom].x1 + 8
    local room_x_max = game.rooms[game.croom].x2 - 8
    local room_y_min = game.rooms[game.croom].y1 + 8
    local room_y_max = game.rooms[game.croom].y2 - 8
    
        enemy.movement_cooldown = 10
        local dir = flr(rnd(10))
        if dir > 5 then
        -- Check if enemy is within the room bounds for horizontal movement
            if enemy.x + enemy.spd <= room_x_max and enemy.x - enemy.spd >= room_x_min then
                -- Check if player is within 10 pixels horizontally
                if abs(player.x - enemy.x) <= 24 and abs(player.x -enemy.x)>=8then
                    -- Move enemy towards player horizontally
                    if player.x > enemy.x then
                        enemy.walk_right()
                    else
                        enemy.walk_left()
                    end
                else
                    -- Randomly choose horizontal movement
                    if rnd(1) < 0.5 then
                        enemy.walk_left()
                    else
                        enemy.walk_right()
                    end
                end
            end

        elseif dir < 5 then

            -- Check if enemy is within the room bounds for vertical movement
            if enemy.y + enemy.spd <= room_y_max and enemy.y - enemy.spd >= room_y_min then
                -- Check if player is within 10 pixels vertically
                if abs(player.y - enemy.y) <= 24 and abs(player.y - enemy.y) >= 8 then
                    -- Move enemy towards player vertically
                    if player.y > enemy.y then
                        enemy.walk_down()
                    else
                        enemy.walk_up()
                    end
                else
                    -- Randomly choose vertical movement
                    if rnd(1) < 0.5 then
                        enemy.walk_up()
                    else
                        enemy.walk_down()
                    end
                end
            end

        elseif  enemy.is_in_range then
            enemy.attack()
        end
    end

    function enemy.attack ()
        enemy.state = "attack"
        local club = { spr = 5, x = enemy.x, y = enemy.y }
        add_to_list(game.to_draw, club)
        local range = 8;
        local hitbox_x_min, hitbox_x_max = enemy.x, enemy.x + enemy.w
        local hitbox_y_min, hitbox_y_max = enemy.y, enemy.y + enemy.h

        if enemy.spr == 1 then
            hitbox_x_min, hitbox_x_max = enemy.x - range, enemy.x
        elseif  enemy.spr == 2 then
            hitbox_x_min, hitbox_x_max = enemy.x + enemy.w, enemy.x + enemy.w + range
        elseif  enemy.spr == 3 then
            hitbox_y_min, hitbox_y_max = enemy.y - range, enemy.y
        elseif  enemy.spr == 4 then
            hitbox_y_min, hitbox_y_max = enemy.y + enemy.h, enemy.y + enemy.h + range
        end
        -- Enemy hitbox
        local enemy_left, enemy_right = player.x, player.x + player.w
        local enemy_top, enemy_bottom = player.y, player.y + player.h
        -- Check collision
        local is_in_range = enemy_right > hitbox_x_min and enemy_left < hitbox_x_max and
            enemy_bottom > hitbox_y_min and enemy_top < hitbox_y_max           

            if is_in_range then
                player.state = "hit"
                player.hit_cooldown = 5
                player.health = player.health - enemy.str
            end
            enemy.cooldown = enemy.atspd;
        end
    return enemy
end

function update_enemy(enemy, room, enemy_index)
    if enemy.health ==0 then
        enemy.state = "dead"
        game.kills = game.kills + 1;
        deli(room.enemys, enemy_index)
        return
    end
    local club = { spr = 8+32, x = enemy.x+3, y = enemy.y+3, draw="sprite"}
        add_to_list(game.to_draw, club)
    if is_in_room(room, enemy) and enemy.state ~= "dead" then
        if enemy.movement_cooldown == 0 then
            enemy.move(player)
        end
        add_to_list(game.to_draw, enemy)
        if enemy.movement_cooldown > 0 then
            enemy.movement_cooldown = enemy.movement_cooldown - 1
        end
        if enemy.hit_cooldown > 0 then 
            enemy.hit_cooldown = enemy.hit_cooldown - 1
        end

        
        
        if enemy.hit_cooldown == 0 then 
            enemy.state = "normal"
        end
    end
end

function update_all_enemies(game, croom)
    for _, room in pairs(game.rooms) do
        local n = #room.enemys

        for i = 1, n  do
            update_enemy(room.enemys[i], room, i)
        end
    end
end


