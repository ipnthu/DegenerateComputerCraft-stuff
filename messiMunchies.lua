local m = peripheral.wrap("right")
m.setTextScale(2)

local foodItems = {
    "Pizza",
    "Burger",
    "Chicken Wings",
    "Gingerbread Cookie",
    "Pumpkin Pie"
}

local function displayMainMenu()
    m.clear()
    m.setCursorPos(1, 1)
    m.write("Welcome to the Food Kiosk")
    m.setCursorPos(1, 2)
    m.write("Please select an item:")

    for i, item in ipairs(foodItems) do
        m.setCursorPos(1, i * 2 + 2)
        m.write(i .. ". " .. item)
        m.setCursorPos(1, i * 2 + 3) -- Add a blank line
    end
end

displayMainMenu() -- Display the main menu

while true do
    local event, side, x, y = os.pullEvent("monitor_touch")
    if side == "right" then
        local selectedItem = foodItems[(y - 2) / 2] -- Adjust for menu offset and blank lines
        if selectedItem then
            m.clear()
            m.setCursorPos(1, 1)
            m.write("You have ordered a " .. selectedItem)
            sleep(3)  -- Wait for a few seconds
            m.clear()
            displayMainMenu() -- Return to the main menu
            
            
            if selectedItem == "Pizza" then
                m.write("You have ordered a Pizza")	
            elseif selectedItem == "Burger" then
                m.write("You have ordered a Burger")
            elseif selectedItem == "Chicken Wings" then
               m.write("You have ordered Chicken Wings
            elseif selectedItem == "Gingerbread Cookie" then
                m.write("You have ordered a Gingerbread Cookie")
            elseif selectedItem == "Pumpkin Pie" then
		m.write("You have ordered a Pumpkin Pie")               
            end
        end
    end
end
