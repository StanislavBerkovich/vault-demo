require './vault'

token = ENV['VAULT_TOKEN']

begin
  puts '############### KV #########################'
  secrets = Vault::KV.new(host: 'https://vlt-staging.s7s.ai', mount: 'platform-kv', token: token)
  puts secrets.get('jackpots/test')
  puts secrets.set('jackpots/test', { value: "bar1" })
  puts
  puts

  puts '############### TRANSIT #####################'
  transit_options = { host: 'https://vlt-staging.s7s.ai', mount: 'platform-transit', token: token }
  plain_text = 'Stas is cool developer!'

  transit = Vault::Transit.new(**transit_options.merge(key: 'general'))
  puts transit.key_info
  chipher_text = transit.encrypt(plain_text)
  chipher_text2 = transit.encrypt(plain_text)
  puts chipher_text
  puts chipher_text2
  puts chipher_text2 == chipher_text

  encrypted_text = transit.decrypt(chipher_text)
  puts encrypted_text
  puts encrypted_text == plain_text

  puts
  puts 'advanced key'
  transit = Vault::Transit.new(**transit_options.merge(key: 'advanced'))
  puts transit.key_info
  chipher_text = transit.encrypt(plain_text, context: 'user')
  chipher_text2 = transit.encrypt(plain_text, context: 'user')
  chipher_text3 = transit.encrypt(plain_text, context: 'other-user')
  puts chipher_text
  puts chipher_text2
  puts chipher_text3
  puts [chipher_text == chipher_text2, chipher_text2 == chipher_text3]

  encrypted_text = transit.decrypt(chipher_text, context: 'user')
  puts encrypted_text
  puts encrypted_text == plain_text

  encrypted_text = transit.decrypt(chipher_text3, context: 'other-user')
  puts encrypted_text
  puts encrypted_text == plain_text

  # #decrypt with invalid context raise exception
  begin
    transit.decrypt(chipher_text3, context: 'user')
  rescue => e
    puts "Error: #{e.response.body}"
  end
rescue => e
  puts e.response.body
  raise e
end
