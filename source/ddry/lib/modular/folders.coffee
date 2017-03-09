###
# Modular spec folders processing
###

'use strict'

folder = require '../fs/folder'

module.exports =
  read: folder.read

  initCodeModules: (params) ->
    return {} unless params.code?
    folder.read params.title, params.code, true

  outside: (name, outsidePath) ->
    return "#{name}": outsidePath unless folder.isFolder outsidePath
    folderModules = folder.read name, outsidePath
    mounted = {}
    for moduleName, modulePath of folderModules
      mounted["#{name}.#{moduleName}"] = modulePath
    mounted
