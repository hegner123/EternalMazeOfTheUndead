function make_player()
    player = {
        id = generate_uuid(),
        health = 100,
        str = 10,
        spd = 10,
        atspd = 10,
        action = "idle",
        injured = false,
        cooldown = 0,
        x = 64,
        y = 54,
        w = 6,
        h = 8,
        spr = 3,
        frame = 0,
        sword= {
        id = generate_uuid(),
        spr = 33;
        x= 64,
        y= 64,
        draw = "sprite"

    },
        is_moving_left = false,
        is_moving_right = false,
        is_moving_up = false,
        is_moving_down = false,
        draw = "sprite"
    }
    player.attack = function()
        player.action = "attack"
        player.sword = draw_sword( player.spr, player.x, player.x + player.w, player.y,player.y + player.h, true, player.id)
        for _, enemy in pairs(game.rooms[game.croom].enemys) do
        local range = 8;
        local hitbox_x_min, hitbox_x_max = player.x, player.x + player.w
        local hitbox_y_min, hitbox_y_max = player.y, player.y + player.h

        if player.spr == 1 then
            hitbox_x_min, hitbox_x_max = player.x - range, player.x
        elseif  player.spr == 2 then
            hitbox_x_min, hitbox_x_max = player.x + player.w, player.x + player.w + range
        elseif  player.spr == 3 then
            hitbox_y_min, hitbox_y_max = player.y - range, player.y
        elseif  player.spr == 4 then
            hitbox_y_min, hitbox_y_max = player.y + player.h, player.y + player.h + range
        end
        -- Enemy hitbox
        local enemy_left, enemy_right = enemy.x, enemy.x + enemy.w
        local enemy_top, enemy_bottom = enemy.y, enemy.y + enemy.h
        -- Check collision
        local is_in_range = enemy_right > hitbox_x_min and enemy_left < hitbox_x_max and
            enemy_bottom > hitbox_y_min and enemy_top < hitbox_y_max           
                if is_in_range then
                    enemy.state = "hit"
                    enemy.hit_cooldown = 5
                    enemy.health = enemy.health - player.str
                end
            end


        player.cooldown = player.atspd;
        
        --end
    end


    player.update = function()
        if player.action =="attack" then
            add_to_list(game.to_draw, player.sword)
        end
    end
end

function draw_sword(dir,x1,x2,y1,y2, attack, id)
    local sword_x = 0
    local sword_y = 0
    local sword_spr = dir

    if not attack then
        if dir == 1 then sword_x = x1 - 3 sword_y = abs((y1+y2)/2) sword_spr = 35 end
        if dir == 2 then sword_x = x2 + 3 sword_y = abs((y1+y2)/2) sword_spr = 35 end
        if dir == 3 then sword_x = abs((x1+x2)/2) sword_y = y1 sword_spr = 35 end
        if dir == 4 then sword_x = abs((x1+x2)/2) sword_y = y2 sword_spr = 35 end
    else 
        if dir == 1 then sword_x = x1 - 3 sword_y = abs((y1+y2)/2) sword_spr = dir + 32 end
        if dir == 2 then sword_x = x2 + 3 sword_y = abs((y1+y2)/2) sword_spr = dir + 32 end
        if dir == 3 then sword_x = abs((x1+x2)/2) sword_y = y1 - 3 sword_spr = dir + 32 end
        if dir == 4 then sword_x = abs((x1+x2)/2) sword_y = y2 + 3 sword_spr = dir + 32 end
    end
    local sword = {
        id = id.."sword",
        spr = sword_spr;
        x= sword_x,
        y= sword_y,
        draw = "sprite"
    }
    return sword
end
