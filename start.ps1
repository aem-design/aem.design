Write-Host "Starting Docker container to run build server"

$SITE_NAME = Get-Content .\CNAME -Raw
$SITE_NAME = $SITE_NAME -replace "[.\n\r]", "-"
$CONATINER_NAME = "build-$SITE_NAME"

$PORT = Get-Content .\dev.port -Raw
$PORT_LIVERELOAD = Get-Content .\dev-livereload.port -Raw

#start docker build container
docker run --name $CONATINER_NAME -d -p ${PORT}:${PORT} -p ${PORT_LIVERELOAD}:${PORT_LIVERELOAD} -v ${PWD}:/build/source:rw aemdesign/centos-java-buildpack sleep inf

#connect to container
docker exec -it $CONATINER_NAME bash --login
