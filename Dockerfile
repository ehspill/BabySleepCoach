FROM node:slim

WORKDIR /usr/app/babysleepcoach
EXPOSE 80

#Copy the pip build files in first
#COPY ./mediapipe-0.10.3-cp311-cp311-manylinux_2_17_aarch64.manylinux2014_aarch64.whl .
COPY ./requirements.txt .

# Install required packages
ENV PIP_BREAK_SYSTEM_PACKAGES 1
RUN apt-get update && apt-get install python3-pip libgl1 libglib2.0-0  -y
RUN pip3 install --upgrade pip
#RUN pip3 install ./mediapipe-0.10.3-cp311-cp311-manylinux_2_17_aarch64.manylinux2014_aarch64.whl
RUN pip3 install -r requirements.txt

# Copy in the rest of the files
COPY . .

RUN cd webapp && yarn install && cd ..

WORKDIR /usr/app/babysleepcoach
RUN chmod +x /usr/app/babysleepcoach/start_docker.sh
RUN ls -l /usr/app/babysleepcoach

ENTRYPOINT ["bash", "start_docker.sh"]
#ENTRYPOINT ["/usr/app/babysleepcoach/start_docker.sh"]
