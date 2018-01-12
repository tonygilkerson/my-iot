FROM nodered/node-red-docker
MAINTAINER tonygilkerson <tonygilkerson@yahoo.com>

# copy in src stuff
COPY node-red-data/ /data/

# Install app dependencies...
WORKDIR /data
RUN npm install

#restore to what it was before the package install
WORKDIR /usr/src/node-red

# We need to make sure the 'node' user has the permissions it needs
USER root
RUN chown -R node-red:node-red /data

# set and node-red user
USER node-red
EXPOSE 1880
