'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns initial config file with given params'
    i: [ '', 'spec/', 'lib/', 'Initial title' ]
    e:
      spec: 'spec'
      code: 'lib'
      title: 'Initial title'
  ,
    it: 'sets the default suite title'
    i: [ '', 'spec/' ]
    e:
      spec: 'spec'
      title: 'spec'
  ,
    it: 'ignores `dot` code folder and sets title'
    i: [ '', 'spec', '.', 'No code folder title' ]
    e:
      spec: 'spec'
      title: 'No code folder title'
  ]
