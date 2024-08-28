function loge(tick, message,index)
    if index then 
        game.event[index] = tostr(tick) ..": ".. message
    else
    add(game.event, tostr(tick) .. ": " .. message)
    end
end

function printobject(t, l)
    local limit = -1
    if type(l) == "number" then 
        limit = l
    end
    local count = 0
    for k, v in pairs(t) do
        if count < limit or limit == -1 then
            if (type(v) == "table") then
                print(k )
                printobject(v,-1)
            else
                print(k .. "  " .. tostr(v))
                count += 1
            end
        end
    end
end

function stringify(t)
    for k, v in pairs(t) do
        if (type(v) == "table") then
            stringify(t)
        else
            return tostr(v)
        end
    end
end

function generate_uuid()
    local chars = "0123456789abcdef"
    local uuid = ""
    for i = 1, 32 do
        uuid = uuid .. sub(chars, flr(rnd(#chars)) + 1, flr(rnd(#chars)) + 1)
    end
    return uuid
end

function generate_rnd_max(max)
    return flr(rnd(max))
end

function count_all_enemies(game)
    local total_enemies = 0
    for room_index, room in pairs(game.rooms) do
        total_enemies = total_enemies + #room.enemys
    end
    return total_enemies
end

function distance(x1, y1, x2, y2)
    return sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function compare_y(a,b)
    return a["y"] < b["y"]
end

function create_list(obj)
    return { [1] = { object = obj, next = nil, prev = nil } }
end

function retrieve_from_list(list, index)
    return list[index].obj
end

function edit_in_list(list, index, new_obj)
    list[index].obj = new_obj
end

function add_to_list(list, obj)
    if check_list_for_existing_objs(list, obj) == false then
        local new_node = { object = obj, prev = #list, next = nil }
        if #list > 0 then
            list[#list].next = #list + 1
        end
        add(list, new_node)
    end
end

function delete_from_list(list, index)
    if index == 1 then
        if #list > 1 then
            list[2].prev = nil
        end
    elseif index == #list then
        list[index - 1].next = nil
    else
        list[list[index].prev].next = list[index].next
        list[list[index].next].prev = list[index].prev
    end

    -- Remove the object from the list
    deli(list, index)

    -- Fix the indices in the list
    for i = index, #list do
        list[i].prev = i - 1
        list[i].next = i + 1
    end
end

function sort_list(list, compare)
    local n = #list
    -- loge(tostr(game.t),tostr(n))
    if n < 2 then
        return
    end
    for i = 1, n - 1 do
        for j = 1, n - i do
            if compare(list[j + 1].object, list[j].object) then
                -- Swap the objects
                list[j].object, list[j + 1].object = list[j + 1].object, list[j].object
            end
        end
    end

    -- Fix the prev and next pointers
    for i = 1, n do
        list[i].prev = i - 1
        list[i].next = i + 1
    end
    list[1].prev = nil
    list[n].next = nil
end

function check_list_for_existing_objs(list, obj)
    local n = #list
    local exists = false
    loge(tostr(game.t), n,1)
    -- for i = 1, n - 1 do
    --     if id_exists(list[i].obj, obj) then
    --         exists = true
    --     end
    -- end
    return exists
end

function id_exists(obj1, obj2)
    if tostr(obj1.id) == tostr(obj2.id) then
        return true
    else
        return false
    end
end

function add_enemy_to_room()
    local room = game.rooms[game.croom].enemys
    add(room,make_enemy(flr(rnd(100) + 8), flr(rnd(100))+8))
end