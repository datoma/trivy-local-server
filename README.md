# trivy
#### What
trivy as server component

Note:
IF you want to check local Images. you hvbe to mount the  docker socket and remove the user trivy - but thats very unsecure.

#### command
see the sample docker-compose file and run it via
    docker-compose up -d

## trivy client
#### command
    docker run --name trivy-client --rm -it datoma/trivy-local-server:latest trivy client --remote https://<SERVERNAME>:4954 <IMAGE_TO_CHECK>
#### json as output
    docker run --name trivy-client --rm -it datoma/trivy-local-server:latest trivy client --remote https://<SERVERNAME>:4954 -f json <IMAGE_TO_CHECK>
