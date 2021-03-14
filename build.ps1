Write-Host "Starting Docker container to run build server"

docker run --name build-si -it --rm -p 4000:4000 -p 35729:35729 -v ${PWD}:/build/source:rw aemdesign/centos-java-buildpack bash --login /build/source/docker-build.sh
