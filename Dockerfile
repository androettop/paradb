# syntax=docker/dockerfile:1.7-labs
FROM node:lts-bookworm-slim

COPY --exclude=node_modules ./ /etc/paradb/paradb
WORKDIR /etc/paradb/paradb

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install postgresql-client ca-certificates -y
RUN yarn install
RUN yarn build

ENTRYPOINT ["tools/docker/start.sh"]
