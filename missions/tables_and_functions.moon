
test_brackets_convert_dot_dot_dot_to_table = ->
  third = (...) ->
    args = {...}
    return args[3]
  assert_equal(__, third('a','b','c','d'))


test_unpack_for_converting_a_table_into_params = ->
  params = {1,2,3}
  sum = (a,b,c)->
    a+b+c
  
  assert_equal(__, sum(unpack(params)))


test_functions_can_be_inserted_into_tables_and_invoked = ->
  foo = (-> "foo")
  t = {}
  t[1] = foo
  assert_equal(__, t[1]())


test_function_variables_can_be_used_as_literal_table_elements = ->
  foo = (-> "foo")
  t = { foo }
  assert_equal(__, t[1]())


test_anonymous_functions_can_be_used_as_literal_table_elements = ->
  t = { (-> "foo")  }
  assert_equal(__, t[1]())


test_functions_can_be_inserted_into_tables_with_strings_and_invoked = ->
  bar = (-> return "bar")
  t = {}
  t.bar = bar
  assert_equal(__, t.bar())


test_function_variables_can_be_used_as_literal_table_elements_when_using_strings_as_keys = ->
  bar = function() return "bar" 
  t = { bar = bar }
  assert_equal(__, t.bar())


test_anonymous_functions_can_be_used_as_literal_table_elements_when_using_strings_as_keys = ->
  t = { bar = function() return "bar"  }
  assert_equal(__, t.bar())


test_syntactic_sugar_for_declaring_functions_indexed_by_strings = ->
  -- declaring a inside a table with a string is so comon that Lua
  -- provides some syntactic sugar just for that:
  t = {}
  t.bar() return "bar" 
  assert_equal(__, t.bar())


test_colon_syntactic_sugar_for_calling_functions_that_use_the_table_they_are_in_as_param = ->

  t = { 1, 2, 3, 4, 5, 6 }
  t.even(x)
    result = {}
    for i=2, #x, 2 do
      table.insert(result, x[i])
    
    return result
  

  result1 = t.even(t)
  result2 = t:even() -- notice that we used a colon instead of a dot here

  -- these two assertions should expect the same result
  assert_equal(__, table.concat(result1, ', '))
  assert_equal(__, table.concat(result2, ', '))


test_automatic_first_parameter_called_self_when_using_colon_in_declaration = ->
  t = { 1, 2, 3, 4, 5, 6 }
  t:even() -- notice the colon here
    result = {}
    for i=2, #self, 2 do           -- notice the "self"
      table.insert(result, self[i])
    
    return result
  

  result = t:even()
  assert_equal(__, table.concat(result, ', '))

