
local DAY = 6
local MONTH = 07
local YEAR = 2024

--===============================================================================================================---

-- EXPIRE DATE, TIME LEFT AND EXPIRATION
local currentYear = tonumber(os.date("%Y"))
local currentMonth = tonumber(os.date("%m"))
local currentDay = tonumber(os.date("%d"))
local currentHour = tonumber(os.date("%H"))
local currentMinute = tonumber(os.date("%M"))
local currentSecond = tonumber(os.date("%S"))

-- Table to map month numbers to month names
local months = {
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
}

-- Function to format the expiration date
local function formatExpirationDate(day, month, year)
  local monthName = months[tonumber(month)]
  return string.format("%s %d, %d", monthName, day, year)
end

-- Function to calculate the time difference
local function calculateTimeLeft(expirationTime)
  local now = os.time()
  local timeLeft = expirationTime - now

  local years = math.floor(timeLeft / (365 * 24 * 3600))
  local months = math.floor((timeLeft % (365 * 24 * 3600)) / (30 * 24 * 3600))
  local weeks = math.floor((timeLeft % (30 * 24 * 3600)) / (7 * 24 * 3600))
  local days = math.floor((timeLeft % (7 * 24 * 3600)) / (24 * 3600))
  local hours = math.floor((timeLeft % (24 * 3600)) / 3600)
  local minutes = math.floor((timeLeft % 3600) / 60)
  
  return years, months, weeks, days, hours, minutes
end

-- Function to format time left in a readable format
local function formatTimeLeft(years, months, weeks, days, hours, minutes)
  local timeComponents = {}
  
  if years > 0 then
    table.insert(timeComponents, string.format("%d year%s", years, years > 1 and "s" or ""))
  end
  
  if months > 0 then
    table.insert(timeComponents, string.format("%d month%s", months, months > 1 and "s" or ""))
  end
  
  if weeks > 0 then
    table.insert(timeComponents, string.format("%d week%s", weeks, weeks > 1 and "s" or ""))
  end
  
  if days > 0 then
    table.insert(timeComponents, string.format("%d day%s", days, days > 1 and "s" or ""))
  end
  
  if hours > 0 then
    table.insert(timeComponents, string.format("%d hour%s", hours, hours > 1 and "s" or ""))
  end
  
  if minutes > 0 then
    table.insert(timeComponents, string.format("%d minute%s", minutes, minutes > 1 and "s" or ""))
  end
  
  return table.concat(timeComponents, " ")
end

-- Check if the script is expired
local expirationTime = os.time({year = YEAR, month = MONTH, day = DAY, hour = 0, min = 0, sec = 0})
if os.time() > expirationTime then
  gg.alert("⚠⚠ Script expired ⚠⚠")
  gg.setVisible(true)
  os.exit()
end
