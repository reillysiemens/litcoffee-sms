I'd include a [shebang][1], but the CoffeeScript creator [has other ideas][2],
so I'll just include our dependencies, [cson][3], [chalk][4] and `sms`.

[1]: http://en.wikipedia.org/wiki/Shebang_(Unix)
[2]: https://github.com/jashkenas/coffeescript/issues/2215
[3]: https://github.com/bevry/cson
[4]: https://github.com/sindresorhus/chalk

    CSON = require 'cson'
    chalk = require 'chalk'
    sms = require './lib/sms'

Check to make sure we have the necessary command line arguments.

    if process.argv[2]? and process.argv[3]?

If we do then create our `auth` and `recipients` objects using the CSON config.

      config = CSON.parseFileSync "#{__dirname}/config.cson"
      auth = config.auth
      recipients = config.recipients

Make a call to the `sms` function taking `subject` and `body` from the command
line parameters.

      sms auth, recipients, process.argv[2], process.argv[3..].join " "

If we don't have the necessary arguments then show a colorized usage message.

    else
      console.log chalk.red "usage: sms <subject> <body>"
