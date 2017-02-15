'use strict'

module.exports = (dd) ->
  ddry = dd.helper.ddry()

  if dd.helper.forMocha()
    dd.drive [
      it: "returns false if output is muted"
      i: [ ddry ]
      e: false
    ,
      it: "returns false if runs in Mocha"
      i: [ ddry, true ]
      e: false
    ,
      it: "runs Tape modular spec"
      i: [ ddry, true, false, dd.helper.tapeRunner ]
      e: true
    ]
  else
    ddry.modular
      title: 'muteTape test instance'
      outside:
        muteTape: 'spec/examples/code/lib/test_singleton'
      spec: 'spec/examples/spec'

    dd.drive [
      it: "returns false if output is muted"
      i: [ ddry ]
      e: false
    ,
      it: "returns false if runs in Mocha"
      i: [ ddry, true ]
      e: true
    ,
      it: "runs Tape modular spec"
      i: [ ddry, true, false ]
      e: true
    ]
