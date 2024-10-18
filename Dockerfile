# 第一阶段：构建
FROM node:latest AS builder

# 设置工作目录
WORKDIR /app


# 复制项目所有文件
COPY . .

RUN npm config set registry http://registry.npm.taobao.org/

RUN npm install pnpm -g

# 安装依赖
RUN pnpm install


# 构建项目
RUN pnpm run build

# 第二阶段：部署
FROM nginx:alpine

# 时区
ENV TZ=Asia/Shanghai

# 复制自定义的 Nginx 配置文件
COPY nginx.conf /etc/nginx/conf.d/default.conf

# `builder` 阶段中复制构建好的文件到 Nginx 容器的网页根目录 `/usr/share/nginx/html`
COPY --from=builder /app/dist /usr/share/nginx/html

# # 暴露 Nginx 默认端口
# EXPOSE 80

# # 启动 Nginx
# CMD ["nginx", "-g", "daemon off;"]
