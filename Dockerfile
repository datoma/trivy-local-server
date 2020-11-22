FROM alpine:3.12
LABEL maintainer="Michael Hoffmann (https://github.com/datoma)"

RUN apk --no-cache add ca-certificates=20191127-r4 curl=7.69.1-r1

# Copy the Pre-built binary file from the previous stage
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/master/contrib/install.sh | /bin/sh -s -- -b /usr/local/bin

RUN addgroup trivy && adduser -D -G trivy trivy
RUN mkdir -p /home/trivy/.cache; chown -R trivy:trivy /home/trivy/.cache
VOLUME ["/home/trivy/.cache"]

USER trivy
WORKDIR "/home/trivy/"

# Expose port 4954 to the outside world
EXPOSE 4954

CMD ["trivy", "server", "--listen", "4954"]
