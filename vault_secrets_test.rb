require './vault'

token = ENV['VAULT_TOKEN']

puts '############### KV #########################'
secrets = Vault::KV.new(host: 'https://vlt-staging.s7s.ai', mount: 'platform-kv', token: token)
puts secrets.get('jackpots/test')
puts secrets.set('jackpots/test', { value: "bar1" })
puts
puts

puts '############### TRANSIT #####################'
transit = Vault::Transit.new(host: 'https://vlt-staging.s7s.ai', mount: 'platform-transit', key: 'general', token: token)
plain_text = 'Stas is cool developer!'
chipher_text = transit.encrypt(plain_text)
puts chipher_text
encrypted_text = transit.decrypt(chipher_text)
puts encrypted_text
puts encrypted_text == plain_text
