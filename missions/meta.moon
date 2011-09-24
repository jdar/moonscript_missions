test_metatables_are_just_regular_tables = ->
  t = { 1, 2, 3 }
  mt = {}
  setmetatable(t, mt)

  assert_equal(__, mt == getmetatable(t))


test_setmetatable_returns_the_table_being_modified = ->
  mt = {}
  t = setmetatable({1, 2, 3}, mt) -- this is a very comon idiom
  assert_equal(__, mt == getmetatable(t))


test__tostring_metamethod_allows_defining_the_way_tables_are_transformed_into_text = ->
  mt = {}
  mt.__tostring = (x) ->
      "table with " .. tostring(#x) .. " items"
  t = setmetatable({1,2,3,4}, mt)
  assert_equal(__, tostring(t))


test__add_metamethod_is_invoked_when_the_plus_symbol_is_used = ->
  mt = {}
  mt.__add = (a,b) ->
      a.value + b.value
  t1 = {value: 10}
  t2 = {value: 20}
  setmetatable(t1, mt) -- it's enough if one of the tables has a metatable with __add

  assert_equal(__, t1 + t2)

  -- other metamethods like __sub, __mul, __div, __mod and __pow are very similar to __add


test__unm_metamethod_is_invoked_when_the_unary_minus_symbol_is_used = ->
  mt = {}
  mt.__unm = (x) ->
      result = {}
      for i=#x, 1, -1 do -- reverse loop
        table.insert(result, x[i])
      result
  t = {1,2,3,4,5}
  setmetatable(t, mt)
  result = -t

  assert_equal(__, table.concat(result, ', '))


test__concat__metamethod_is_invoked_when_dot_dot_operator_is_used = ->
  mt = {}
  mt.__concat = (a,b)->
      result = {}
      for i=1, #a do table.insert(result, a[i])
      for i=1, #b do table.insert(result, b[i])
      result
  t1 = {1,2,3}
  t2 = {4,5,6}
  setmetatable(t1, mt)
  result = t1 .. t2

  assert_equal(__, table.concat(result, ', '))


test__eq_operator_is_invoked_when_the_equal_or_not_equal_operators_are_used = ->

  t1 = {1,2,3}
  t2 = {1,2,3}

  assert_equal(__, t1 == t2)
  assert_equal(__, t1 != t2)

  mt = {}
  mt.__eq = (a,b) ->
      for k,v in pairs(a) do
        if b[k] != v then return false 
      for k,v in pairs(b) do
        if a[k] != v then return false 
      true
  setmetatable(t1, mt)
  assert_equal(__, t1 == t2)
  assert_equal(__, t1 ~= t2)

  -- only works when both tables have the same metatable
  setmetatable(t2, mt)
  assert_equal(__, t1 == t2)
  assert_equal(__, t1 ~= t2)

test__lt_metamethod_is_invoked_when_the_less_or_greater_than_operators_are_used = ->
  mt = {}
  mt.__lt = (a,b) ->
      for i=1, #b do table.insert(a, b[i]) 

  t1 = { 1,2,3 }
  t2 = { 4,5,6 }

  -- as before, this only works if both tables have the same metatable
  setmetatable(t1, mt)
  setmetatable(t2, mt)

  -- we are using the < operator for addition, we can discard the result
  _ = t1 < t2

  assert_equal(__, table.concat(t1, ', '))

  -- there's also a __le that works similarly to lt, but for the <= operator


test__call_operator_is_invoked_when_a_table_is_used_like_a_function = ->
  mt = {}
  mt.__call = (t, x) ->
      x * 2
  doubler = setmetatable({}, mt)
  assert_equal(__, doubler(10))
