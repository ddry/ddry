'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'adds scope to config file'
    i: [ {}, '-o', 'spec/examples/code/', '-e', 'spec/lib/examples/selenium', 'spec/lib/examples/properties/wrapIt.js' ]
    e:
      only: [ 'examples' ]
      except: [ 'examples.selenium' ]
      methods:
        examples:
          properties:
            except: [ 'wrapIt' ]
  ]
