'use strict'

module.exports = (dd) ->
  dd.drive
    it: 'returns `titleExtracted` message for given title and file path'
    i: [
      title: 'title'
      filePath: 'filePath'
    ]
    e: "Extracted #{dd.helper.c.green 'title'} from #{dd.helper.c.bright 'filePath'}"
