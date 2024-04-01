FROM node:20

COPY package.json .
COPY yarn.lock .
RUN yarn
COPY . .
RUN NODE_ENV=production yarn build
ENTRYPOINT [ "node","/dist/index.js" ]
