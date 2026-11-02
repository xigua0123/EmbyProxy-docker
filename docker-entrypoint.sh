#!/bin/sh
set -e
CFG=/etc/emby-relay/config.json
mkdir -p /etc/emby-relay

if [ ! -s "$CFG" ] || ! grep -q '"secret"' "$CFG" 2>/dev/null; then
  BOOT_SECRET="$(head -c 32 /dev/urandom | od -An -tx1 | tr -d ' \n' | cut -c1-32)"
  cat > "$CFG" <<EOF
{"port": 2087, "secret": "$BOOT_SECRET", "verify_upstream_tls": true, "monthly_limit_bytes": 9895604649984, "per_ip_daily_limit_bytes": 32212254720, "per_ip_max_conns": 8, "allow_cf_ips_only": true}
EOF
  chmod 600 "$CFG"
  echo "================================================"
  echo "  首次启动，引导密钥（Boot Secret）："
  echo "  $BOOT_SECRET"
  echo "================================================"
fi

exec /app/emby-relay
