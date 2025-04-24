FROM node:18

# install python & pip
RUN apt-get update \
  && apt-get install -y python3 python3-pip build-essential \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# make sure your setup.sh can run
RUN chmod +x setup.sh \
  && ./setup.sh

# install & build
RUN npm install \
  && npm run build

EXPOSE 8080
CMD ["npm", "start"]
