# Validor de arquivos fiscais do SPED

> Essa adaptação para docker permite que os validadores do SPED rodem em qualquer SO, incluindo Mac OS X.

## Preparação

> Para funcionar no Mac é necessário instalar o XQuartz e habilitar conexões via rede:

- XQuartz -> Preferences -> Security
- Enable: Allow metwork connections

> Em seguida é necessário configurar o acesso ao display X:

**Mac OS X**:

```shell=
xhost + 127.0.0.1
```

**Linux (Testado no Ubuntu 18.04)**:

```shell=
xhost +local:docker
```

## Como executar

**Mac OS X**:

```shell=
docker run \
--rm \
ralexsander/sped:efd
```

**Linux (Testado no Ubuntu 18.04)**:

```shell=
docker run \
--rm \
--volume /tmp/.X11-unix:/tmp/.X11-unix \
--env DISPLAY=${DISPLAY} \
ralexsander/sped:efd
```

> É recomendável manter um volume com os dados das tabelas do SPED, desta forma não é necessário atualizá-las  a cada execução.
Para facilitar é possível executar via docker-compose:

```shell=
curl https://raw.githubusercontent.com/ralexsander/docker-sped/master/docker-compose.yml -o /tmp/docker-compose.yml
docker-compose -f /tmp/docker-compose.yml up && docker-compose -f /tmp/docker-compose.yml down
```

## Links

- [Docker Hub](https://hub.docker.com/r/ralexsander/sped/)
- [Git Hub](https://github.com/ralexsander/docker-sped/)
- [SPED](http://sped.rfb.gov.br/)
