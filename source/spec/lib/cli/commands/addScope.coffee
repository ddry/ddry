'use strict'

module.exports = (dd) ->
  dd.drive [
    before: ->
      process.env.DDRY_CLI = 'cli.js'
    it: 'adds scope to config file'
    i: [ {}, '-o', 'spec/examples/code/', '-e', 'spec/lib/examples/selenium', 'spec/lib/examples/properties/wrapIt.js' ]
    e:
      only: [ 'examples' ]
      except: [ 'examples.selenium' ]
      methods:
        examples:
          properties:
            except: [ 'wrapIt' ]
    after: ->
      delete process.env.DDRY_CLI
  ]
