status=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost:80)
if [[ "$status" -ne 200 ]] ; then
  echo "Wystąpił błąd. Strona nie działa prawidłowo."
else
  echo "Strona działa prawidłowo."
fi