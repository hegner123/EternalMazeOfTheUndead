function _update()
	local c = game.croom
 if (player.cooldown > 0) player.cooldown = player.cooldown -1;
	player.update()
	foreach(enemys,updatee)
	inputs()
	
	if(game.rooms[c].spawn < game.rooms[c].rmax) then
		spawn(t)
	end
	game.t=game.t+1
end
