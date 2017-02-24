'use strict'

module.exports = (dd) ->
  dd.context "With few set to 2", ->
    dd.drive [
      before: ->
        @.few = 2
      it: "Says 'hihi' once"
      i: []
      e: 'hihi'
    ,
      it: "Says 'blahblah' once"
      i: [ 'blah' ]
      e: 'blahblah'
    ]
  dd.context "With few set to 3", ->
    dd.drive [
      before: ->
        @.few = 3
      it: "Says 'hihihi' once"
      i: []
      e: 'hihihi'
    ,
      it: "Says 'blahblahblah' once"
      i: [ 'blah' ]
      e: 'blahblahblah'
    ]
  dd.context "With few set again to 2", ->
    dd.drive [
      before: ->
        @.few = 2
      it: "Says 'hihi' once"
      i: []
      e: 'hihi'
    ,
      it: "Says 'blahblah' once"
      i: [ 'blah' ]
      e: 'blahblah'
      after: ->
        delete @.few
    ]
