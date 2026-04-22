
FROM node:24 AS builder

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .
RUN yarn build

FROM cozy/cozy-app-dev:1.6.48

COPY --from=builder /app/build /data/cozy-app/drive

EXPOSE 8080
