'use strict'

module.exports = (dd) ->
  instance = dd.helper.examples.instance
  Instance = instance

  multipleInstances =
    first: new Instance '1st title', '1st message'
    second: new Instance '2nd title', '2nd message'
    folder:
      first: new Instance '1st folder title', '1st folder message'
      second: new Instance '2nd folder title', '2nd folder message'

  multiple =
    initials:
      first: [ '1st title', '1st message' ]
      second: [ '2nd title', '2nd message' ]
      folder:
        first: [ '1st folder title', '1st folder message' ]
        second: [ '2nd folder title', '2nd folder message' ]
    mounted:
      modules: multipleInstances
      instanceNames: [
        'first'
        'second'
        'folder.first'
        'folder.second'
      ]
      instancesList: multipleInstances

  dd.ry
    single:
      context: 'With single initials'
      it: 'creates and mounts single instance'
      i: [ instance, [ 'title', 'message' ] ]
      e:
        modules: new Instance 'title', 'message'
        instanceNames: {}
    multiple:
      context: 'With multiple initials'
      it: 'creates and mounts multiple structured instances'
      i: [ instance, multiple.initials ]
      e: multiple.mounted
