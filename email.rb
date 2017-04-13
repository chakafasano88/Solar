require 'sendgrid-ruby'
include SendGrid

from = Email.new(email: params[:from])
subject = 'Hello World from the SendGrid Ruby Library!'
to = Email.new(email: 'matt.fasano88@gmail.com')
content = Content.new(type: 'text/plain', value: 'Hello, Email!')
mail = Mail.new(from, subject, to, content)
sg = SendGrid::API.new(api_key: "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")
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers
