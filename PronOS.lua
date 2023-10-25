local running = true
local selectedOption = 1

-- Home page monitor display
local function showHomePage()
  term.clear()
  term.setCursorPos(1, 1)

  print("=== PronOS Home ===")
  print("1. List Programs")
  print("2. List Files")
  print("3. Uninstall PronOS")
  print("4. Exit")

  -- Display cursor
  term.setCursorPos(1, selectedOption + 1)
  write(">")
end

-- Key input function
local function handleInput()
  local _, key = os.pullEvent("key")

  if key == keys.up then
    selectedOption = math.max(1, selectedOption - 1)
  elseif key == keys.down then
    selectedOption = math.min(4, selectedOption + 1)
  elseif key == keys.enter then
    if selectedOption == 1 then
      listPrograms()
    elseif selectedOption == 2 then
      listFiles()
    elseif selectedOption == 3 then
      confirmUninstall()
    elseif selectedOption == 4 then
      running = false
    end
  end
end

-- List programs
local function listPrograms()
  term.clear()
  term.setCursorPos(1, 1)

  print("=== Programs ===")
  local programs = fs.list("/")

  for _, program in ipairs(programs) do
    print("- " .. program)
  end

  os.sleep(2)
end

-- List files
local function listFiles()
  term.clear()
  term.setCursorPos(1, 1)

  print("=== Files ===")
  local files = fs.list(shell.dir())

  for _, file in ipairs(files) do
    print("- " .. file)
  end

  os.sleep(2)
end

-- Function to confirm uninstallation
local function confirmUninstall()
  term.clear()
  term.setCursorPos(1, 1)

  print("Are you sure you want to uninstall PronOS? (y/n)")
  local confirmation = read()

  if confirmation:lower() == "y" then
    term.clear()
    term.setCursorPos(1, 1)
    print("Uninstalling PronOS...")
    os.sleep(2)
    running = false
  end
end

-- Main loop
while running do
  showHomePage()
  handleInput()
end
