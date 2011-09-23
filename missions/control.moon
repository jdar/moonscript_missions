test_if_then = ->
  result = 'default value'
  if true then
    result = 'true value'
  
  assert_equal(__, result)


test_if_then_else = ->
  result = 'default value'
  if true then
    result = 'true value'
  else
    result = 'false value'
  
  assert_equal(__, result)


test_if_then_elseif_else = ->
  result = 'default value'
  if false then
    result = 'first value'
  elseif true then
    result = 'second value'
  else
    result = 'default value'
  
  assert_equal(__, result)


test_if_not_statement = ->
  result = 'default value'
  if not false then
    result = 'updated value'
  
  assert_equal(__, result)


test_and_or_expression = ->
  assert_equal( __,  (true and 'true value' or 'false value') )
  assert_equal( __, (false and 'true value' or 'false value') )


test_while = ->
  i, result = 1,1
  while i <= 10 do
    result = result * i
    i = i + 1
  
  assert_equal(__, result)


test_break = ->
  i, result = 1,1
  while true do
    if i > 10 then break 
    result = result * i
    i = i + 1
  
  assert_equal(__, result)


test_repeat = ->
  i, result = 1, 1
  repeat
    result = result * i
    i = i + 1
  until i==11
  assert_equal(__, result)


test_numeric_for_creates_a_local_variable_not_available_outside_the_loop = ->
  t = { 'fish', 'and', 'chips' }
  result = {}
  for i=1, #t do
    table.insert(result, t[i])
  
  assert_equal(__, table.concat(result, ' '))
  assert_equal(__, i)


test_numeric_for_with_step = ->
  t = { 1,2,3,4,5,6 }
  result = {}
  for i=2, #t, 2 do -- notice the two here
    table.insert(result, t[i])
  
  assert_equal(__, table.concat(result, ', '))


test_generic_for_over_array_like_tables_using_ipairs = ->
  t = { 'fish', 'and', 'chips' }
  result = {}
  for key,value in ipairs(t) do
    table.insert(result, value)
  
  assert_equal(__, table.concat(result, ' '))


test_generic_for_over_hash_like_tables_using_pairs = ->
  t = { a = 1, b = 2 }
  result = {}
  for k,v in pairs(t) do
    result[k] = v
  
  assert_equal(__, result.a)
  assert_equal(__, result.b)

