FROM node:20-bullseye

COPY . .
# Use Yarn Classic to match lockfile format and local CI behavior.
RUN npm install -g yarn@1.22.22
RUN yarn --frozen-lockfile
RUN NODE_ENV=production yarn build
ENTRYPOINT [ "node","/dist/index.js" ]
