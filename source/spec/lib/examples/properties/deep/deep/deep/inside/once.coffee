'use strict'

module.exports = (dd) ->
  [1..3].forEach (n) ->
    dd.helper.context dd, "With few set to #{n}", [n], ->
      dd.drive [
        before: ->
          @.few = n
        it: "Says '#{'hi'.repeat n}' once"
        i: []
        e: 'hi'.repeat n
      ,
        it: "Says '#{'blah'.repeat n}' once"
        i: [ 'blah' ]
        e: 'blah'.repeat n
      ]
