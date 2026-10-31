#!/bin/sh
# shellcheck disable=SC2155

portfwd() {
  local local_address="$1"
  local remote_address="$2"
  local local_ip="${local_address%:*}"
  local local_port="${local_address##*:}"
  local remote_ip="${remote_address%:*}"
  local remote_port="${remote_address##*:}"

  iptables -t nat -A PREROUTING -p tcp --dport "$local_port" -j DNAT --to-destination "$remote_address" \
    -m comment --comment "[portfwd] $local_address -> $remote_address"
  iptables -t nat -A POSTROUTING -p tcp -d "$remote_ip" --dport "$remote_port" -j SNAT --to-source "$local_ip" \
    -m comment --comment "[portfwd] $local_address -> $remote_address"
  iptables -t nat -A PREROUTING -p udp --dport "$local_port" -j DNAT --to-destination "$remote_address" \
    -m comment --comment "[portfwd] $local_address -> $remote_address"
  iptables -t nat -A POSTROUTING -p udp -d "$remote_ip" --dport "$remote_port" -j SNAT --to-source "$local_ip" \
    -m comment --comment "[portfwd] $local_address -> $remote_address"
}

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <local_ip:local_port> <remote_ip:remote_port>"
  exit 1
fi

sysctl -w net.ipv4.ip_forward=1 >/dev/null 2>&1
iptables -P FORWARD ACCEPT
portfwd "$@"
