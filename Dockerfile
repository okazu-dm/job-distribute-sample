FROM ubuntu:latest

RUN mkdir /workspace
WORKDIR /workspace

ADD . /workspace

CMD ["./runner.sh"]

