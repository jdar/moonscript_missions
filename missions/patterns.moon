-- patterns are Lua's version of regular expressions

test_string_find_returns_nil_if_pattern_not_matched = ->
  str = 'banana'
  pattern = 'lalala'
  assert_equal __, string.find(str, pattern)

test_string_find_a_pattern = ->
  str = 'banana'
  pattern = 'an'
  start_pos, _pos = string.find(str, pattern)
  assert_equal __, start_pos 
  assert_equal __, _pos 

test_string_find_a_pattern_with_starting_position = ->
  str = 'banana'
  pattern = 'an'
  start_pos, _pos = string.find(str, pattern, 4)
  assert_equal __, start_pos 
  assert_equal __, _pos 

test_dots_are_interpreted_as_any_char = ->
  str = 'banana'
  pattern = 'a...'
  start_pos, _pos = string.find(str, pattern)
  assert_equal __, start_pos
  assert_equal __, _pos

test_dots_are_not_interpreted_as_any_char_if_param_4_is_true = ->
  str = 'banana'
  pattern = 'a...'
  start_pos, _pos = string.find(str, pattern, 1, true)
  assert_equal __, start_pos

-- this is not a test, but a helper function
find = "helper function!"
find = (str, pattern, start) ->
  string.sub(str, string.find(str, pattern, start))

test_find_helper = ->
  assert_equal __, find('find waldo on this phrase', 'w....')

test_character_classes = ->
  letter      = '%a'
  digit       = '%d'
  lower       = '%l'
  upper       = '%u'
  percent     = '%%'

  assert_equal __, find('1 4m 1337', letter)
  assert_equal __, find('This is the 2nd example', digit)
  assert_equal __, find('UPPER lower', lower)
  assert_equal __, find('UPPER lower', upper)
  assert_equal __, find('100% escaped', percent)

  -- other character classes:
  -- %c matches any control character
  -- %x matches any hexadecimal character
  -- %w alphanumeric


test_character_sets = ->
  str = "This is my phrase"
  pattern = "[xz1p]"
  assert_equal __, find(str, pattern)


test_negated_character_sets = ->
  str = "This is my phrase"
  pattern = "[^This ]"
  assert_equal __, find(str, pattern)


test_character_ranges = ->
  str = "a time of wonder"
  pattern = "[d-f]"
  assert_equal __, find(str, pattern)


test_negated_character_ranges = ->
  str = "a time of wonder"
  pattern = "[^a-z]"
  assert_equal __, find(str, pattern)


test_zero_or_more = ->
  assert_equal __, find('I am at your service', 'ax*')


test_one_or_more = ->
  assert_equal __, find('I think 1979 was a great year', '%d+')


test_one_or_none = ->
  assert_equal __, find('Pattern matching is amazing', 'is?')


test_string_find_with_one_capture = ->
  str = "Today's word is: eclectic"
  pattern = ": (.+)"
  start_pos, _pos, match = string.find(str, pattern)
  assert_equal __, match


test_string_find_with_several_captures = ->
  str = "Today's word is: eclectic"
  pattern = "(w%a+).*: (.+)"
  _, _, match1, match2 = string.find(str, pattern)
  assert_equal __, match1
  assert_equal __, match2


test_string_find_nested_captures = ->
  str = "Today's word is: eclectic"
  pattern = ": (..(.+)..)"
  _, _, match1, match2 = string.find(str, pattern)
  assert_equal __, match1
  assert_equal __, match2


test_string_gsub_with_a_string = ->
  str = "Today's word is: eclectic"
  pattern = "(e%a+)"
  result = string.gsub str, pattern, 'banana'
  assert_equal __, result


test_string_gsub_with_a_function = ->
  str = "Today's word is: eclectic"
  pattern = "(e%a+)"
  result = string.gsub(str, pattern, string.upper)
  assert_equal __, result


test_string_gsub_with_an_anonymous_function = ->
  str = "Today's word is: eclectic"
  pattern = "(e%a+)"
  result = string.gsub str, pattern, (x)-> '<'.. x ..'>'
  assert_equal __, result

