
$SITE_NAME = Get-Content .\CNAME -Raw
$SITE_NAME = $SITE_NAME -replace "[.\n\r]", "-"
$CONATINER_NAME = "build-$SITE_NAME"

$PORT = Get-Content .\dev.port -Raw
$PORT_LIVERELOAD = Get-Content .\dev-livereload.port -Raw

Write-Host "Starting Docker container to run build server:"
docker run --name $CONATINER_NAME -it --rm -p ${PORT}:${PORT} -p ${PORT_LIVERELOAD}:${PORT_LIVERELOAD} -v ${PWD}:/build/source:rw aemdesign/centos-java-buildpack bash --login /build/source/docker-serve.sh
