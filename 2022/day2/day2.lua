--[[
    A - Rock, Score 1
    B - Paper, Score 2
    C - Scissor, Score 3
    X - Rock, Score 1
    Y - Paper, Score 2
    C - Scissor, Score 3
--]]
function MapTokenToScore(token) 
    if token == "A" or token == "X" then return 1 end
    if token == "B" or token == "Y" then return 2 end
    if token == "C" or token == "Z" then return 3 end
end

-- Draw 3, Win 6, Loss 0
function GetGameStateForSelf(scoreboard)
    local p1 = table.unpack(scoreboard,1)
    local p2 = table.unpack(scoreboard,2)
    if p1 == p2 then
        return 3
    elseif p1 == 1 then
        -- p1 has rock
        if p2 == 2 then
            -- p2 has paper
            return 6
        else
            return 0 
        end
    elseif p1 == 2 then
        -- p2  has paper
        if p2 == 3 then
            -- p2 has scissor
            return 6
        else
            return 0 
        end
    elseif p1 == 3 then
        -- p1 has scissor
        if p2 == 1 then
            -- p2 has rock
            return 6
        else
            return 0 
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
            local line  = file.read(file, "L")
            if line == nil then 
                break 
            else
                local separator = "%s" --regex for whitespace
                local scoreboard = {}
                local i = 1
                for token in string.gmatch(line,"([^"..separator.."]+)") do
                    scoreboard[i] = MapTokenToScore(token)
                    i = i +1
                end
                totalscore = totalscore + table.unpack(scoreboard,1)
                totalscore = totalscore + GetGameStateForSelf(scoreboard)
            end 
        end
        print(totalscore)
    end
end

function MapOutcomeToScore(outcome)
    print(outcome)
    if outcome == 1 then
        return 0
    elseif outcome == 2 then
        return 3
    else
        return 6 
    end
end

function ChooseMoveBasedOnOutcome(opponentScore, outcome)
    if outcome == 1 then --lose
        if opponentScore == 1 then
            return 3
        elseif opponentScore == 2 then
            return 1
        else 
            return 2
        end
    elseif outcome == 2 then --draw
        return opponentScore
    else -- win
        if opponentScore == 1 then 
            return 2
        elseif opponentScore == 2 then
            return 3
        else 
            return 1
        end
    end
end

function SolvePart2(filename)
    local file = io.open(filename, "r")
    local totalscore = 0 --- TODO: Testing, testing
    if file == nil then 
        local out = "failed to read file with name: "..filename
        print(out)
    else
        while true do
            local line  = file.read(file, "L")
            if line == nil then 
                break 
            else
                local separator = "%s" --regex for whitespace
                local gameState= {}
                local i = 1
                for token in string.gmatch(line,"([^"..separator.."]+)") do
                    gameState[i] = MapTokenToScore(token)
                    i = i +1
                end
                local outcome = table.unpack(gameState,2)
                print("Game should end with "..(outcome))
                local opponentScore = table.unpack(gameState,1)
                local moveBasedOnOutcome = ChooseMoveBasedOnOutcome(outcome,opponentScore)
                print("Opponent choose "..opponentScore)
                print("To satisfy gamestate we choose "..moveBasedOnOutcome)
                totalscore = totalscore + moveBasedOnOutcome + MapOutcomeToScore(outcome)
            end 
        end
        print(totalscore)
    end
end


SolvePart1("input.txt")
SolvePart2("input.txt")