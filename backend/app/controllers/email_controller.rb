

class EmailController < ApplicationController
    # send email using sendgrid
    require 'sendgrid-ruby'
    include SendGrid
   
    def create
        to_email = JSON.parse(request.body.read)['email']
        from_email = 'cty549868165@gmail.com' # not safe, could be put in config file '.env'
        puts "to_email: #{to_email}"

        from = Email.new(email: from_email)
        to = Email.new(email: to_email)
        subject = 'Sending with SendGrid is Fun'
        content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        
        puts response.status_code
        puts response.body
        puts response.headers

        head :ok
    end
end