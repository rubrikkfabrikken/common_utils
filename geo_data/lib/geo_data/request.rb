module GeoData
  class Request
    def initialize(request_name, params = {})
      @request_name = request_name
      @params = params
    end

    def params(params)
      @params = params
    end

    def perform
      params_with_token = @params.merge(
          token: GeoData.secret_token,
          f: :json
      )

      uri       = URI("#{GeoData.request_url}/#{@request_name}")
      uri.query = URI.encode_www_form(params_with_token)

      Response.new(Net::HTTP.get_response(uri).body)
    end
  end
end
