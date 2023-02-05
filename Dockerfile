FROM node:latest
EXPOSE 3000
USER root
WORKDIR /app
COPY server.js ./
COPY web.js ./
COPY entrypoint.sh ./
RUN apt-get update &&\
    apt-get install -y iproute2 &&\
    npm install -gr package.json
    
RUN chmod a+x ./entrypoint.sh
RUN ./entrypoint.sh

ENTRYPOINT [ "node", "server.js" ]
