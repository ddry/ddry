###
# Command line interface titles parser
###

'use strict'

attach = require '../modular/attach'
folder = require '../fs/folder'
io = require './io'
object = require '../common/object'
log = require './log'

module.exports =
 process: (filesHash) ->
    titles = {}
    for name, filePath of filesHash
      titles[name] = @.parse filePath
    titles

  parse: (filePath) ->
    file = io.readFile filePath
    title = file.match /\/\*\s*\*\s*([^*]*?)\s*\*/
    if Array.isArray title
      title = title[1]
      log.info 'titleExtracted',
        title: title
        filePath: filePath
      return title
    log.info 'noTitle', filePath
    filePath

  get: (config) ->
    filesHash = folder.read '', config.code, true
    filesHash = attach.outside filesHash, config
    io.save
      modulePaths: filesHash
    , true
    titles = @.process filesHash
    moduleTitles = {}
    for name, title of titles
      moduleTitles = object.insertKey moduleTitles, name, title
    moduleTitles
