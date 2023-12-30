FROM ubuntu:23.04
RUN apt update && apt install openjdk-8-jdk wget xvfb -y
ENV TZ="Europe/Budapest"
ENV DISPLAY=:42

RUN wget https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvany_apeh/keretprogramok/AbevJava -O /opt/abevjava.jar
RUN java -jar /opt/abevjava.jar -s

RUN wget https://nav.gov.hu/pfile/programFile?path=/nyomtatvanyok/letoltesek/nyomtatvanykitolto_programok/nyomtatvanykitolto_programok_nav/23T1042E/nav_23t1042e -O /opt/nav_23t1042e.jar
RUN java -jar /opt/nav_23t1042e.jar -s

CMD ["/bin/bash"]
