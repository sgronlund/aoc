
function Part1(filename)
    local calorietable = {}
    local file = io.open(filename, "r")
    if file == nil then 
        local out = "failed to read file with name: "..filename
        print(out)
    else
        local elfcount = 0
        while true do
            local line  = file.read(file, "l")
            if line == nil then 
                break 
            else
                if line == "" then 
                    elfcount = elfcount + 1
                else
                    if calorietable[elfcount] == nil then
                        calorietable[elfcount] = tonumber(line)
                    else 
                        calorietable[elfcount] = calorietable[elfcount] + tonumber(line)
                        --print("Elf "..elfcount.." now has "..calorietable[elfcount].." calories in total")
                    end
                end
            end 
        end
        table.sort(calorietable)
        local max = calorietable[#calorietable] -- # seems to be generating length?
        local topthree = calorietable[#calorietable] + calorietable[#calorietable - 1]  + calorietable[#calorietable - 2]
        print("Part1 "..max.." and Part2 "..topthree)
    end
end


Part1("input.txt")