local function loge(tick, message)
    add(event, tostr(tick) .. ": " .. message)
end

local function printobject(t)
    for k, v in pairs(t) do
        if (type(v) == "table") then
            printobject(v)
        else
            print(k .. "  " .. tostr(v))
        end
    end
end


