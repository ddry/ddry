'use strict'

module.exports =
  context:
    toMocha: (title, specs) ->
      describe title, specs

    toTape: (title, specs) ->
      console.log "\x1b[0m#{title}"
      specs()

  modular:
    toMocha: (title, specs) ->
      console.log "\n\n#{title} \x1b[32mdd\x1b[34mry\x1b[0m modular spec"
      specs()

    toTape: (title, specs) ->
      specs()

  report:
    toMocha: (report) ->
      for statement in report
        describe statement.title, ->
          for messages in statement.messages
            it messages

    toTape: (report) ->
      console.log " \n \n"
      for statement in report
        console.log "\x1b[0m#{statement.title}"
        for messages in statement.messages
          console.log "  \x1b[36m- #{messages}\x1b[0m"
