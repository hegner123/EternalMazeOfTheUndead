function make_player()
    player = {
        health = 100,
        str = 1,
        spd = 10,
        atspd = 10,
        action = "idle",
        injured = false,
        cooldown = 0,
        x = 64,
        y = 54,
        dir = 3,
        frame = 0
    }
    player.attack = function()
        player.action = "attack"
        --if (target != nil) then
        --target.h = target.h-player.str;
        player.cooldown = player.atspd;
        player.frame = player.atspd;
        --end
    end


    player.update = function()
        if (player.cooldown > 0) then
            player.cooldown = player.cooldown - 1;
            elseif (player.cooldoown == 0) then
            player.action = "idle"
        end
    end
end
