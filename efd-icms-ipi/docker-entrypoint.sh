#!/usr/bin/env bash

set -Eeo pipefail

echo "Initializing SPED"

if [ "$(ls -A /home/sped/ProgramasSPED/Fiscal2/recursos)" ]; then
  echo "Tabelas carregadas"
else
  echo "Preparando tabelas"
  cd /home/sped/ProgramasSPED/Fiscal2/
  tar zxf recursos.tgz
fi

java -jar /home/sped/ProgramasSPED/Fiscal2/fiscalpva.jar
 
exec "$@"
