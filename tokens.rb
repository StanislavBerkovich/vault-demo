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
