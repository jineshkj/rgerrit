
require 'yaml'
require 'httpclient'

module RGerrit
  def self.connect(base_uri, user, pass)
    Session.new(base_uri, user, pass)
  end
end

module RGerrit
  class Session
    attr_reader :base_uri
    
    def initialize(base_uri, user, pass)
      @base_uri = base_uri
      @http_client = HTTPClient.new
      @http_client.set_auth(base_uri, user, pass)
    end

    def add_cert_store(dir_name)
      ssl_config = @http_client.ssl_config
      ssl_config.add_trust_ca_to_store(ssl_config.cert_store, dir_name)
    end

    def fetch(suffix, args)
      uri = @base_uri + suffix
      resp = @http_client.get(uri, args, {'Accept' => 'application/json' })
      YAML.load(resp.body.sub(/^.*[^{]/,''))
    end
    
    def projects
      @projects ||= Projects.new(self)
    end
    
  end
end

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

  class Access < EndPoint
  end

  class Accounts < EndPoint
  end

  class Changes < EndPoint
  end

  class Config < EndPoint
  end

  class Groups < EndPoint
  end

  class Plugins < EndPoint
  end

  class Projects < EndPoint
    def initialize(session)
      super(session, '/projects')
    end
    
    def list
      projects = fetch( { 'd' => nil } )
    end
  end

  class Documentation < EndPoint
  end
  
end
