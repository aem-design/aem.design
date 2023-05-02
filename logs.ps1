Param(
  [string]$LOG_PATH = ".\logs",
  [string]$LOG_PEFIX = "start",
  [string]$LOG_SUFFIX = ".log",
  [string]$FUNCTIONS_URI = "https://github.com/aem-design/aemdesign-docker/releases/latest/download/functions.ps1",
  [string]$SERVICES = "$( (Get-Content ".\start-services.conf" | Where-Object {$_ -notmatch '^#.*'} | Where-Object {-not([String]::IsNullOrWhiteSpace($_))} ) -join " --file ")",
  [string]$PORT = "443",
  [string]$HOST_URL = "https://localhost",
  [Parameter(Position=0)]
  [string]$SERVICE_NAME = "" # services to start
)

$SKIP_CONFIG = $true
$PARENT_PROJECT_PATH = "."

. ([Scriptblock]::Create((([System.Text.Encoding]::ASCII).getString((Invoke-WebRequest -Uri "${FUNCTIONS_URI}").Content))))

$PLATFORM=$PSVersionTable.Platform

# get env config
$CONFIG_ENV = (Get-Content ".env" -Raw | ConvertFrom-StringData)
$PORT=$CONFIG_ENV.TRAEFIK_HTTP_PORT

$DOCKER_COMMAND="docker-compose --env-file .env --file docker-compose.yml --file ${SERVICES} logs -f ${SERVICE_NAME}"

if ( [string]::IsNullOrEmpty(${SERVICE_NAME}) ) {

  if ( $PLATFORM -eq "Unix" ) {
    $OPEN_COMMAND="open"
  } else {
    $OPEN_COMMAND="explorer"
  }

  printSubSectionStart "Open Console at $HOST_URL"

  Invoke-Expression "${OPEN_COMMAND} ${HOST_URL}"

}

printSubSectionStart "Docker Compose Execute"

printSectionLine "${DOCKER_COMMAND}"

Invoke-Expression "${DOCKER_COMMAND}"


