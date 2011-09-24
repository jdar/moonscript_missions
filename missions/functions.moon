test_local_function_inside_another_function = ->
  foo = ->
    'foo'
  assert_equal(__, foo())


test_local_function_with_parameters = ->
  sum = (x,y) ->
    x + y
  
  assert_equal(__, sum(6,4))


test_assign_function_to_variable = ->
  sum = (x,y) ->
    x + y
  
  f = sum
  assert_equal(__, f(3,7))


test_assign_anonymous_function_to_variable = ->
  -- this is actually equivalent to the previous two tests
  f = (x,y) ->
    x + y
  assert_equal(__, f(5,5))


test_functions_that_dont_return_anything_return_nil = ->
  f = (-> )
  assert_equal __, f()


test_recursive_functions = ->
  recurse = (x) ->
    if x <= 0 then return 0
    x + recurse(x-1)
  
  assert_equal __, recurse(10)


test_return_multiple_values = ->
  mangle =  (x,y,z) ->
    x*2, y+1, z-1

  a,b,c = mangle 1,2,3
  assert_equal __, a
  assert_equal __, b
  assert_equal __, c


test_ignore_returned_values_on_assignments = ->
  stuff = ->
    1,2,3,4,5,6
  
  _,_,x = stuff!
  assert_equal __, x


test_use_returned_values_on_functions = ->
  repeat_parameter = (p) ->
    p, p
  
  sum = (x,y) ->
    x + y
  
  assert_equal __, sum(repeat_parameter 5)


test_ignore_returned_values_as_parameters = ->
  stuff = (p) ->
    1,2,3,4,5,6
  
  sum = (x,y)->
    x + y
  
  assert_equal __, sum(stuff!)


test_only_the_last_invoked_function_returns_all_values_the_rest_return_just_one = ->
  numbers = ->
    10, 9, 8
  
  sum = (a,b,c,d) ->
    a + b + c + d
  
  assert_equal __, sum(numbers!, numbers!)


test_parameters_not_passed_are_nil = ->
  unused_param = (p) ->
    assert_equal __, p

  unused_param = ->


test_make_use_of_nil_for_default_values = ->
  add = (number, amount) ->
    amount = amount or 1 -- very common language idiom for default values
    number + amount
  
  assert_equal __, add(10)


test_functions_can_access_variables_on_their_defining_scope = ->
  -- This mix of a scope and a inside it is called "a closure"
  value = 10
  change = ->
    value = 20
  
  change!
  assert_equal(__, value)


test_parenthesis_are_not_needed_on_invocation_when_the_only_parameter_is_a_string = ->
  count_spaces = (str) ->
    count = 0
    str:gsub " ", (-> count = count + 1) -- notice the closure here!
    count
  
  assert_equal __, count_spaces "This string has four spaces" -- no parenthesis!


test_parenthesis_are_not_needed_on_invocation = ->
  count_zeroes = (t) ->
    count = 0
    for i=1, #t do
      count = count + (t[i] == 0 and 1 or 0)
    count
  
  assert_equal __, count_zeroes {1, 0, 2, 3, 0, 4, 5, 6, 0, 7}


test_variable_number_of_arguments_with_dot_dot_dot = ->
  third = (...)->
    _,_,x = ...
    x
  
  assert_equal(__, third('a','b','c','d'))

