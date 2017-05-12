'use strict'

module.exports = (dd) ->
  dd.drive [
    matcher: 'error'
    it: 'returns error if specified code folder does not exist'
    i: [ '', 'failing/path/', 'spec/path/' ]
    e: "#{dd.helper.c.red 'ERROR:'} Specified code folder #{dd.helper.c.bright 'failing/path'} does not exist."
  ,
    it: 'returns initial config file with given params'
    i: [ '', 'lib/', 'spec/lib/', 'Initial title' ]
    e:
      code: 'lib'
      spec: 'spec/lib'
      title: 'Initial title'
  ,
    it: 'sets the default suite title'
    i: [ '', 'lib/', 'spec/lib/' ]
    e:
      code: 'lib'
      spec: 'spec/lib'
      title: 'lib'
  ]
