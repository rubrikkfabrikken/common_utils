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
      Response.new(Net::HTTP.get_response(build_request_url).body)
    end
  end
end
