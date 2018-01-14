#!/bin/bash
POOL=(
        "HTTP"
        "HTTPS"
        "BILLING"
        "CRM"
        "API_2"
        "API_OAUTH2"
        "API_SLS"
        "API_WWW"
        "HEX_API"
        "MONGO"
        "OPEN_API_2"
        "OPEN_API_HAS"
        "OPEN_API_OAUTH"
        "OPEN_API_WWW"
        "SUBSCRIPTIONS"
        "UAP"
        "UNIPAY"
        "UNIVERSAL_CHANNEL"
)
echo "{"
echo "\"data\":["
for i in "${POOL[@]}"
do
 echo "{ \"{#POOLNAME}\":\"$i\"},"
done
echo "]"
echo "}"
