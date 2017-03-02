'use strict'

module.exports =
  context:
    mocha: (title, specs) ->
      describe title, specs

    tap: (title, specs) ->
      specs()

    tape: (title, specs) ->
      console.log "\x1b[0m#{title}"
      specs()

  modular:
    mocha: (title) ->
      console.log "\n\n#{title} \x1b[32mdd\x1b[34mry\x1b[0m modular spec"

    tap: (title) ->
      console.log " \n#{title} \x1b[32mdd\x1b[34mry\x1b[0m modular spec"

    tape: (title) ->
      true

  report:
    mocha: (report) ->
      for statement in report
        describe statement.title, ->
          for messages in statement.messages
            it messages

    tap: (report) ->
      console.log " \n"
      for statement in report
        console.log "\x1b[0m#{statement.title}"
        for messages in statement.messages
          console.log "  \x1b[36m- #{messages}\x1b[0m"
      console.log " \n"

    tape: (report) ->
      console.log " \n"
      for statement in report
        console.log "\x1b[0m#{statement.title}"
        for messages in statement.messages
          console.log "  \x1b[36m- #{messages}\x1b[0m"
