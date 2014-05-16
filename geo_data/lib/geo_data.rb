require 'net/http'
require 'active_support/configurable'
require 'active_support/core_ext/hash/conversions'

require_relative 'geo_data/request'
require_relative 'geo_data/response'

module GeoData
  include ActiveSupport::Configurable

  config_accessor :username,     &-> { ENV['GEODATA_USERNAME']     }
  config_accessor :password,     &-> { ENV['GEODATA_PASSWORD']     }
  config_accessor :request_url, &-> { ENV['GEODATA_REQUEST_URLl'] }
  config_accessor :token_url,   &-> { ENV['GEODATA_TOKEN_URL']   }

  class << self
    def secret_token
      @secret_token ||= generate_secret_token
    end

    def generate_secret_token
      uri       = URI(token_url)
      uri.query = URI.encode_www_form(username: username, password: password)

      Net::HTTP.get_response(uri).body
    end
  end
end
