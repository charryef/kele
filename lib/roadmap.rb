module Roadmap

  #Retrieve roadmaps
  def get_roadmap(chain_id)
    response = self.class.get("/roadmaps/#{chain_id}", headers: { "authorization" => @auth_token})
    @roadmaps = JSON.parse(response.body)
  end

  #Retrieve checkpoints
  def get_checkpoint(checkpoint_id)
    response = self.class.get("/checkpoints/#{checkpoint_id}", headers: { "authorization" => @auth_token})
    @checkpoints = JSON.parse(response.body)
  end
end
