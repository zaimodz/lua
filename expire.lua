local DAY = 7
local MONTH = 7
local YEAR = 2024

local expirationTime = os.time({year = YEAR, month = MONTH, day = DAY, hour = 0, min = 0, sec = 0})
if os.time() > expirationTime then
  gg.alert("⚠⚠ Script expired ⚠⚠")
  gg.setVisible(true)
  os.exit()
end
