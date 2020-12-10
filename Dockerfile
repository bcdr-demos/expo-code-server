# start with code-server's Debian image
FROM codercom/code-server:latest

# Run everything as root
USER root

RUN apt-get update

# Install other developer tools
RUN apt-get install -y git build-essential

# Install Node 12+
RUN apt-get remove nodejs -y
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y nodejs
RUN sudo apt-get update && sudo apt-get install -y python3.7 python3-pip

# Install expo-cli
RUN npm install -g expo-cli

# Expose expo ports
EXPOSE 19000/tcp
EXPOSE 19001/tcp

# Expose expo dev tools
EXPOSE 19002/tcp

# Set back to coder user
USER coder