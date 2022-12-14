local function conv_str_t_tab(strRange)
    local tempTable = {}
    local lineSeparator = strRange:find("-")
    local lower = tonumber(strRange:sub(0,lineSeparator-1))
    local upper = tonumber(strRange:sub(lineSeparator+1, #strRange))
    tempTable= {lower, upper}
    return tempTable
end

local function overlaps(r, checkMinor)
    local a = (table.unpack(r,1)) -- a
    local b = (table.unpack(r,2)) -- b

    local c = (table.unpack(r,3)) -- c
    local d = (table.unpack(r,4)) --d
    -- checking encasement
    -- checking minor overlap, b >= c or d >= a
    -- 5-7, 7-9 true
    -- 2-8, 3-7 true
    -- 6-6, 4-6 true
    -- 2-6,4-8 true
    if checkMinor then return (b >= c and d >= a) end
    return (a  <= c and b >= d) or (c <= a and d >= b)
end

function Solve(filename)
    local file = io.open(filename, "r")
    local totalscore = 0 
    local totalscorepart2 = 0
    if file == nil then 
        local out = "failed to read file with name: "..filename
        print(out)
    else
        while true do
            local l  = file:read("l")
            if l == nil then 
                break 
            else
                local sep = string.find(l, ",")
                local r1 = conv_str_t_tab(l:sub(0, sep-1))
                local r2 = conv_str_t_tab(l:sub(sep+1,l:len()))
                local r = {table.unpack(r1, 1),table.unpack(r1, 2), table.unpack(r2, 1), table.unpack(r2, 2)}

                local fullyOverlaps = overlaps(r,false)
                local someOverlap = overlaps(r,true)
                if fullyOverlaps then totalscore = totalscore + 1 end
                if someOverlap then totalscorepart2 = totalscorepart2 + 1 end
            end
        end
        print(totalscore)
        print(totalscorepart2)
        file:close()
    end
end

Solve("test.txt")
Solve("input.txt")
