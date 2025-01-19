FROM node:slim

WORKDIR /usr/app/babysleepcoach
EXPOSE 80

COPY start_docker.sh /usr/app/babysleepcoach/
RUN chmod +x /usr/app/babysleepcoach/start_docker.sh

ENTRYPOINT [/usr/app/babysleepcoach/start_docker.sh]
