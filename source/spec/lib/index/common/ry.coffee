'use strict'

module.exports = (dd) ->
  MethodContext = dd.helper.methodContext
  objectContext =
    context: 'Some context'
    it: 'does smth'
    i: []
    e: false
  code = dd.helper.examples.numbering

  dd.context 'If context is given as object', ->
    dd.drive
      before: ->
        @.path = 'path'
        @.modules.path = code
        @.generators.path = {}
        @.generators.path.ordinal = new MethodContext code, 'ordinal', @
        @.methodName = 'ordinal'
      it: 'runs default spec with cases data'
      i: [ objectContext ]
      e: true

  dd.context 'If context is given as string', ->
    dd.drive
      it: 'runs given spec with given data inside ddry context'
      i: [ 'Some context', [ 1 ], dd.helper.f ]
      e: true
