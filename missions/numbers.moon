test_number_conversion = ->
  str = "123"
  assert_equal __, tonumber str + 25


test_cohercion_works_on_aritmetic_operators_with_numbers = ->
  assert_equal __, 1000 + "24"
  assert_equal __, "1024" * 2
  assert_equal __, "64" / 2
  assert_equal __, "2" ^ 8

  -- So these are another 2 ways of converting to number:
  assert_equal __, "20" * 1
  assert_equal __, "20" + 0
  -- ... but your code will be cleaner if you are just explicit about your conversions


test_equals_sign_returns_true_for_equal_values = ->
  assert_equal __, 1 == 1
  assert_equal __, 1 == 2


test_not_equals_sign_returns_true_for_not_equal_values = ->
  assert_equal __,  1 ~= 2 -- raw lua code uses "~="
  assert_equal __,  1 != 2
  assert_equal __, 1 != 1


test_cohercion_does_not_work_on_other_operators = ->
  assert_equal __, "100" == 100
  assert_equal __, "100" != 100


test_division_is_always_decimal = ->
  assert_equal __, 7 / 2


test_there_is_a_table_called_math = ->
  assert_equal __, type math


test_some_math_functions = ->
  assert_equal __, math.sqrt 64
  assert_equal __, math.floor math.pi
  assert_equal __, math.cos math.pi
  assert_equal __, math.abs -20
  assert_equal __, math.max -10, -20, 1

-- List of all math functions:

-- math.abs     math.acos    math.asin       math.atan    math.atan2
-- math.ceil    math.cos     math.cosh       math.deg     math.exp
-- math.floor   math.fmod    math.frexp      math.ldexp   math.log
-- math.log10   math.max     math.min        math.modf    math.pow
-- math.rad     math.random  math.randomseed math.sin     math.sinh
-- math.sqrt    math.tan     math.tanh

-- Interestingly enough, there's no math.round


test_infinite_is_equal_to_math_huge = ->
  infinite = 1/0
  assert_equal __, infinite == math.huge


test_nan_is_the_only_number_not_equal_to_itself = ->
  nan = 0/0
  assert_equal __, nan != nan

  -- another way of obtaining nan is math.sqrt -1

