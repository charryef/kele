require 'httparty' #pulling the gem into our file so we can use it for our http request
require 'json' # Json is a Ruby module that we'll use to parse what's returned from the http request

class Kele
  include HTTParty #including the module of the gem so we can use the specific methods for the class
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
end
