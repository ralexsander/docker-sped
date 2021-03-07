#!/usr/bin/env bash

set -Eeo pipefail

echo "Initializing SPED"

if [ "$(ls -A /home/sped/ProgramasSPED/EFDContribuicoes/recursos)" ]; then
  echo "Tabelas carregadas"
else
  echo "Preparando tabelas"
  cd /home/sped/ProgramasSPED/EFDContribuicoes/
  tar zxf recursos.tgz
fi

java -jar /home/sped/ProgramasSPED/EFDContribuicoes/efdcontribuicoes.jar
 
exec "$@"
