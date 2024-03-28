#!/bin/bash

# pierwszy sposób - wymaga Dockerfile

CONFIG_FILE=default.conf
PORT=8888

docker build . -t stepik3-zad2 --build-arg CONFIG_FILE=$CONFIG_FILE

docker run --name zad2-stepik3 -p $PORT:80 -d stepik3-zad2


# # Albo inny sposób:

# CONFIG_FILE="default.conf"
# PORT=80

# # uruchamiamy skrypt za pomocą:
# # ./script.sh
# # ./script.dh -c test.conf -p 666
# # ./script.dh -c test.conf
# # ./script.dh -p 666
# while getopts ":c:p:" opt; do
#     case ${opt} in
#         c)
#             CONFIG_FILE=$OPTARG
#             ;;
#         p)
#             PORT=$OPTARG
#             ;;
#         \?)
#             echo "Błędna opcja: $OPTARG" 1>&2
#             print_help
#             ;;
#         :)
#             echo "Opcja -$OPTARG wymaga argumentu" 1>&2
#             print_help
#             ;;
#     esac
# done
# shift $((OPTIND -1))

# docker run -d -p $PORT:80 \
#     -v $(pwd)/$CONFIG_FILE:/etc/conf.d/default.conf \
#     --name zad2-stepik3 \
#     nginx

echo "Kontener Docker z serwerem Nginx został utworzony."
echo "Nginx nasłuchuje na porcie $PORT."