test_variables_are_defined_locally_by_default = ->
  x = 'a value'
  assert_equal __, x

local_variables_are_not_available_outside_the_scope_where_they_were_defined = ->
  assert_equal __, x

--export y -- TODO: this should be defineable within the block
--test_global_variables_are_defined_with_export = ->
--  y = 'a global value'
--  assert_equal 'a global value', y

test_global_variables_are_available_outside_the_scope_where_they_were_defined = ->
  assert_equal __, y

-- Note: don't use global variables. Your house will burn down with all your pets inside.

test_nil_is_the_default_value_of_uninitialized_variables = ->
  assert_equal __, foo == nil 

test_local_variables_in_inner_context_are_invisible_outside = ->
  if true
    foo = 'foo'
    assert_equal __, foo
  assert_equal __, foo 


test_multiple_assignment_with_commas = ->
  a,b,c = 1,2,3
  assert_equal __, b

test_switching_variables = ->
  a,b = 1,2
  a,b = b,a
  assert_equal __, b


test_nil_type = ->
  assert_equal __, type nil

test_number_type = ->
  assert_equal __, type 10
  assert_equal __, type 0
  assert_equal __, type 3.1415927
  assert_equal __, type -10
  assert_equal __, type 1.2345e6
  -- we'll see more about numbers in numbers.lua


test_string_type = ->
  assert_equal __, type "hello"
  assert_equal __, type 'hello'
  assert_equal __, type [[hello]]
  -- learn more about strings in strings.lua


test_boolean_type = ->
  assert_equal __, type true
  assert_equal __, type false


test_table_type = ->
  assert_equal __, type {} -- 
  -- there's lots to be learnt about tables in tables.lua


test_function_type = ->
  assert_equal __, type assert_equal -- assert_equal *is* a function
  assert_equal __, type type -- and so is type


test_thread_type = ->
  assert_equal __, type(coroutine.create -> )
  -- we'll probably not learn about coroutines in our missions.


-- There is another type, called 'userdata', reserved for objects that interact with C
-- These are the objects that make embedding possible
