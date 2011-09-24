

test_double_quoted_strings_are_strings = ->
  str = "Hello, World"
  assert_equal(__, type(str))


test_single_quoted_strings_are_also_strings = ->
  str = 'Goodbye, World'
  assert_equal(__, type(str))


test_double_bracketed_strings_are_also_strings = ->
  str = [[Thank you, World]]
  assert_equal(__, type(str))


test_string_length_operator = ->
  str = "Hello"
  assert_equal(__, #str)


test_use_single_quotes_to_create_str_with_double_quotes = ->
  str = 'He said, "Go Away."'
  assert_equal(__, str) -- just copy the literal over there


test_use_double_quotes_to_create_strings_with_single_quotes = ->
  str = "Don't"
  assert_equal(__, str) -- same, just copy the string


test_you_can_use_backslash_for_those_hard_cases = ->
  a = "He said, \"Don't\""
  b = 'He said, "Don\'t"'
  assert_equal(__, a == b)


test_double_brackets_can_handle_quotes_and_apostrophes_without_escaping_them = ->
  a = [[I can handle both ' and " characters]]
  assert_equal(__, a)
  -- So it's just easier to use them if you have to mix both quotes and apostrophes somehow.



test_it_doesnt_matter_how_many_equal_signs_you_use_as_long_as_they_are_the_same_at_the_start_and_ = ->
  a = [===[one [[two]] three]===]
  b = "one [[two]] three"
  assert_equal(__, a == b)


test_double_quoted_str_interpret_escape_characters = ->
  str = "\n"
  assert_equal(__, #str)


test_single_quoted_str_interpret_escape_characters = ->
  str = '\n'
  assert_equal(__, #str)

test_double_bracketed_quoted_str_dont_interpret_escape_characters = ->
  str = [[\n]]
  assert_equal(__, #str)



test_dot_dot_will_concatenate_two_strings = ->
  str = "Hello, " .. "World"
  assert_equal(__, str)


test_concatenation_will_leave_the_original_strings_unmodified = ->
  hi = "Hello, "
  there = "World"
  str = hi .. there
  assert_equal(__, hi)
  assert_equal(__, there)


test_numbers_must_be_converted_to_strings_before_concatenation = ->
  age = os.date("%Y") - 1993 -- note: os.date provides the current date in different formats
  str = "Lua is " .. tostring(age) .. " years old"
  assert_equal(__, str)


test_booleans_must_be_converted_to_strings_before_concatenation = ->
  to_be = true
  hamlet = tostring(to_be) .. " or " .. tostring(not to_be) .. ", that is the boolean"
  assert_equal(__, hamlet)


test_nil_must_be_converted_to_string_before_concatenation = ->
  nothing_is_impossible_to_mankind = tostring(nil) .. " mortalibus ardui est"
  assert_equal(__, nothing_is_impossible_to_mankind)


test_strings_are_compared_lexicographically = ->
  assert_equal(__, "hello" == "hello")
  assert_equal(__, "hello" ~= "goodbye")
  assert_equal(__, "hello" > "goodbye")


test_there_is_a_table_called_string = ->
  assert_equal(__, type(string))


test_string_upper = ->
  str = "eat me"
  assert_equal(__, string.upper('eat me'))


test_string_byte_returns_the_first_ascii_char = ->
  byte = string.byte("ABCDE")
  assert_equal(__, byte)


test_string_byte_returns_the_ascii_char_of_the_nth_char = ->
  byte = string.byte("ABCDE", 2)
  assert_equal(__, byte)


test_string_byte_returns_the_ascii_chars_of_the_chars_between_start_and_ = ->
  byte1, byte2, byte3 = string.byte("ABCDE", 2, 4)
  assert_equal(__, byte2)


test_string_byte_returns_nil_when_out_of_bounds = ->
  assert_equal(__, string.byte("ABCDE", 100))


test_string_char_builds_strings_from_ascii_codes = ->
  assert_equal(__, string.char(65,66,67))


test_string_char_returns_empty_string_when_called_with_no_params = ->
  assert_equal(__, string.char())


test_string_format_replaces_percent_s_with_string = ->
  result = string.format('My name is %s, %s', 'Bond', 'James Bond')
  assert_equal(__, result)


test_string_format_replaces_percent_q_with_quoted_strings = ->
  result = string.format('I told him: %q', 'Go away')
  assert_equal(__, result)


test_string_format_replaces_percent_d_with_an_integer = ->
  result = string.format('%d, %d, %d and so on...', 1, 2, 3)
  assert_equal(__, result)
  -- there are other letters for formatting numbers:
  -- %c converts a number to char
  -- %e formats a number as an exponent (3.141593e+000)
  -- %E same as %e, but the number will have an uppercase E
  -- %f and %g are floats with 6 and 5 decimal places respectively (padded with 0s if needed)
  -- %i is a synonym of %d
  -- %u formats the integers as unsigned
  -- %o formats numbers in octal
  -- %x & %X format numbers in hexadecimal (lowercase and uppercase characters respectively)


test_string_len() -- another way of getting a string's length
  str = "Hello"
  assert_equal(__, string.len(str))


test_you_actually_dont_need_to_use_the_string_table = ->
  str = "Hello"
  assert_equal(__, str:len()) -- notice the colon!
  -- this works with all string functions


test_shorter_len_requires_extra_parenthesis_around_literals = ->
  assert_equal(__, ("Hello"):len())


test_length_operator_does_not_require_extra_parenthesis_around_literals = ->
  assert_equal(__, #"Hello")
  -- so the length operator is in general more reliable


test_string_sub_returns_a_substring_given_the_start_and__positions = ->
  str = 'all your base'
  start_pos, _pos = 5, 8
  assert_equal(__, string.sub(str, start_pos, _pos))


test_string_sub_can_also_be_used_in_a_shorter_way = ->
  str = 'all your base'
  start_pos, _pos = 5, 8
  assert_equal(__, str:sub(start_pos, _pos))
  -- this is actually possible with all the functions inside string.
  -- The only problem is that you have to put parenthesis around literals, as shown above


test_string_sub_with_just_one_position_returns_from_that_position_until_the_ = ->
  str = 'all your base'
  assert_equal(__, string.sub(str, 5))








