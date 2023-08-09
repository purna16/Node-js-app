FROM node

WORKDIR /app

COPY . /app

RUN npm install

EXPOSE 300

CMD ["node", "server.js"]
