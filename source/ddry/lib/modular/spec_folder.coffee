'use strict'

forMocha = require('../common/harness').forMocha

module.exports =
  run: (dd, title, methodList) ->
    return @.processMethodList dd, methodList unless forMocha()
    that = @
    describe title, ->
      that.processMethodList dd, methodList

  processMethodList: (dd, methodList) ->
    for methodName, methodFile of methodList
      dd.method methodName, methodFile
