ARG BASETAG=latest

FROM accetto/ubuntu-vnc-xfce-firefox-g3:${BASETAG}
USER 0
RUN \
	cp ${NO_VNC_HOME}/vnc.html ${NO_VNC_HOME}/index.html \
	&& apt-get update \
	&& apt-get install -y net-tools iputils-ping ssh ifupdown netcat snapd nmap \
    && useradd -u 1000 -g 0 -d /home/student -m -s /bin/bash student \
	&& echo "student:tn3duts" | chpasswd \
	&& adduser student sudo \
	&& useradd -u 1002 -d /home/tom -m -s /bin/bash tom \
    && echo "tom:tom" | chpasswd \
	&& chmod 777 /etc/init.d/networking

### COPY --chown=1000 ./student /home/student/
	
USER 1000

###	&& useradd -u 1000 -d /home/student -m -s /bin/bash student \
### && echo "student:tn3duts" | chpasswd \
###	&& adduser student sudo \
###	&& useradd -u 1002 -d /home/tom -m -s /bin/bash tom \
### && echo "tom:tom" | chpasswd