FROM ubuntu:23.04
RUN apt update && apt install openjdk-8-jdk wget xvfb -y
ENV TZ="Europe/Budapest"
ENV DISPLAY=:42
ENV ABEV_JAVA_VERSION=3.33.0

RUN wget https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvany_apeh/keretprogramok/AbevJava -O /opt/abevjava.jar
RUN java -jar /opt/abevjava.jar -s

RUN wget https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/24t1042e/nav_24t1042e -O /opt/nav_24t1042e.jar
RUN java -jar /opt/nav_24t1042e.jar -s

CMD ["/bin/bash"]
