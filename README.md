```bash
#install docker-compose ubuntu

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

```bash

#Place the configuration file with the name wg0.conf into the local configuration directory 'config/<moscow||riazan||piter>/wg0.conf.

[Interface]
PrivateKey = 
Address = 
PostUp = 
[Peer]
PublicKey = 
AllowedIPs = 
Endpoint = 
PersistentKeepalive = 


#In the 'docker-compose' file, make sure to leave the necessary services for your use.

#Also, pay attention to the volume paths in the 'docker-compose.yaml' file.

```

```bash
#build and run container 
docker-compose up -d

```

```bash
# Crontab script for checking access to the WireGuard gateway on the other side  


#!/bin/bash
IP_TO_PING="10.200.0.1"

check_ping() {
  docker exec "wireguard_$1" ping -c 3 "$IP_TO_PING" > /dev/null 2>&1
  return $?
}

# Проверка и перезапуск контейнеров
for container in "m" "r"; do
  if check_ping "$container"; then
    echo "Ping to $IP_TO_PING successful from wireguard_$container container."
  else
    echo "Ping to $IP_TO_PING failed. Starting WireGuard service for wireguard_$container."
    docker-compose restart "wireguard_$container"
  fi
done
```