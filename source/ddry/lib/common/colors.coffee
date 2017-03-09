###
# Console colors
###

module.exports =
  bright: (string) ->
    "\x1b[1m#{string}\x1b[0m"

  green: (string) ->
    "\x1b[32m#{string}\x1b[0m"

  red: (string) ->
    "\x1b[31m#{string}\x1b[0m"
