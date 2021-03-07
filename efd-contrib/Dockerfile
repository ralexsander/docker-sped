FROM centos:7

MAINTAINER Ricardo Santana <rsantana@kenos.com.br>

RUN yum -y --setopt=protected_multilib=false install java-1.8.0-openjdk-devel which glibc.i686 libgcc.i686 \
	&& rm -rf /var/cache/yum
	
RUN rpm -i http://li.nux.ro/download/nux/dextop/el7/x86_64/webcore-fonts-3.0-1.noarch.rpm \
	&& mkdir -p /usr/lib/jvm/java-openjdk/lib/fonts \
	&& cp /usr/share/fonts/webcore/* /usr/lib/jvm/java-openjdk/lib/fonts/

RUN curl http://www.receita.fazenda.gov.br/publico/programas/SpedPisCofinsPVA/EFDContribuicoes_linux_x64-4.0.1.jar --output /PVA.jar

RUN adduser sped \
	&& echo -e "1\n/home/sped/ProgramasSPED/EFDContribuicoes\nO\n1\nN\nN\nN" | java -jar /PVA.jar \
	&& chown -R sped:sped /home/sped/ProgramasSPED \
	&& cd /home/sped/ProgramasSPED/EFDContribuicoes/ \
	&& tar zcf recursos.tgz recursos/

COPY docker-entrypoint.sh /home/sped/ProgramasSPED/EFDContribuicoes/

ENV JAVA_HOME /usr/lib/jvm/java-openjdk

ENV DISPLAY host.docker.internal:0

USER sped

WORKDIR /home/sped/ProgramasSPED/EFDContribuicoes/

CMD [ "bash", "docker-entrypoint.sh" ]
