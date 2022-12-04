function LetterToPriority(letter)
    local asciiValue = letter:byte()
    if asciiValue < 123 and asciiValue > 96 then --checks if letter is within lowercase alphabet of ascii values
        local minPrio = string.byte("a")
        local letterPrio = asciiValue + 1 --lowest prio added for lowercase items
        return letterPrio - minPrio
    else
        local minPrio = string.byte("A")
        local letterPrio = asciiValue + 27 --lowest prio added for uppercase items
        return letterPrio - minPrio
    end
end

function StringToTable(str)
    local tempTable = {}
    for i =1, #str do
        tempTable[i] =string.sub(str,i,i)
    end
    return tempTable
end

function GetDifferenceBetweenPriorityTables(first,second,third)
    -- might have to get min and max length from the two table here ?
    if type(third) =="table" then
        print("found third argument")
        for i=1, #first do
            local firstPrio = (first[i])
            for j = 1,#second do 
                local secondPrio = (second[j])
                if firstPrio == secondPrio then
                    print("found match between 1 and 2")
                    for k = 1, #third do
                        local thirdPrio = third[k]
                        if thirdPrio == secondPrio then return LetterToPriority(thirdPrio) end
                    end
                end
            end
        end
    else
        for i=1, #first do
            local firstPrio = (first[i])
            for j = 1,#second do 
                local secondPrio = (second[j])
                if firstPrio ==secondPrio then return LetterToPriority(secondPrio) end
            end
        end
    end
    
end 

function SolvePart1(filename)
    local file = io.open(filename, "r")
    local totalscore = 0 --- TODO: Testing, testing
    if file == nil then 
        local out = "failed to read file with name: "..filename
        print(out)
    else
        while true do
            local line  = file:read("L")
            if line == nil then 
                break 
            else
                local endOfSecond = line:len() - 1
                local startOfSecond= endOfSecond / 2
                local firstCompartment =  StringToTable(line:sub(0,startOfSecond))
                local secondCompartment = StringToTable(line:sub(startOfSecond+1,endOfSecond))
                local prio = GetDifferenceBetweenPriorityTables(firstCompartment,secondCompartment)
                totalscore =  prio + totalscore
            end 
        end
        print(totalscore)
        file:close()
    end
end

function SolvePart2(filename)
    local file = io.open(filename, "r")
    local totalscore = 0
    local groupCounter = 1
    local tTable = {}
    if file == nil then 
        local out = "failed to read file with name: "..filename
        print(out)
    else
        while true do
            local line  = file:read("L")
            if line == nil then 
                break 
            else
                local strtable = StringToTable(line)
                table.insert(tTable, groupCounter,strtable)
                if groupCounter == 3 then
                   groupCounter = 0
                   -- start the comparision?
                    local first = table.unpack(tTable,1)
                    local second= table.unpack(tTable,2)
                    local third = table.unpack(tTable,3)
                    local prio = GetDifferenceBetweenPriorityTables(first,second,third)
                    -- print(prio1, prio2, prio3)
                    totalscore = prio + totalscore
                    tTable = {}
                end
                groupCounter = groupCounter + 1 
            end 
        end
        print(totalscore)
        file:close()
    end
end

SolvePart1("input.txt")
SolvePart2("input.txt")