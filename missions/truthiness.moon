
-- not a test, but a helper function
is_truthy = (condition) ->
  if condition then return true 
  false

test_true_is_truthy = ->
  assert_equal __, is_truthy(true)

test_false_is_not_truthy = ->
  assert_equal __, is_truthy(false)

test_nil_is_also_not_truthy = ->
  assert_equal __, is_truthy(nil)

test_everything_else_is_truthy = ->
  assert_equal __, is_truthy(1)
  assert_equal __, is_truthy(0)
  assert_equal __, is_truthy({'tables'})
  assert_equal __, is_truthy({})
  assert_equal __, is_truthy("Strings")
  assert_equal __, is_truthy("")
  assert_equal __, is_truthy(-> 'functions too')

-- Bonus note:
-- Is it better to use
--    if obj == nil then
-- or
--    if obj then
-- Why?

