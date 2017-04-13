require "sinatra"
require 'sendgrid-ruby'
include SendGrid

# Home Page
get '/' do

  erb :home
end

# About Page
get "/about" do
  "Profile stuff"
    erb :about
end

# Photos page
get "/photos" do
  "Photos Gallery"
    erb :photos
end
# Contact Page
get "/contact" do
  "Contact info"
    erb :contact
end

post "/response" do

  from = Email.new(email: params[:from])
  subject = params[:subject]
  to = Email.new(email: 'matt.fasano88@gmail.com')
  content = Content.new(type: 'text/plain', value: 'Hello, Email!')

  mail = Mail.new(from, subject, to, content)
  sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
  response = sg.client.mail._('send').post(request_body: mail.to_json)

  puts response.status_code
  puts response.body
  puts response.headers

  redirect "/contact"

end
