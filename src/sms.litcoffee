I'd include a [shebang][1], but the CoffeeScript creator [has other ideas][2],
so I'll just require our dependencies, [chalk][3] and [nodemailer][4].

[1]: http://en.wikipedia.org/wiki/Shebang_(Unix)
[2]: https://github.com/jashkenas/coffeescript/issues/2215
[3]: https://github.com/sindresorhus/chalk
[4]: https://github.com/andris9/Nodemailer

    chalk = require 'chalk'
    nodemailer = require 'nodemailer'

Create a function, `sms`, that takes `auth`, `recipients`, `subject`, and
`text` as parameters.

    sms = (auth, recipients, subject, body) ->
      @auth = auth
      @recipients = recipients
      @subject = String subject
      @body = String body

Create a message object with the given parameters that we'll send after we've
authenticated.

      message =
        from: @auth.user
        to: @recipients
        subject: @subject
        text: @body

Create a new Nodemailer transport object for the Gmail service using `@auth`.

      transporter = nodemailer.createTransport {
        service: 'Gmail'
        auth: @auth
      }

Attempt to send the message and output the result.

      transporter.sendMail message, (error, info) ->
        status = if error? then chalk.red "#{error.message}"
        else chalk.green "Sent message(s). Got '#{info.response}' from server."
        console.log chalk.white "sms: #{status}"

Export our function so the module can be required by other things.

    module.exports = sms

Support something akin to Python's `if __name__ == '__main__':` jazz.

    if require.main is module

Check to make sure we have the necessary command line arguments.

      if process.argv[2]? and process.argv[3]?

If we do then create our `auth` and `recipients` objects.

        auth =
          user: 'cappuccino@gmail.com'
          pass: 'ristretto'

        recipients = [
          { name: "Caffè Latte", address: "caffe.latte@espresso.coffee" }
        ]

Make a call to the `sms` function taking `subject` and `body` from the command
line parameters.

        sms auth, recipients, process.argv[2], process.argv[3..].join " "

If we don't have the necessary arguments then show a colorized usage message.

      else
        console.log chalk.red "usage: sms <subject> <body>"
