function ConvertStringRangeToTable(strRange)
    local tempTable = {}
    local lineSeparator = strRange:find("-")
    local lower = tonumber(strRange:sub(0,lineSeparator-1))
    local upper = tonumber(strRange:sub(lineSeparator+1, #strRange))
    tempTable= {lower, upper}
    return tempTable
end

function CheckOverlap(ranges, checkMinor)
    local first = table.unpack(ranges,1)
    local second = table.unpack(ranges,2)
    local lower1 = (table.unpack(first,1))
    local lower2 = (table.unpack(second,1))
    local upper1 = (table.unpack(first,2))
    local upper2 = (table.unpack(second,2))
    if checkMinor then return (upper1 >=lower2)  end
    return (lower1  <= lower2 and upper1 >= upper2) or (lower2 <= lower1 and upper2 >= upper1)
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
            local line  = file:read("l")
            if line == nil then 
                break 
            else
                local separatorIndex = string.find(line, ",")
                local firstRange = line:sub(0, separatorIndex-1)
                local secondRange = line:sub(separatorIndex+1,line:len())
                local bothRanges = {ConvertStringRangeToTable(firstRange), ConvertStringRangeToTable(secondRange)}
                local fullyOverlaps = CheckOverlap(bothRanges,false)
            -- print(line)
                local someOverlap = CheckOverlap(bothRanges,true)
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
