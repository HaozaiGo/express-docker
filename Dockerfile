

# 使用更轻量的 node18
FROM node:18-alpine

# 创建工作目录 /app
WORKDIR /app

# 把安装依赖所需的 package.json AND package-lock.json 复制到 /app
COPY package*.json ./
# 安装依赖
RUN npm install
# 如果是生产环境使用 ci
# RUN npm ci --omit=dev

# 打包源码到 /app
COPY . .

# 暴露端口 8080
EXPOSE 3000
# 启动容器后，执行 node server.js
CMD ["node", "server.js"]
