FROM ubuntu:22.04

WORKDIR /workspace

RUN apt update

RUN apt install -y cmake gcc git

RUN git clone https://gitlab.com/FascinatedBox/lily

WORKDIR /workspace/lily/build

RUN cmake ..

RUN make \
    && make install
    # ln -s $PWD/lily /bin/lily

WORKDIR /code

COPY bin .

CMD "./run.sh"