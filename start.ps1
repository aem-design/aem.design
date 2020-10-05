Write-Host "Starting Docker container to run build server"

$SITE_NAME = Get-Content .\CNAME -Raw
$SITE_NAME = $SITE_NAME -replace "[.\n\r]", "-"
$CONATINER_NAME = "build-$SITE_NAME"

#start docker build container
docker run --name $CONATINER_NAME -d -p 8111:4000 -p 35129:35729 -v ${PWD}:/build/source:rw aemdesign/centos-java-buildpack bash --login /build/source/docker-sleep.sh

#connect to container
docker exec -it $CONATINER_NAME bash --login
