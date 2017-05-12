'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'returns usage info for given command'
    i: [ 'titles' ]
    e:  """

  #{dd.helper.c.bright 'titles'} or #{dd.helper.c.bright 't'} — Parse target code folder files for module titles, save found to #{dd.helper.c.bright 'ddry.json'}
    Human-friendly module title is taken from the first block comment in module code. Once you named your modules this way, refresh
    the spec config with this no arguments command. It also will parse the modules included to spec as #{dd.helper.c.bright 'outside'}.

    Syntax:
      $ ddry t

  """
