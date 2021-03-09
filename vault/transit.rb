require 'rest-client'
require 'json'
require 'base64'

module Vault
  class Transit
    def initialize(host:, token:, mount:, key:)
      @host = host
      @token = token
      @mount = mount
      @key = key
    end

    def encrypt(plain_text)
      headers = { 'X-Vault-Token' => @token }
      puts Base64.encode64(plain_text)
      base64_text = Base64.encode64(plain_text)
      response = RestClient.post(url('encrypt'), { plaintext: base64_text }.to_json, headers)

      JSON.parse(response.body).dig('data','ciphertext')
    end

    def decrypt(cipher_text)
      headers = { 'X-Vault-Token' => @token }
      response = RestClient.post(url('decrypt'), { ciphertext: cipher_text }.to_json, headers)
      base64_text = JSON.parse(response.body).dig('data','plaintext')
      Base64.decode64(base64_text)
    end

    private

    def url(command)
      "#{@host}/v1/#{@mount}/#{command}/#{@key}"
    end
  end
end
