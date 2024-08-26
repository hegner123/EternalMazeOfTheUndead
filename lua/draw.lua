function _draw()
    local c = game.croom
    local r = game.rooms
    local n = #game.to_draw
    local i = 1
    local current_room = r[c]
    sort_list(game.to_draw,compare_y)
    cls(1)
    if game.state == "play" then
        camera(game.cx, game.cy)
        for i=1, n do
                local item = game.to_draw[i].object
                if item["draw"]== "sprite" then
                spr(item["spr"], item["x"], item["y"])
                elseif item["draw"] == "rectangle" then
                    rectfill(item["x1"], item["y1"], item["x2"], item["y2"], 3)
                end
            end
        elseif game.state == "log" then
            printobject(game.event)
        camera(log_camera_position.x, log_camera_position.y)
    end
end