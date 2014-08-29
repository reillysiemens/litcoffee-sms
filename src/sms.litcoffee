Require our dependencies, [chalk][1] and [nodemailer][2].

[1]: https://github.com/sindresorhus/chalk
[2]: https://github.com/andris9/Nodemailer

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

