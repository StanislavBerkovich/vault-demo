require './kv'

token = ''
secrets = Vault::KV.new(host: 'https://vlt-staging.s7s.ai', mount: 'platform-kv', token: token)
puts secrets.get('jackpots/test')
puts secrets.set('jackpots/test', { value: "bar1" })
