test_basic_error_and_pcall = ->
  value = 1
  problematic_func = ->
    value = 2
    error('this is an error message')
    value = 3
  
  status, message = pcall(problematic_func)

  assert_equal __, value
  assert_equal __, status
  -- the message includes file info, so it'll vary deping on the platform
  assert_equal __, message


test_pcall_returns_true_followed_by_return_values_when_no_errors_are_raised = ->
  noproblemo = ->
    'foo', 'bar'
  
  status, x, y = pcall(noproblemo)

  assert_equal __, status
  assert_equal __, x
  assert_equal __, y


test_pcall_can_pass_parameters_to_invoked_function = ->
  sum = (x,y) ->
    x+y
  
  status, result = pcall(sum, 10, 20)

  assert_equal __, status
  assert_equal __, result


test_pcall_works_ok_on_anonymous_functions = ->
  status, message = pcall(-> error'hi!')
  assert_equal __, status
  assert_equal __, message


test_pcall_works_ok_on_error_itself = ->
  status, message = pcall(error, 'Hello')
  assert_equal __, status
  assert_equal __, message


test_error_removes_file_info_if_second_param_is_0 = ->
  _, message = pcall(error, 'World', 0)
  assert_equal __, message


test_error_returning_non_strings_converts_to_string_but_supresses_file_info = ->
  _, message = pcall(error, 404)
  assert_equal __, message
  -- not only numbers and strings are possible. You can returns tables, functions, etc too.


test_assert_is_defined_by_lua = ->
  status, message = pcall(-> assert false, "This is an error")
  assert_equal __, status
  assert_equal __, message
  -- exercise left out to the reader: figure out how assert might be implemented

