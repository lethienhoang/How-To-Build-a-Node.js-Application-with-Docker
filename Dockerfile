FROM node:12-alpine

# RUN command to make sure to grant necessary permission into node_module and app folders, so that when npm install can be executed.
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
# WORKDIR command to set working directory
WORKDIR /home/node/app
# COPY command to copy package.json file.
COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 3000
CMD ["node", "app.js"]
