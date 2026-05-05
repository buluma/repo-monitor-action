FROM node:20-bullseye

COPY . .
RUN yarn
RUN NODE_ENV=production yarn build
ENTRYPOINT [ "node","/dist/index.js" ]
