FROM node:18.15.0

ARG HOMEDIR="app"

ENV HOME=/$HOMEDIR \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0

WORKDIR $HOMEDIR

COPY . .

RUN yarn install
