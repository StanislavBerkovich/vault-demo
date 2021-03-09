require 'rest-client'
require 'json'
require 'base64'
require_relative 'base'

module Vault
  class Transit < Base
    def initialize(host:, token:, mount:, key:)
      super(token: token, host: host)
      @mount = mount
      @key = key
    end

    def key_info
      RestClient.get(url('keys'), headers)
    end

    def encrypt(plain_text, context: '')
      headers = { 'X-Vault-Token' => @token }
      base64_text = Base64.encode64(plain_text)
      base64_context = Base64.encode64(context)
      response = RestClient.post(url('encrypt'), { plaintext: base64_text, context: base64_context }.to_json, headers)

      JSON.parse(response.body).dig('data','ciphertext')
    end

    def decrypt(cipher_text, context: '')
      headers = { 'X-Vault-Token' => @token }
      base64_context = Base64.encode64(context)
      response = RestClient.post(url('decrypt'), { ciphertext: cipher_text, context: base64_context }.to_json, headers)
      base64_text = JSON.parse(response.body).dig('data','plaintext')
      Base64.decode64(base64_text)
    end

    private

    def url(command)
      "#{@host}/v1/#{@mount}/#{command}/#{@key}"
    end
  end
end
