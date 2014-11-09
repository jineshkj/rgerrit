
module RGerrit
  class EndPoint
    def initialize(session, uri_suffix)
      @session = session
      @suffix  = uri_suffix
    end

    def fetch(args)
      @session.fetch(@suffix, args)
    end
  end
end

require_relative 'endpoint/projects'
