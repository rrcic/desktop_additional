ARG BASETAG=latest

FROM accetto/ubuntu-vnc-xfce-firefox-g3:${BASETAG}
USER 0
RUN cp ${NO_VNC_HOME}/vnc.html ${NO_VNC_HOME}/index.html
USER ${VNC_USER}