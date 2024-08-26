function _init()
    left = 1
    right = 2
    down = 3
    up = 4
    log_camera_position={x=0,y=0}
    input_ready=0
    game_over = false
    
    make_game(make_room())
    make_player()
    add(game.rooms[game.croom].enemys,make_enemy(16,16))
end
