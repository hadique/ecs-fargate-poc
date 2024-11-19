# Use the official Node.js image as the base

FROM node:18.16-alpine3.17

# Set the working directory in the container

LABEL "com.datadoghq.tags.env": "fargate"
LABEL "com.datadoghq.tags.service": "blurryface",
LABEL "com.datadoghq.tags.version": "1.0.0",
LABEL "com.docker.service.name": "fargate-python"


WORKDIR /home/sample-app

RUN mkdir -p /home/sample-app
# Copy package.json and package-lock.json

COPY ./sample-app/package*.json ./

# Install dependencies
RUN npm install dd-trace --save

RUN npm install

# Copy the rest of the application code

COPY ./sample-app ./

# Expose the port your app listens on

EXPOSE 3000

# Start the Node.js application
#ENTRYPOINT [ "NODE_OPTIONS=\"--require dd-trace/init\"" ]
ENV NODE_OPTIONS="--require dd-trace/init"
CMD [ "npm", "start" ]
#CMD [ "npm", "start" "--require dd-trace/init" ]
#CMD ["npm", "start ${ARGS:-${DEFAULT_ARGS}}" ]
#NODE_OPTIONS="--require dd-trace/init" npm start
