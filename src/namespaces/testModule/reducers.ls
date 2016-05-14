# This is the reducer that make the rules
module.exports = counter = (state = 0, action) ->
  switch action.type
    | \set => action.number
    | \increment => state + 1
    | \decrement => state - 1
    | otherwise  => state