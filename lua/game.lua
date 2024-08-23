--global objects
function make_game()
    game = {
        level = 0,
        w = 128,
        h = 128,
        cspace = 10,
        ecount = 0,
        dif = 1,
        state = "play",
        t = 0,
        croom = 1,
        rooms = {},
        event = {}
    }
end
