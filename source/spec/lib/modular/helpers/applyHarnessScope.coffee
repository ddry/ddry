'use strict'

module.exports = (dd) ->
  dd.drive [
    it: 'returns params unchanged if no harness scopes set'
    i: [ {}, {} ]
    e: {}
  ,
    it: 'returns params unchanged if harness scope is not applicable'
    i: [ harness: 'mocha',
      harness:
        tap:
          except: 'examples.selenium'
    ]
    e:
      harness:
        tap:
          except: 'examples.selenium'
  ,
    it: 'applies relevant harness scope'
    i: [ harness: 'tape',
      harness:
        tap:
          except: 'examples.selenium'
    ]
    e:
      harness:
        tap:
          except: 'examples.selenium'
      except: 'examples.selenium'
  ]
