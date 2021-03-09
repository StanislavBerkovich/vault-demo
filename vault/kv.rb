require 'rest-client'
require 'json'
require_relative 'base'

module Vault
  class KV < Base
    def initialize(host:, token:, mount:)
      super(token: token, host: host)
      @mount = mount
    end

    def get(key)
      response = RestClient.get(url(key), headers)
      JSON.parse(response.body).dig('data','data')
    end

    def set(key, value)
      RestClient.post(url(key), { data: value }.to_json, headers)
    end

    private

    def url(key)
      "#{@host}/v1/#{@mount}/data/#{key}"
    end
  end
end


