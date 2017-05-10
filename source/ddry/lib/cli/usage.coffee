'use strict'

c = require '../common/colors'

module.exports =
  brief: """

  #{c.ddry()} #{c.bright ' command line interface usage summary'}

    #{c.green 'Commands:'}
      #{c.bright 'init'} or #{c.bright 'i'}           Initialize config file
      #{c.bright 'add'} or #{c.bright 'a'}            Add a named value to spec config file #{c.bright '(ddry.json)'}
      #{c.bright 'addScope'} or #{c.bright 'as'}      Add a spec execution scope (except or only) to #{c.bright 'ddry.json'}
      #{c.bright 'config'} or #{c.bright 'c'}         Generate config with specified configurer module returning config object with given parameters
      #{c.bright 'usage'} or #{c.bright 'u'}          Get usage info for a specific command or usage summary. Also #{c.bright 'h'} and #{c.bright '?'} are supported
      #{c.bright 'remove'} or #{c.bright 'r'}         Remove a named value from config file #{c.bright '(ddry.json)'}
      #{c.bright 'removeScope'} or #{c.bright 'rs'}   Remove a spec execution scope (except or only) from #{c.bright 'ddry.json'}
      #{c.bright 'titles'} or #{c.bright 't'}         Parse target code folder files for module titles, save found to #{c.bright 'ddry.json'}

    #{c.blue 'Suite execution scoping:'}
      #{c.bright 'When running'} #{c.ddry()} #{c.bright 'specs from inside test harness'}
        Simply provide your test harness with #{c.bright 'node_modules/ddry/ddry.js'} — it will pass to harness your suite
        configured and scoped with #{c.bright 'ddry.json'}. Customize it with 'add', 'remove', 'addScope' and 'removeScope'
        commands or plain editing.

      #{c.bright 'When running'} #{c.ddry()} #{c.bright 'specs from harness-specific CLI tool'}
        #{c.ddry()} optional dependencies packages include three harness-specific CLI tools for Mocha JS, TAP and Tape JS,
        respectively: #{c.bright 'ddry-mocha'}, #{c.bright 'ddry-tap'} and #{c.bright 'ddry-tape'}. Their sole purpose is to run the scoped suite with the test
        harness of your choice right in one shell command. Below examples use #{c.bright 'ddry-mocha'}, meaning that you should use
        the tool for the test harness of your choice.

        $ ddry-mocha -o <spec or code file or folder path(s), `tab` completed>
          — running #{c.bright 'only'} specified modules or module methods specs
        $ ddry-mocha -e <spec or code file or folder path(s), `tab` completed>
          — running the whole suite #{c.bright 'except'} specified modules or module methods specs

        Only and except strategies may be combined in any order as long as -o and -e keys are used once:
        $ ddry-mocha -o spec/lib/examples -e spec/lib/examples/instances spec/examples/selenium

  """

  add: """

  #{c.bright 'add'} or #{c.bright 'a'} — Add a named value to spec config file #{c.bright '(ddry.json)'}
    Create an empty array with #{c.bright '[]'} keyword or an empty object with #{c.bright '{}'}. Add new key-value pairs to objects
    using the dotted notation or populate arrays with new elements.

    Syntax:
      $ ddry a <config.object.key.in.dotted.notation> <value>
    Examples:
      $ ddry a methods.examples.properties.only []
      $ ddry a methods.examples.properties.only setFew

  """

  addScope: """

  #{c.bright 'addScope'} or #{c.bright 'as'} — Add a spec execution scope (except or only) to #{c.bright 'ddry.json'} for:
    — modules folder of any depth (#{c.bright 'code'} or #{c.bright 'spec'} folders recognized)
    — single modules (#{c.bright 'code'} or #{c.bright 'spec'} folder files recognized)
    — certain methods of certain modules (only #{c.bright 'spec'} folder files recognized)

    Syntax:
      $ ddry as <-o|-e> <spec or code file or folder path(s), `tab` completed>
    Examples:
      $ ddry as -o spec/lib/examples/properties/setFew.js spec/examples/properties/ spec/lib/examples/instance
      $ ddry as -e spec/lib/fs lib/modular lib/common/object/clone.js

  """

  config: """

  #{c.bright 'config'} or #{c.bright 'c'} — Generate config with specified configurer module returning config object with given parameters

    The #{c.bright 'config'} command gives you access to ultimate automation of data-driven spec configuring. The point is that
    you create the module that takes some arguments and returns the config object to be saved as #{c.bright 'ddry.json'} and used
    as spec config file. This flexibility makes multiple configurer files pointless, so after you've specified
    the configurer module path at least once, you may omit it and just give the parameters to be passed to your
    configurer module. You may check the configurer path and passed parameters in the automatically added #{c.bright 'cli.config'}
    section of #{c.bright 'ddry.json'}.

    You also may use harness-specific tools #{c.bright 'ddry-mocha'}, #{c.bright 'ddry-tap'} and #{c.bright 'ddry-tape'} to feed the generated config file
    to the harness of your choice on the fly, in one shell command.

    Syntax:
      $ ddry[-<harness>] [<configurer module path, `tab` completed>] <arguments to be passed to your configurer>
    Examples:
      $ ddry spec/config nd
      $ ddry-tape ne

  """

  init: """

  #{c.bright 'init'} or #{c.bright 'i'} — Initialize config file
    Creates minimum viable data-driven testing configuration file #{c.bright 'ddry.json'} with
    — target code folder #{c.bright '(mandatory)'}
    — #{c.ddry()} convention-over-configuration spec folder #{c.bright '(mandatory)'}
    — whole spec suite title #{c.bright '(optional)'}

    Of course, right from this point and as long as possible further intensive use of shell file
    and folder paths `tab` completion is strongly encouraged.

    #{c.bright '$ ddry i <code> <spec> [<title>]'}

    Default #{c.bright 'title'} equals #{c.bright 'code'}.

    Syntax:
      $ ddry i <code> <spec> [<title>]
    Example:
      $ ddry i lib/ spec/lib "Human friendly test suite title"

  """

  usage: """

  #{c.bright 'usage'} or #{c.bright 'u'} — Get usage info for a specific command or usage summary. Also #{c.bright 'h'} and #{c.bright '?'} are supported
    If the command you ask about is recognized, its usage info is returned. Missing or misspelled command name result
    in brief usage summary being returned.

    Harness-specific tools will also yield usage info, but will exit without launching the test harness.

    Syntax:
      $ ddry <h|u|?> [<command name>]
    Examples:
      $ ddry ? ?
      $ ddry u addScope

  """

  remove: """

  #{c.bright 'remove'} or #{c.bright 'r'} — Remove a named value from spec config file #{c.bright '(ddry.json)'}
    Remove previously set object key-value pairs or arrays elements. For objects only dot-notated property name is required, including
    numeric indexes of array elements since arrays are objects in JS. This approach is quite fruitful, but requires you to know the index
    of the array element you wish to remove, what is rather uncomfortable. To deal with arrays the more realistic way you may specify
    the second argument which will be removed once found in the target array.

    However, somehow you'll may find manual editing of #{c.bright 'ddry.json'} more comfortable.

    Syntax:
      $ ddry r <config.object.key.in.dotted.notation> [<value>]
    Example:
      $ ddry r only.1
      $ ddry r methods.examples.properties.except setFew


  """

  removeScope: """

    #{c.bright 'removeScope'} or #{c.bright 'rs'} — Remove a previously set spec execution scope (except or only) from #{c.bright 'ddry.json'} for:
      — modules folder of any depth (#{c.bright 'code'} or #{c.bright 'spec'} folders recognized)
      — single modules (#{c.bright 'code'} or #{c.bright 'spec'} folder files recognized)
      — certain methods of certain modules (only #{c.bright 'spec'} folder files recognized)

      However, somehow you'll may find manual editing of #{c.bright 'ddry.json'} more comfortable.

      Syntax:
        $ ddry rs <-o|-e> <spec or code file or folder path(s), `tab` completed>
      Examples:
        $ ddry rs -o spec/lib/examples/properties/setFew.js spec/examples/properties/ spec/lib/examples/instance
        $ ddry rs -e spec/lib/fs lib/modular lib/common/object/clone.js

  """

  titles: """

  #{c.bright 'titles'} or #{c.bright 't'} — Parse target code folder files for module titles, save found to #{c.bright 'ddry.json'}
    Human-friendly module title is taken from the first block comment in module code. Once you named your modules this way, refresh
    the spec config with this no arguments command. It also will parse the modules included to spec as #{c.bright 'outside'}.

    Syntax:
      $ ddry t

  """
