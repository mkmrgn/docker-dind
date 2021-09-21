FROM docker:latest

MAINTAINER Billy Ray Teves <billyteves@gmail.com>

# Let's start with some basic stuff.
RUN apk add --no-cache git make curl

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]
