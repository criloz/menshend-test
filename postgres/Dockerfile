FROM postgres:latest
RUN apt-get update -y && apt-get install curl
RUN curl -L -O http://cl.ly/173L141n3402/download/example.dump
COPY populate.sh /docker-entrypoint-initdb.d/
