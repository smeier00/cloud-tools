#!/bin/bash

# Create a cloud account and user

BASE_URL="https://cloud.sdsc.edu/auth/v2/"
#BASE_URL="https://duracloud.auth.cloud.sdsc.edu/auth/v2/"
ADMIN_USER='.super_admin'
ADMIN_PW="${SUPER_ADMIN_PW}"
ACCOUNT=$1
USER=$2


echo ""
echo "----"
echo "Listing cloud accounts... "
echo ""

/usr/bin/curl --insecure -D - "${BASE_URL}" -H "X-Auth-Admin-User: ${ADMIN_USER}" -H "X-Auth-Admin-Key: ${ADMIN_PW}"


if [ "${ACCOUNT}" ]; then
    echo ""
    echo "----"
    echo "Listing details for ${ACCOUNT}..."
    echo ""

    /usr/bin/curl --insecure -D - "${BASE_URL}${ACCOUNT}" -H "X-Auth-Admin-User: ${ADMIN_USER}" -H "X-Auth-Admin-Key: ${ADMIN_PW}"
fi

if [ "${USER}" ]; then
    echo ""
    echo "----"
    echo "Listing details for ${ACCOUNT}:${USER}..."
    echo ""

    /usr/bin/curl --insecure -D - "${BASE_URL}${ACCOUNT}/${USER}" -H "X-Auth-Admin-User: ${ADMIN_USER}" -H "X-Auth-Admin-Key: ${ADMIN_PW}"
fi
echo ""

