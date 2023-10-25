function displayInterface(symbols)
    term.clear()
    term.setCursorPos(1, 1)
    print("$===$ Slot Machine $===$")
    for i = 1, 3 do
        print(string.format(" [%s] [%s] [%s] ", symbols[i][1], symbols[i][2], symbols[i][3]))
    end
    print("===================")
end
 
-- Function to spin the slot machine
function spin()
    local symbols = {"Cherry", "Orange", "Lemon", "Plum", "Bell", "Bar"}
    local result = {}
 
    for i = 1, 3 do
        local spinSymbols = {}
        for j = 1, 3 do
            table.insert(spinSymbols, symbols[math.random(1, #symbols)])
        end
        table.insert(result, spinSymbols)
    end
 
    return result
end
 
-- Function to check if the player wins
function checkWin(result)
    -- Customize win conditions based on your preference
    -- For simplicity, let's assume a win if all symbols are the same
    local firstSymbol = result[1][1]
    for i = 1, 3 do
        for j = 1, 3 do
            if result[i][j] ~= firstSymbol then
                return false
            end
        end
    end
    return true
end
 
-- Main game loop
while true do
    local symbols = {{" ", " ", " "}, {" ", " ", " "}, {" ", " ", " "}}
 
    for _ = 1, 10 do -- Increase or decrease the number of spins as needed
        displayInterface(symbols)
        os.sleep(0.1)  -- Adjust sleep time for the desired animation speed
 
        -- Update symbols for the next frame
        for i = 1, 3 do
            for j = 1, 3 do
                symbols[i][j] = symbols[i][j] == " " and symbols[i][j] or " "
            end
        end
    end
 
    displayInterface(symbols)
 
    -- Wait for player input
    local input = tonumber(read())
 
    if input == 0 then
        break -- Exit the game
    elseif input == 1 then
        -- Spin the slot machine
        local result = spin()
 
        -- Display the result
        for _ = 1, 3 do
            displayInterface(result)
            os.sleep(0.2)  -- Adjust sleep time for the desired animation speed
        end
 
        displayInterface(result)
 
        -- Check if the player wins
        if checkWin(result) then
            print("Big win SCRATCH THAT SHIT!!")
        else
            print("You suck loser.")
        end
 
        -- Wait for a key press before restarting
        print("Press any key to play again or 0 to exit.")
        read()
    else
        print("Invalid input. Please enter 1 to spin or 0 to exit.")
        os.sleep(2)
    end
end