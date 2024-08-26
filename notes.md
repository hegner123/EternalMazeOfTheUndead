4 2 | 6 2
4 4 | 6 4

xmin = 4 xmax = 6
ymin = 2 ymax = 4

3 4 | 4 4
3 5 | 4 5
xmin = 3 xmax = 4
ymin = 4 ymax = 5

if enemy.xmax >= player xmin or enemy.xmin <= player.xmax

-- function is_enemy_in_range(player_x, player_y, player_w, player_h, direction, enemy_x, enemy_y, enemy_w, enemy_h, range)
--     -- Determine the player's extended hitbox based on the direction they are facing
--     local hitbox_x_min = player_x            --left
--     local hitbox_x_max = player_x + player_w --right
--     local hitbox_y_min = player_y            ---top
--     local hitbox_y_max = player_y + player_h -- bottom

--     if direction == 1 then
--         -- Facing left
--         hitbox_x_max = player_x
--         hitbox_x_min -= range
--     elseif direction == 2 then
--         -- Facing right
--         hitbox_x_min = player_x + player_w
--         hitbox_x_max += range
--     elseif direction == 3 then
--         -- Facing up
--         hitbox_y_min -= range
--         hitbox_y_max = player_y

--     elseif direction == 4 then
--         -- Facing down
--         hitbox_y_min = player_y + player_h
--         hitbox_y_max += range
--     end
--     local enemy_left = enemy_x
--     local enemy_right = enemy_x + enemy_w
--     local enemy_top = enemy_y
--     local enemy_bottom = enemy_y + enemy_h
--     local hitbox_left = hitbox_x_min
--     local hitbox_right = hitbox_x_max
--     local hitbox_top = hitbox_y_min
--     local hitbox_bottom = hitbox_y_max
--     local rectangle={}
--     rectangle.x1 = hitbox_left
--     rectangle.x = hitbox_left
--     rectangle.y = hitbox_top
--     rectangle.x2 = hitbox_right
--     rectangle.y1 = hitbox_top
--     rectangle.y2 = hitbox_bottom
--     rectangle.draw = "rectangle"
--     add_to_list(game.to_draw, rectangle)

--     -- Check if the enemy sprite is within the extended hitbox
--     local collision_left = false
--     local collision_right = false
--     local collision_bottom = false
--     local collision_top = false
--     local horizontal_collision = false
--     local verticale_collision = false
--     if enemy_right >= hitbox_left and hitbox_right > enemy_left then collision_left = true end
--     if enemy_left <= hitbox_right and hitbox_left < enemy_right then collision_right = true end
--     if enemy_bottom >= hitbox_top and hitbox_bottom > enemy_top then collision_top = true end
--     if enemy_top <= hitbox_bottom and hitbox_top < enemy_bottom then collision_bottom = true end
--     if collision_left or collision_right then horizontal_collision = true end
--     if collision_top or collision_bottom then verticale_collision = true end
--     if horizontal_collision and verticale_collision then
--         return true
--     else
--         return false
--     end
-- end