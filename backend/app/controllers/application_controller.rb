class ApplicationController < ActionController::API
    # send email using sendgrid
    require 'sendgrid-ruby'
    include SendGrid
   
    def create
        message = JSON.parse(request.body.read)
        from_email = 'cty549868165@gmail.com'
        to_email = message['email']
        name_1 = message['name_1']
        name_2 = message['name_2']
        phone = message['phone']
        selectedDays = message['selectedDays']
        selectedTimes = message['selectedTimes']
        selectedCities = message['selectedCities']
        selectedInterests = message['selectedInterests']
        puts "to_email: #{to_email}"

        from = Email.new(email: from_email)
        to = Email.new(email: to_email)
        subject = 'こんにちは'
        content = Content.new(type: 'text/plain', value: name_1)
        mail = Mail.new(from, subject, to, content)

        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        
        puts response.status_code
        puts response.body
        puts response.headers

        head :ok
    end
end
