
function _init()
    input_ready=0
    make_game()
    make_player()
    local room = make_room()
    add(room.enemys,make_enemy())
    game_over = false
    add(game.rooms, room)
    
end
