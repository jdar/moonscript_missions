test_creating_empty_tables = ->
  empty_table = {}
  assert_equal __, type(empty_table)

test_empty_tables_return_nil_when_indexed = ->
  empty_table = {}
  assert_equal __, empty_table[1]

test_table_modifications = ->
  t = {}
  t[1] = 1
  assert_equal __, t[1]

  t[2] = 2
  assert_equal __, t[2]

  t[3] = 'a'
  assert_equal __, t[3]

  assert_equal __, t[4]

test_inline_table_literals = ->
  t = { 1, 2, 'a' }
  assert_equal __, t[1]
  assert_equal __, t[2]
  assert_equal __, t[3]

test_tables_inside_tables = ->
  t = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } }
  assert_equal __, t[2][3]

test_tables_are_references_not_values = ->
  a = { 1, 2, 3 }
  b = { 1, 2, 3 }
  c = a
  assert_equal __, a == b
  assert_equal __, a == c

test_table_concat = ->
  t = { 'one', 'two', 'three' }
  assert_equal __, table.concat(t)

test_table_concat_with_separator = ->
  t = { 'one', 'two', 'three' }
  assert_equal __, table.concat(t, ', ')

test_the_default_table_table = ->
  -- there's a table called "table". It has functions for table manipulation inside
  assert_equal __, type(table)

test_table_insert = ->
  a = { 1, 2 }
  table.insert(a, 3)
  assert_equal __, table.concat(a, ', ')

test_table_insert_with_position = ->
  a = { 'a', 'c' }
  table.insert(a, 2, 'b')
  assert_equal __, table.concat(a, ', ')

test_table_remove = ->
  a = { 1, 2, 3, 'last' }
  table.remove(a)
  assert_equal __, table.concat(a, ', ')

test_table_remove_with_position = ->
  a = { 'a', 'b', 'foo', 'c' }
  table.remove(a, 3)
  assert_equal __, table.concat(a, ', ')

test_table_sort = ->
  x = { 5, 3, 25, 1 }
  table.sort(x)
  assert_equal __, table.concat(x, ', ')

test_table_sort_with_function = ->
  x = { 5, 3, 25, 1 }
  table.sort x, (a, b) -> a > b
  assert_equal __, table.concat(x, ', ')

test_table_length = ->
  a = { 1, 2, 3 }
  assert_equal __, #a

test_table_length_only_takes_into_account_consecutive_numbers = ->
  t = { 1, 2, 3 }
  t[1000] = 1000
  assert_equal __, #t

--test_using_string_as_keys = ->
--  t = { ['hi']:  'hello' }
--  t['you'] = 'world'
--  assert_equal __, t['hi']
--  assert_equal __, t['you']

test_nicer_ways_of_using_strings_as_keys = ->
  -- this is the preferred way of using strings as keys. If you need to use reserved words,
  -- or other things (functions, tables) as keys you will need to use the previous form
  t = { hi: 'hello' }
  t.you = 'world'
  assert_equal __, t.hi
  assert_equal __, t.you

test_creating_an_inline_mixed_table = ->
  t = { 'a', 'b', 'c', foo: 'foo' }
  assert_equal __, t[1]
  assert_equal __, t[2]
  assert_equal __, t.foo

--Are mixed-tables broken? Lua supports this. :(
--test_non_numberic_keys_are_ignored_by_table_length = ->
--  t = { 1,2, hi : 'hello' }
--  assert_equal __, #t

--test_non_numeric_keys_are_ignored_by_table_concat = ->
--  t = { 1,2, hello : 'hi' }
--  assert_equal __, table.concat(t, ', ')

--test_using_tables_as_keys = ->
--  hi = { 1, 2, 3 }
--  you = { 4, 5, 6 } 
--  t = { [hi] : 'hello' }
--  t[you] : 'world'
--  assert_equal __, t[hi]
--  assert_equal __, t[you]
--  assert_equal __, t[{1, 2, 3}] -- remember: tables are treated as references

test_unpacking_a_table = ->
  t = { 1, 2, 3 }
  a,b,c = unpack(t)
  assert_equal __, a
  assert_equal __, b
  assert_equal __, c


