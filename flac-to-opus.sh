#!/bin/bash
#set -x

find "/mnt/l/Music" -type f -name "*.flac" -print0 | while read -d $'\0' e;do
  file=$(printf '%s\n' "${e%.flac}")
  if [ ! -f "$file.opus" ];then
    opusenc --comp 10 --bitrate 192 --vbr "$e" "${e%.*}.opus"
  fi
  echo "$file"
done

exit 0
