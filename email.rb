
require 'sendgrid-ruby'
include SendGrid

from = Email.new(email: 'joewillgooo@gmail.com')
to = Email.new(email: 'joewillgooo@gmail.com')
subject = 'Signup/Comment/Question/Concern'
content = Content.new(type: 'text/plain', value: @subject)
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
