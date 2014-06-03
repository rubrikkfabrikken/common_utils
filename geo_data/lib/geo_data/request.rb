module GeoData
  class Request
    def initialize(request_name, params = {})
      @request_name = request_name
      @params = params
    end

    def params(params)
      @params = params
    end

    def build_request_url
      params_with_token = @params.merge(
          token: GeoData.secret_token,
          f: :json
      )

      URI("#{GeoData.request_url}/#{@request_name}").tap do |uri|
        uri.query = URI.encode_www_form(params_with_token)
      end
    end

    def perform
      request_url = build_request_url

      GeoData.log "Performing a GET request to #{request_url}"

      raw_response = Net::HTTP.get_response(request_url).body

      GeoData.log "Receieved the following response from GeoData: #{raw_response}"

      Response.new(raw_response)
    end
  end
end
