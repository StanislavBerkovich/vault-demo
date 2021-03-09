module Vault
  class Base
    def initialize(token:, host:)
      @host = host
      @token = token
    end

    def headers
      { 'X-Vault-Token' => @token, 'Content-Type' => 'application/json' }
    end
  end
end
