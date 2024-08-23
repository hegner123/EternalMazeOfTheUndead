--global objects
game = {
    level = 0,
    ecount = 0,
    dif = 1,
    state = "play",
    t = 0,
    croom = 1,
    enemys = {},
    spawndelay = 0,
    rooms = {}
}

w = 128
h = 128
cspace = 10
iready = cspace

roomdefault = {
    area = {
        x = 0,
        y = 0
    },
    x1 = 0,
    x2 = 128,
    y1 = 0,
    y2 = 128,
    rmax = 0,
    spawn = 0,
    spawnque = {}
}
entity = {}
event = {}
--player
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
