require "sinatra/cookies"

Envyable.load('./config/env.yml')


post "/messages" do
  content_type "text/xml"
  response = Twilio::TwiML::Response.new do |r|
    if cookies[:started]
      r.Message "Thanks! You can find all the code for the example at https://github.com/philnash/fullstackfest-twilio-ruby."
    else
      cookies[:started] = true
      r.Message "Welcome to BaRuCo! Here's a promo code for twilio.com #{ENV["PROMO_CODE"]}. Send another message to this number and you can see the code for how this works."
    end
  end
  response.to_xml
end
