function entity.new(t)
    local e = {}
    for k, v in pairs(t) do entity[k] = v end
    loge(0, "entity created")
    return e;
end

function spawnenemy(x, y)
    local enemy = entity.new { default }
    return enemy
end
