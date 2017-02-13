'use strict'

validModule = 
  title: 'numbering'
  path: 'spec/examples/code/lib/numbering'

module.exports = (dd) ->
  ddry = dd.helper.ddry()
  target = dd.helper.requireSafe validModule

  dd.drive
    it: "processes the target code module"
    i: [ ddry, validModule, target ]
    e: target
