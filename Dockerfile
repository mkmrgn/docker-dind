#FROM docker:20.10-dind
FROM crazymax/docker

# ensure all builds runs with Buildkit
ENV DOCKER_BUILDKIT=1
# enable full log of Buildkit builds
ENV BUILDKIT_PROGRESS=plain
# enable Buildx integration with docker
ENV DOCKER_CLI_EXPERIMENTAL=enabled

# Let's start with some basic stuff.
RUN apk add --no-cache git make curl ruby-bundler ruby-json ruby-libs ruby-rdoc yaml
RUN gem update --system --force

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]
