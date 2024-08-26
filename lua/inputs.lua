--inputs function
function inputs()
		if (input_ready ~= 0) then
        return
		else
        if (game.state == "play") then
				if (btn(0)) then player.x=player.x-1 player.spr=1 player.is_moving_left=true else player.is_moving_left= false end
				if (btn(1)) then player.x=player.x+1 player.spr=2 player.is_moving_right=true else player.is_moving_right=false end
				if (btn(2)) then player.y=player.y-1 player.spr=3 player.is_moving_down=true else player.is_moving_down = false end
				if (btn(3)) then player.y=player.y+1 player.spr=4 player.is_moving_up=true else player.is_moving_up = false end
				if (btn(5)) then if (player.cooldown==0) then
					player.attack() end
				end
        end
				-- if (btnp(4)) then  if (game.state=="play") then game.state="log" else game.state="play"end end 
				if btnp(4) then  add(game.rooms[game.croom].enemys,make_enemy(flr(rnd(100) + 8), flr(rnd(100))+8))end
		end
end
function log_inputs()
if btn(0) then log_camera_position.x = log_camera_position.x - 1 end
if btn(1) then log_camera_position.x = log_camera_position.x + 1 end
if btn(2) then log_camera_position.y = log_camera_position.y - 1 end
if btn(3) then log_camera_position.y = log_camera_position.y + 1 end
if (btnp(4)) then  if (game.state=="play") then game.state="log" else game.state="play"end end 
if (btnp(5)) then game.rooms[ game.croom].enemy={} end
end
