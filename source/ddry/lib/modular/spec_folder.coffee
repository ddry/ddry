###
# Modular spec module spec folder processing
###

'use strict'

forMocha = require('../common/harness').forMocha

module.exports =
  run: (dd, title, methodList, mocha) ->
    mocha ?= forMocha()
    return @.processMethodList dd, methodList unless mocha
    that = @
    describe title, ->
      that.processMethodList dd, methodList

  processMethodList: (dd, methodList) ->
    for methodName, methodFile of methodList
      dd.method methodName, methodFile
    true
