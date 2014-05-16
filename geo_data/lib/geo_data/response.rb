require 'json'
require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/hash/indifferent_access'

module GeoData
  class Response
    attr_accessor :response

    delegate :[], :[]=, to: :response

    def initialize(response_body)
      @response = JSON.parse(response_body).with_indifferent_access
    end

    def error?
      !@response[:error].nil?
    end
  end
end
