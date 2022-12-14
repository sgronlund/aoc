-- require "fun" ()

function SplitStringBasedOnSeparator(str, sep)
    -- %s, whitespace regex
    local temp = {}
   for token in string.gmatch(str,"([^"..sep.."]+)") do
        temp[#temp + 1] = token
   end
   return temp
end

function FindPartsOfStringBasedOnSeparator(str, sep)
    local temp = {}
   for token in string.gmatch(str,"("..sep..")") do -- removed [] here, consider always having them
        temp[#temp + 1] = token
   end
   return temp
end

--[[
     a,b,c,d --> a != b, a != c, a != d, b != 
]]
local function check_unique(...)
    local args = {...}
    table.sort(args)
    for i = 1, #args - 1 do
        if args[i] == args[i+1] then return false end
    end
    return true
end


--[[
    your subroutine needs to identify the first position where the four most recently received characters were all different
]]
function Solve(filename)
    local file = io.open(filename, "r")
    local totalscore = 0 
    local totalscore2 = 0
    if file == nil then 
        local out = "failed to read file with name: "..filename
        print(out)
    else
        while true do
            local line  = file:read("L")
            if line == nil then 
                break 
            else
                local chars = FindPartsOfStringBasedOnSeparator(line,".") -- character splitted array
                for i = 1, #chars do
                    local part1 = check_unique(table.unpack(chars,i,math.min(i+3, #chars)))
                    if part1 then
                        totalscore = totalscore + i + 3
                        break
                    end
                end 
                for i = 1, # chars do
                    local part2 = check_unique(table.unpack(chars,i,math.min(i+13, #chars)))
                    if part2 then
                        totalscore2 = totalscore2+ i + 13
                        break
                    end
                end
            end
        end
        print(totalscore)
        print(totalscore2)
        file:close()
    end
end
Solve("test.txt")
Solve("input.txt")
