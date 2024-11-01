# 第一阶段：构建
FROM node:latest AS build

# 设置工作目录
WORKDIR /app

COPY package*.json ./

RUN yarn install

COPY . .

RUN yarn run build

FROM nginx:latest

COPY --from=build /app/dist /usr/share/nginx/html


