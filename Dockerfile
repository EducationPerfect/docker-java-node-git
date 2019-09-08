FROM java:8

# Global install nodejs
RUN apt-get update && apt-get install -y curl apt-transport-https && \
   curl -sL https://deb.nodesource.com/setup_12.x | bash && \
   apt-get install -y nodejs build-essential && \
   apt-get install -y libssl-dev

WORKDIR /workspace