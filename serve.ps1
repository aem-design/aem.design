
$SITE_NAME = Get-Content .\CNAME -Raw
$SITE_NAME = $SITE_NAME -replace "[.\n\r]", "-"
$CONATINER_NAME = "build-$SITE_NAME"

$PORT = Get-Content .\dev.port -Raw
$PORT_LIVERELOAD = Get-Content .\dev-livereload.port -Raw

$DOCKER_INSPECT_CHECK=$( docker inspect --format "{{.State.Status}}" $CONATINER_NAME )

Start-Process 'http://localhost:8105/'

if ($DOCKER_INSPECT_CHECK -contains "running") {
  Write-Host "Shell into existing Docker container:"
  docker exec -it $CONATINER_NAME bash --login
} else {
  Write-Host "Starting Docker container to run build server:"
  docker run --name $CONATINER_NAME -it --rm -p ${PORT}:${PORT} -p ${PORT_LIVERELOAD}:${PORT_LIVERELOAD} -v ${PWD}:/build/source:rw aemdesign/centos-java-buildpack bash --login /build/source/docker-serve.sh
}
