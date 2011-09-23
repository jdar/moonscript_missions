require("moonscript.parse")
require("moonscript.compile")
local parse, compile = moonscript.parse, moonscript.compile

local agent = require 'lib.agent'

local mission_names = {
  'asserts',
  'variables'
}

local missions = {}

for _, name in ipairs(mission_names) do
  table.insert(missions, { name = name, path = name .. '.moon' })
end

local results = agent.run_missions(missions)
agent.print_missions(results)




