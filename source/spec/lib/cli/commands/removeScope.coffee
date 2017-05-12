'use strict'

module.exports = (dd) ->
  config =
    only: [ 'examples' ]
    except: [ 'examples.selenium' ]
    methods:
      examples:
        properties:
          except: [ 'wrapIt' ]

  dd.drive [
    it: 'removes scope from config file'
    i: [ config, '-o', 'spec/examples/code/', '-e', 'spec/lib/examples/selenium', 'spec/lib/examples/properties/wrapIt.js' ]
    e:
      only: []
      except: []
      methods:
        examples:
          properties:
            except: []
  ]
