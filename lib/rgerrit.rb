
require 'httparty'

class RGerrit
  include HTTParty

  def initialize(uri, user, pass)
    self.class.base_uri(uri)
    self.class.basic_auth(user, pass)
  end

  def projects
    JSON.parse(self.class.get("/projects/?d").body[5..-1])
  end

end
