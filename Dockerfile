FROM node:20-bullseye

COPY . .
RUN yarn --frozen-lockfile
RUN NODE_ENV=production yarn build
ENTRYPOINT [ "node","/dist/index.js" ]
