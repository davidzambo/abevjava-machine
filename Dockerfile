FROM ubuntu:23.04
RUN apt update && apt install openjdk-8-jdk wget xvfb -y
ENV TZ="Europe/Budapest"
ENV DISPLAY=:42
ENV ABEV_JAVA_VERSION=3.36.0

RUN wget https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvany_apeh/keretprogramok/AbevJava -O /opt/abevjava.jar
RUN java -jar /opt/abevjava.jar -s

RUN wget https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/25T1042E/nav_25t1042e -O /opt/nav_25T1042E.jar
RUN java -jar /opt/nav_25T1042E.jar -s

CMD ["/bin/bash"]
