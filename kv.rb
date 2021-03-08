require 'rest-client'
require 'json'

module Vault
  class KV
    def initialize(host:, token:, mount:)
      @host = host
      @token = token
      @mount = mount
    end

    def get(key)
      headers = { 'X-Vault-Token' => @token }
      response = RestClient.get(url(key), headers)
      JSON.parse(response.body).dig('data','data')
    end

    def set(key, value)
      headers = { 'X-Vault-Token' => @token, 'Content-Type' => 'application/json' }
      RestClient.post(url(key), { data: value }.to_json, headers)
    end

    private

    def url(key)
      "#{@host}/v1/#{@mount}/data/#{key}"
    end
  end
end


