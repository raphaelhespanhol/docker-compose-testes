#!/usr/bin/env bash
unset EXTERNAL_SOURCE_CODE
source /etc/environment

echo "Verifying the EXTERNAL_SOURCE_CODE variable in /etc/environment"
if [ ! -e "EXTERNAL_SOURCE_CODE" ]; then
  pwd >> /tmp/path.log
  sed -i 's/\/docker-compose-tests\/docker//g' /tmp/path.log
  printf "EXTERNAL_SOURCE_CODE=\"$(</tmp/path.log)\"\n" >> /etc/environment
  rm -rf /tmp/path.log
  echo ">> EXTERNAL_SOURCE_CODE generated with success in /etc/environment"
else
  echo ">> EXTERNAL_SOURCE_CODE variable already exists"
fi

source /etc/environment

echo "------------------------------------------------------------------------"
echo "BUILDING PROJECT AND IF IT SHOWS ERROR SEE EXTERNAL_SOURCE_CODE VARIABLE"
echo "------------------------------------------------------------------------"
(cd "${EXTERNAL_SOURCE_CODE}/spring-mock-tests"; mvn clean install -DskipTests)