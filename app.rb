require "sinatra"
require 'sendgrid-ruby'
include SendGrid

get "/home" do
    erb :homepage_layout
end


get "/aboutus" do
    erb :aboutus_layout
end


get "/ourdrivers" do
    erb :ourdrivers_layout
end


get "/contactus" do
    erb :contactus_layout
end

get "/contact-form" do
    erb :contactus_form
end

post "/contact-form" do
    puts params.inspect
    @message = params[:message]

    from = Email.new(email: 'joewillgooo@gmail.com')
    to = Email.new(email: 'joewillgooo@gmail.com')
    subject = 'sinatra post test'
    content = Content.new(type: 'text/plain', value: 'this is a test, this is only a test.')
    mail = Mail.new(from, subject, to, content)
    
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
end

