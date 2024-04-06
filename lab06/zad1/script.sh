#!/bin/bash

docker network create --driver bridge --subnet 192.168.1.0/24 --gateway 192.168.1.1 my_bridge

docker run -d --name test_bridge --network my_bridge alpine # sleep infinity <- aby kontener był cały czas uruchomiony, wtedy ping działa poprawnie

docker network inspect my_bridge

docker exec -it test_bridge ping -c 3 192.168.1.2

docker network rm my_bridge 