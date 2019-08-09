export access_token=$(\
    curl -X POST http://keycloak.lab.software.altkom.pl/auth/realms/lab/protocol/openid-connect/token \
    -H 'content-type: application/x-www-form-urlencoded' \
    -d 'username=bob&password=secret&grant_type=password&client_id=admin-cli' | jq --raw-output '.access_token' \
)

echo $access_token

curl -v -X GET \
  http://localhost:3000/service/secured \
  -H "Authorization: Bearer "$access_token
