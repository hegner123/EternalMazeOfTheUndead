player["attack"] = function(target)
    player.action = "attack"
    --if (target != nil) then
    --target.h = target.h-player.str;
    player.cooldown = player.atspd;
    player.frame = player.atspd;
    --end
end

player["play"] = function(animation)

end

player["update"] = function()
    if (player.frame == 0) then
        if (player.action == "attack") then
            player.play(player.action)
        end
    elseif (player.frame - 1 == 0) then
        player.action = "idle"
        player.frame = player.frame - 1;
    else
        player.frame = player.frame - 1;
        player.play(player.action, player.frame)
    end
end
