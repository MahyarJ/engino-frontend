module.exports = test = (state = 0, action) ->
  switch action.type
    | \set => action.number
    | otherwise  => state