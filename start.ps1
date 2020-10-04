Write-Host "Starting Docker container to run build server"

$SITE_NAME = Get-Content .\CNAME -Raw
$SITE_NAME = $SITE_NAME -replace "[.\n\r]", "-"
$CONATINER_NAME = "build-$SITE_NAME"

#start docker build container
docker run --name $CONATINER_NAME -d -p 8103:4000 -p 35730:35729 -v ${PWD}:/build/source:rw aemdesign/centos-java-buildpack sleep inf

#connect to container
docker exec -it $CONATINER_NAME bash --login
