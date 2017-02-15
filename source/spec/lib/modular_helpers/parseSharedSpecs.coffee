'use strict'

module.exports = (dd) ->
  dd.drive [
    it: "returns spec paths hash if no shared specs specified"
    i: [
      code_one: 'code/lib/code_one'
      code_two: 'code/lib/code_two'
      code_six: 'code/lib/code_six'
    ,
      spec: 'spec'
    ]
    e:
      code_one: 'spec/code_one'
      code_two: 'spec/code_two'
      code_six: 'spec/code_six'
  ,
    it: "returns spec paths hash if no shared specs specified"
    i: [
      code_one: 'code/lib/code_one'
      code_two: 'code/lib/code_two'
      code_six: 'code/lib/code_six'
      code_ten: 'code/lib/code_ten'
    ,
      spec: 'spec'
      shareSpecs:
        oneten: [ 'code_one', 'code_ten' ]
        twosix: [ 'code_two', 'code_six' ]
    ]
    e:
      code_one: 'spec/oneten'
      code_two: 'spec/twosix'
      code_six: 'spec/twosix'
      code_ten: 'spec/oneten'
  ]
