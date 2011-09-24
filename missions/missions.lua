local agent = require 'lib.agent'

local mission_names = {
  'asserts', 
  'variables',
  'numbers',
  'strings',
  'patterns', 
  'control',  -- dunno what's up with this one
--  'comprehensions_and_with', --unwritten
  'truthiness',
 --classes,    --unwritten
 --inheritance, --unwritten
  'functions',
  'errors',
  'load', -- major load errors
  'tables',
-- 'table_comprehensions', --unwritten
  'tables_and_functions',
  'meta'--[[,       -- these will probably break...
  'indices',
  'exercise',
  'weak_tables',
  'environments'
  ]]
}

local missions = {}

for _, name in ipairs(mission_names) do
  table.insert(missions, { name = name, path = name .. '.moon' })
end

local results = agent.run_missions(missions)
agent.print_missions(results)




