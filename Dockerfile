FROM node:6

RUN apt-get update
RUN apt-get install --yes python2.7 git-all pkg-config libncurses5-dev libssl-dev libnss3-dev libexpat-dev libc6

WORKDIR /usr/src/app

COPY package.json /usr/src/app/package.json

RUN npm install
RUN npm install wrtc

COPY . /usr/src/app

ENV IPFS_WRTC_LINUX_WINDOWS=1
ENV IPFS_BOOTSTRAP=1

CMD ./init-and-daemon.sh