
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
   for token in string.gmatch(str,"(["..sep.."]+)") do
        temp[#temp + 1] = token
   end
   return temp
end
--[[
    Skeleton/template for all AOC solutions using lua, *probably* 
]]
function Solve(filename)
    local file = io.open(filename, "r")
    local totalscore = 0 
    if file == nil then 
        local out = "failed to read file with name: "..filename
        print(out)
    else
        while true do
            local line  = file:read("L")
            if line == nil then 
                break 
            else
                -- TODO: Insert solution
            end 
        end
        print(totalscore)
        file:close()
    end
end

Solve("test.txt")
Solve("input.txt")
