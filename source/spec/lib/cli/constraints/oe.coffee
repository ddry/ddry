'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns `only` one mode scope'
    i: [ [ '-o', 1, 2, 3 ] ]
    e:
      only: [ 1, 2, 3 ]
  ,
    it: 'returns `except` one mode scope'
    i: [ [ '-e', 1, 2, 3 ] ]
    e:
      except: [ 1, 2, 3 ]
  ,
    it: 'returns only-except mixed scope'
    i: [ [ '-o', 1, 2, 3, '-e', 4, 5 ] ]
    e:
      only: [ 1, 2, 3 ]
      except: [ 4, 5 ]
  ,
    it: 'returns except-only mixed scope'
    i: [ [ '-e', 1, 2, 3, '-o', 4, 5 ] ]
    e:
      only: [ 4, 5 ]
      except: [ 1, 2, 3 ]
  ]
