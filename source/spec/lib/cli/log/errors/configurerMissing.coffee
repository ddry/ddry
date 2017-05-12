'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'returns `codeFolderUndefined` error message'
    i: [ 'path' ]
    e: "Failed to load configurer file from #{dd.helper.c.bright 'path'}"
