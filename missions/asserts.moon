
--
-- WELCOME
-- Try changing some of the values below.
--

test_assert = ->
  assert_true false  -- this should be true. This is how you write comments

test_assert_with_message = ->
  assert_true false, 'This should be true'

test_assert_expression = ->
  expected_value = __
  actual_value = 1 + 1
  assert_true expected_value == actual_value

test_assert_equals = ->
  expected_value = __
  actual_value = 1 + 1
  assert_equal expected_value, actual_value

test_assert_fill_in_values = ->
  assert_equal 1 + 1, __

test_assert_not = ->
  assert_not __, 'This should be false'

