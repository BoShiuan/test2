#!/bin/sh

BASEDIR=$(dirname "$0")
log=false
containerName=mssql
port=1433

display_help() {
  printf "\n啟動本機 Microsoft SQL Server with SSIS

  參數:
    -h  指令說明
    -l  開啟日誌
    -n  設定容器名稱
    -p  對應本地埠號"
}

display_docker() {
  printf "\n執行 docker 指令失敗，請確認是否有正確安裝 docker\n安裝說明請見: https://docs.docker.com/get-docker"
}

build_docker_image() {
  if test "$(docker images -q mssql:2019-with-ssis 2>/dev/null)" == ""; then
    docker build -t mssql:2019-with-ssis "$BASEDIR"/src/docker
  fi
}

start() {
  docker run --name "$containerName" -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=P@ssw0rd' -e 'MSSQL_PID=Enterprise' -p "$port":1433 -d mssql:2019-with-ssis &&
  printf "Microsoft SQL Server with SSIS 啟動成功
          容器名稱: %s
          登入帳號: sa
          登入密碼: P@ssw0rd
          連線埠號: %s
          JDBC 連線方式: jdbc:sqlserver://localhost:%s\n" "$containerName" "$port" "$port" >&2
}

display_log() {
  if test "$log" = true; then
    docker logs $containerName -f
  fi
}

while getopts ':hln:p:' option; do
  case "$option" in
  h)
    display_help
    exit 0
    ;;
  l)
    log=true
    ;;
  n)
    containerName=$OPTARG
    ;;
  p)
    port=$OPTARG
    ;;
  :)
    printf "缺少參數值 -%s\n" "$OPTARG" >&2
    display_help
    exit 2
    ;;
  \?)
    printf "無效的參數: -%s\n" "$OPTARG" >&2
    display_help
    exit 2
    ;;
  esac
done

{
  build_docker_image
  start
} || {
  display_docker
  exit 126
}

display_log
