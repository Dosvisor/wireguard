#!/bin/bash
IP_TO_PING="10.200.0.1"

check_ping() {
  ping -c 3 "$IP_TO_PING" > /dev/null 2>&1
  return $?
}

if check_ping; then
    echo "Ping to $IP_TO_PING successful from wireguard container."
  else
    echo "Ping to $IP_TO_PING failed. Starting WireGuard service for wireguard."
fi