
require 'yaml'
require 'httpclient'

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
      uri = @base_uri + '/a' + suffix
      resp = @http_client.get(uri, args, {'Accept' => 'application/json' })
      YAML.load(resp.body.sub(/^.*[^{]/,''))
    end
    
    def projects
      @projects ||= Projects.new(self)
    end
    
  end
end
