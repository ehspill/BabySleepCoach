FROM node:slim

WORKDIR /usr/app/babysleepcoach
EXPOSE 80

#COPY .start_docker.sh /usr/app/babysleepcoach/
COPY . .
WORKDIR /usr/app/babysleepcoach
RUN chmod +x /usr/app/babysleepcoach/start_docker.sh
RUN ls -l /usr/app/babysleepcoach

#ENTRYPOINT ["bash", "start_docker.sh"]
ENTRYPOINT ["/bin/bash"] 
#CMD ["/usr/app/babysleepcoach/start_docker.sh"]
CMD ["-c", "while :; do sleep 10; done"]

#ENTRYPOINT ["/bin/bash"] 
#CMD ["/usr/app/babysleepcoach/start_docker.sh"]
