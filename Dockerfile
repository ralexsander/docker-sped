FROM centos:7

MAINTAINER Ricardo Santana <rsantana@kenos.com.br>

RUN yum -y --setopt=protected_multilib=false install java-1.8.0-openjdk-devel which glibc.i686 libgcc.i686 \
	&& rm -rf /var/cache/yum
	
RUN curl http://www.receita.fazenda.gov.br/publico/programas/Sped/SpedFiscal/PVA_EFD_linux-2.6.1_x64.jar --output /PVA.jar

RUN adduser sped \
	&& echo -e "1\n/home/sped/ProgramasSPED/Fiscal2\nO\n1\nN\nN\nN" | java -jar /PVA.jar \
	&& chown -R sped:sped /home/sped/ProgramasSPED \
	&& cd /home/sped/ProgramasSPED/Fiscal2/ \
	&& tar zcf recursos.tgz recursos/

COPY docker-entrypoint.sh /home/sped/ProgramasSPED/Fiscal2/

ENV JAVA_HOME /usr/lib/jvm/java-openjdk

ENV DISPLAY host.docker.internal:0

USER sped

WORKDIR /home/sped/ProgramasSPED/Fiscal2/

CMD [ "bash", "docker-entrypoint.sh" ]