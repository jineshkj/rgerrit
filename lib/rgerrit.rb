
require_relative 'rgerrit/session'
require_relative 'rgerrit/endpoint'

module RGerrit
  def self.connect(base_uri, user, pass)
    Session.new(base_uri, user, pass)
  end
end
