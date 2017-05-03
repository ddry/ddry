###
# Console colors
###

module.exports =
  blue: (string) ->
    "\x1b[34m#{string}\x1b[0m"

  bright: (string) ->
    "\x1b[1m#{string}\x1b[0m"

  green: (string) ->
    "\x1b[32m#{string}\x1b[0m"

  red: (string) ->
    "\x1b[31m#{string}\x1b[0m"
