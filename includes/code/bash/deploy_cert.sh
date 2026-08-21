#!/bin/bash

ROUTER_USER="Admin"
ROUTER_IP="asusrouter.internal"
CERT_DIR="/etc/letsencrypt/live/rac3r4life.myaddr.dev"

echo "Copying certificates to ASUS router..."

# 1. Copy the fullchain to cert.pem and private key to key.pem
scp "$CERT_DIR/fullchain.pem" "$ROUTER_USER@$ROUTER_IP:/jffs/.cert/cert.pem"  # (1)!
scp "$CERT_DIR/privkey.pem" "$ROUTER_USER@$ROUTER_IP:/jffs/.cert/key.pem"

echo "Restarting router web server to apply changes..."

# 2. Restart the web server daemon on the router
ssh "$ROUTER_USER@$ROUTER_IP" "service restart_httpd"

echo "Deployment complete!"