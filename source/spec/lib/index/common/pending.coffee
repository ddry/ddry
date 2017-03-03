'use strict'

module.exports = (dd) ->
  dd.context 'For object module exports', ->
    dd.drive
      before: ->
        @.path = 'path'
        @.titles.path = 'title'
        @.methodName = 'method'
      it: 'generates pending spec mentioning method name'
      i: []
      e:
        matcher: 'plain'
        xit: 'pending: title: method()'
        i: 1
        e: 1

  dd.context 'For function module exports', ->
    dd.drive
      before: ->
        @.path = 'path'
        @.titles.path = 'title'
        @.methodName = false
        @.specName = 'spec'
      it: 'generates pending spec mentioning spec name'
      i: []
      e:
        matcher: 'plain'
        xit: 'pending: title: spec()'
        i: 1
        e: 1
