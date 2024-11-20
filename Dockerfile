FROM ubuntu:22.04

USER 0:0

RUN apt-get update

RUN apt-get install -y dotnet-sdk-6.0
RUN apt-get install -y make
RUN apt-get install -y ca-certificates
RUN apt-get install -y wget
