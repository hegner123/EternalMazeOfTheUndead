--inputs function
function inputs()
		if (input_ready ~= 0) then
				if (not btn(4)) then
						input_ready = input_ready -1;
				end
		else
				if (btn(0)) then player.x=player.x-1 player.dir=1 end
				if (btn(1)) then player.x=player.x+1 player.dir=2 end
				if (btn(2)) then player.y=player.y-1 player.dir=4 end
				if (btn(3)) then player.y=player.y+1 player.dir=3 end
				if (btn(4)) then if (game.state=="play") then game.state="log" else game.state="play"end iready=cspace end
				if (btn(5)) then 
				if (player.cooldown==0) then
					player.attack() end
				end
		end
end
