#!/bin/sh

. /tmp/loader

if [ "$SERVER_PORT" -eq "443" ]; then
	SCHEME="https://"
else
	SCHEME="http://"
fi
LOCATION="http://$SERVER_ADDR/cgi-bin/luci/freifunk/captive?ORIGIN=$( _sanitizer urlvalue $SCHEME )$HTTP_HOST$( _sanitizer urlvalue $REQUEST_URI )"

echo -en "Content-type: text/html\n"

cat <<EOF
Status: 511 Network Authentication Required
Connection: close
Cache-Control: no-cache, max-age=0, no-store, must-revalidate
Pragma: no-cache
Expires: 0
Content-Type: text/html
Location: $LOCATION

<html>
<head>
<title>511 Network Authentication Required</title>
<meta http-equiv="refresh" content="0; url=$LOCATION">
<META HTTP-EQUIV="cache-control" CONTENT="no-cache">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="expires" CONTENT="0">
</head>
<body style="background-color: black">
<p style="color: white; text-decoration: none">Bitte bestaetige die Nutzungsbedingungen vom <a style="color: white; text-decoration: none" href="$LOCATION">Weimarnetz</a> um die Verbindung zu nutzen.</p
<p style="color: white; text-decoration: none">Please agree to the terms of <a style="color: white; text-decoration: none" href="$LOCATION">Weimarnetz</a> in order to gain network access.</p>
</body>
</html>
EOF
