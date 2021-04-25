#!/bin/sh
/usr/local/bin/xray -config /etc/xray/config.json
/usr/bin/caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
