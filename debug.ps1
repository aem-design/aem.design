Param(
  [string]$LOG_PATH = "${PWD}\logs",
  [string]$LOG_PEFIX = "docker",
  [string]$LOG_SUFFIX = ".log",
  [string]$TAG = "jdk11",
  [string]$FILE = "Dockerfile",
  [string]$FUNCTIONS_URI = "https://github.com/aem-design/aemdesign-docker/releases/latest/download/functions.ps1",
  [string]$COMMAND = "docker build . -f .\${FILE} -t ${TAG}"
)

$SKIP_CONFIG = $true
$PARENT_PROJECT_PATH = "."

. ([Scriptblock]::Create((([System.Text.Encoding]::ASCII).getString((Invoke-WebRequest -Uri "${FUNCTIONS_URI}").Content))))

printSectionBanner "Loading Debug Image"
printSectionLine "$COMMAND" "warn"

$SITE_NAME = Get-Content .\CNAME -Raw
$SITE_NAME = $SITE_NAME -replace "[.\n\r]", "-"
$CONATINER_NAME = "build-$SITE_NAME"

$PORT = Get-Content .\dev.port -Raw
$PORT_LIVERELOAD = Get-Content .\dev-livereload.port -Raw

Write-Host "Remove existing container:"
docker rm -f $CONATINER_NAME

docker run --name $CONATINER_NAME -it --rm -p ${PORT}:${PORT} -p ${PORT_LIVERELOAD}:${PORT_LIVERELOAD} -e LANG=en_US.UTF-8 -e TZ=Australia/Melbourne  -v ${PWD}:/build/source:rw aemdesign/java-buildpack:ubuntu bash --login
