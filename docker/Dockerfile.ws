FROM oven/bun:1

WORKDIR /usr/src/app

COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json

COPY ./ws/backend ./ws/backend
COPY ./package-lock.json ./package-lock.json

COPY ./bun.lock ./bun.lock

RUN bun install
RUN bunx run db:generate

EXPOSE 8081

CMD ["bun", "run","start:ws"]