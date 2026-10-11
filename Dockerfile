FROM node:20-bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip ffmpeg ca-certificates && rm -rf /var/lib/apt/lists/*
RUN pip3 install --break-system-packages --no-cache-dir yt-dlp
WORKDIR /app
COPY package.json ./
COPY server.js ./
COPY public ./public
ENV NODE_ENV=production
EXPOSE 10000
CMD ["npm","start"]
