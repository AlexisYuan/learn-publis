# 使用 Node.js 镜像作为构建环境
FROM node:latest AS build

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 yarn.lock（或 package-lock.json）
COPY package*.json ./

RUN npm config set registry http://registry.npm.taobao.org/

# 安装依赖
RUN npm install

# 复制项目文件
COPY . .

# 构建项目
RUN npm run build

# Nginx 服务不需要单独的 Dockerfile，因为它将使用官方镜像
