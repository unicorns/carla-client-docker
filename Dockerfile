FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python3-pip libpng16-dev libtiff5-dev libjpeg-dev

# dependency for pygame GUI
RUN apt-get install -y libgtk-3-0

RUN pip3 install pygame numpy networkx

WORKDIR /usr/src/PythonAPI
COPY PythonAPI .
RUN pip3 install -e ./carla/dist/carla-0.9.8-py3.5-linux-x86_64/

# Replace 1000 with your user / group id
# RUN export uid=1000 gid=1000 && \
#     mkdir -p /home/developer && \
#     echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#     echo "developer:x:${uid}:" >> /etc/group && \
#     echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#     chmod 0440 /etc/sudoers.d/developer && \
#     chown ${uid}:${gid} -R /home/developer
# 
# USER developer
# ENV HOME /home/developer
CMD ["/bin/bash"]
