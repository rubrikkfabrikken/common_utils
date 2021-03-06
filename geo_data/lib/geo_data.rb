require 'net/http'

require_relative 'geo_data/request'
require_relative 'geo_data/response'

module GeoData
  class << self
    attr_writer :username, :password, :request_url, :token_url, :logger

    def username; @username || ENV['GEODATA_USERNAME'] end
    def password; @password || ENV['GEODATA_PASSWORD'] end
    def request_url; @request_url || ENV['GEODATA_REQUEST_URL'] end
    def token_url; @token_url || ENV['GEODATA_TOKEN_URL'] end

    def log(content)
      @logger.info(content) if @logger
    end

    def secret_token
      @secret_token ||= generate_secret_token
    end

    def generate_secret_token
      uri       = URI(token_url)
      uri.query = URI.encode_www_form(username: username, password: password)

      log "Acquiring secret token by GETing #{uri}"

      Net::HTTP.get_response(uri).body
    end
  end
end
