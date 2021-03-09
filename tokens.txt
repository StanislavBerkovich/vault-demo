########## TOKENS

# ╰─ curl --tlsv1.3 -i  \                                                                                                                                                                                                                    ─╯
# -H "X-Vault-Token: TOKEN" \
#     -X POST -d '{ "increment": "1h"}' -H "Content-Type: application/json" \
#     https://vlt-staging.s7s.ai/v1/auth/token/renew-self
#
# HTTP/1.1 200 OK
# Cache-Control: no-store
# Content-Type: application/json
# Date: Mon, 08 Mar 2021 12:55:13 GMT
# Content-Length: 538
#
#
# curl --tlsv1.3 -i  \                                                                                                                                                                                                                    ─╯
# -H "X-Vault-Token: TOKEN" \
#     -X GET \
#     https://vlt-staging.s7s.ai/v1/auth/token/lookup-self
# HTTP/1.1 200 OK
# Cache-Control: no-store
# Content-Type: application/json
# Date: Mon, 08 Mar 2021 12:56:06 GMT
# Content-Length: 829







######### TRANSIT

#
# curl --tlsv1.3 -i  \                                                                                                                                                                                                                    ─╯
# -H "X-Vault-Token: TOKEN" \
#     -X GET \
#     https://vlt-staging.s7s.ai/v1/platform-transit/keys/general
# HTTP/1.1 200 OK
# Cache-Control: no-store
# Content-Type: application/json
# Date: Mon, 08 Mar 2021 13:04:39 GMT
# Content-Length: 518
#
# {"request_id":"2269c310-4af9-6ffd-c778-d3e81bc334ac","lease_id":"","renewable":false,"lease_duration":0,"data":{"allow_plaintext_backup":false,"deletion_allowed":false,"derived":false,"exportable":false,"keys":{"1":1614854211},"latest_version":1,"min_available_version":0,"min_decryption_version":1,"min_encryption_version":0,"name":"general","supports_decryption":true,"supports_derivation":true,"supports_encryption":true,"supports_signing":false,"type":"aes256-gcm96"},"wrap_info":null,"warnings":null,"auth":null}


# ─ curl --tlsv1.3 -i  \                                                                                                                                                                                                                    ─╯
# -H "X-Vault-Token: TOKEN" \
#     --request POST --data '{"plaintext": "dGhlIHF1aWNrIGJyb3duIGZveAo="}' \
#     https://vlt-staging.s7s.ai/v1/platform-transit/encrypt/general
# HTTP/1.1 200 OK
# Cache-Control: no-store
# Content-Type: application/json
# Date: Mon, 08 Mar 2021 13:07:22 GMT
# Content-Length: 264
#
# {"request_id":"3ebad28c-c13d-3f46-0254-b7fb64c376e5","lease_id":"","renewable":false,"lease_duration":0,"data":{"ciphertext":"vault:v1:AMNYj+yj59orne9OpgDbbkOIAckhiYJuJt3FWwlniVsubVyw6/T/hxnzid6aYQax","key_version":1},"wrap_info":null,"warnings":null,"auth":null}

# curl --tlsv1.3 -i  \                                                                                                                                                                                                                    ─╯
# -H "X-Vault-Token: TOKEN" \
#     --request POST --data '{"ciphertext": "vault:v1:AMNYj+yj59orne9OpgDbbkOIAckhiYJuJt3FWwlniVsubVyw6/T/hxnzid6aYQax"}' \
#     https://vlt-staging.s7s.ai/v1/platform-transit/decrypt/general
# HTTP/1.1 200 OK
# Cache-Control: no-store
# Content-Type: application/json
# Date: Mon, 08 Mar 2021 13:08:47 GMT
# Content-Length: 202
#
# {"request_id":"61a97a77-abc3-6427-129d-03747abdb51b","lease_id":"","renewable":false,"lease_duration":0,"data":{"plaintext":"dGhlIHF1aWNrIGJyb3duIGZveAo="},"wrap_info":null,"warnings":null,"auth":null}
