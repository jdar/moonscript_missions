test_variables_are_defined_locally_by_default = ->
  x = 'a value'
  assert_equal 'a value', x

local_variables_are_not_available_outside_the_scope_where_they_were_defined = ->
  assert_equal nil, x

--export y -- TODO: this should be defineable within the block
--test_global_variables_are_defined_with_export = ->
--  y = 'a global value'
--  assert_equal 'a global value', y

test_global_variables_are_available_outside_the_scope_where_they_were_defined = ->
  assert_equal nil, y

-- Note: don't use global variables. Your house will burn down with all your pets inside.

test_nil_is_the_default_value_of_uninitialized_variables = ->
  assert_equal true, foo == nil 

test_local_variables_in_inner_context_are_invisible_outside = ->
  if true
    foo = 'foo'
    assert_equal 'foo', foo
  assert_equal nil, foo 


test_multiple_assignment_with_commas = ->
  a,b,c = 1,2,3
  assert_equal 2, b

test_switching_variables = ->
  a,b = 1,2
  a,b = b,a
  assert_equal 1, b


test_nil_type = ->
  assert_equal "nil", type nil

test_number_type = ->
  assert_equal 'number', type 10
  assert_equal "number", type 0
  assert_equal "number", type 3.1415927
  assert_equal "number", type -10
  assert_equal "number", type 1.2345e6
  -- we'll see more about numbers in numbers.lua


test_string_type = ->
  assert_equal "string", type "hello"
  assert_equal "string", type 'hello'
  assert_equal "string", type [[hello]]
  -- learn more about strings in strings.lua


test_boolean_type = ->
  assert_equal "boolean", type true
  assert_equal "boolean", type false


test_table_type = ->
  assert_equal "table", type {} -- 
  -- there's lots to be learnt about tables in tables.lua


test_function_type = ->
  assert_equal "function", type assert_equal -- assert_equal *is* a function
  assert_equal "function", type type -- and so is type


test_thread_type = ->
  assert_equal "thread", type(coroutine.create -> )
  -- we'll probably not learn about coroutines in our missions.


-- There is another type, called 'userdata', reserved for objects that interact with C
-- These are the objects that make embedding possible
