require 'httparty' #pulling the gem into our file so we can use it for our http request
require 'json' # Json is a Ruby module that we'll use to parse what's returned from the http request
require './lib/roadmap'

class Kele
  include HTTParty #including the module of the gem so we can use the specific methods for the class
  include Roadmap
  base_uri 'https://www.bloc.io/api/v1' #built in attribute of httparty

  def initialize(email, password)
    client = self.class.post("/sessions", { query: { email: email, password: password } })
    if client['auth_token'].nil?
      raise "Invalid email or password"
    else
      @auth_token = client["auth_token"]
    end
  end

  #Retrieve current user's data
  def get_me
    #Pass the auth_token via HTTParty's headers option:
    response = self.class.get("/users/me", headers: { "authorization" => @auth_token })
    @user = JSON.parse(response.body)
  end

  #Retrieve a list of my mentor's available time slots
  def get_mentor_availability(mentor_id)
    response = self.class.get("/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })
    @mentor_availability = JSON.parse(response.body)
  end

  #Retrieve current user's message thread(s)
  def get_messages(page_num = nil)
    if page_num == nil
      response = self.class.get("/message_threads", headers: { "authorization" => @auth_token })
    else
      response = self.class.get("/message_threads?page=#{page_num}", headers: { "authorization" => @auth_token })
    end
    @messages = JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, token, subject, stripped_text)
    response = self.class.post("/messages", headers: { "authorization" => @auth_token,
      body: {
        "sender": sender_email,
        "recipient_id": recipient_id,
        "token": token,
        "subject": subject,
        "stripped_text": stripped-text
      }
    })
    response.success? puts "message sent!"
  end

end
