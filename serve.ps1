
$SITE_NAME = Get-Content .\CNAME -Raw
$SITE_NAME = $SITE_NAME -replace "[.\n\r]", "-"
$CONATINER_NAME = "build-$SITE_NAME"

$PORT = Get-Content .\dev.port -Raw
$PORT_LIVERELOAD = Get-Content .\dev-livereload.port -Raw

Write-Host "Remove existing container:"
docker rm -f $CONATINER_NAME

Write-Host "Starting Docker container to run build server:"
docker run --name $CONATINER_NAME -it --rm -p ${PORT}:${PORT} -p ${PORT_LIVERELOAD}:${PORT_LIVERELOAD} -e LANG=en_US.UTF-8 -e TZ=Australia/Melbourne  -v ${PWD}:/build/source:rw aemdesign/java-buildpack:ubuntu bash --login /build/source/docker-serve.sh
