!#/bin/sh

. /tmp/loader

if [ $SERVER_PORT -eq "443" ]; then
	SCHEME="https://"
else
	SCHEME="http://"
fi

echo -en "Cache-Control: no-cache, max-age=0, no-store, must-revalidate\r\n"
echo -en "Pragma: no-cache\r\n"
echo -en "Expires: -1\r\n"
echo -en "Status: 307 Temporary Redirect\r\n"
echo -en "Location: http://$SERVER_ADDR/cgi-bin/luci/freifunk/captive?ORIGIN=$( _sanitizer urlvalue $SCHEME )$HTTP_HOST$( _sanitizer urlvalue $REQUEST_URI )\r\n"
echo -en "\r\n"

cat weimar-splash-index.html

