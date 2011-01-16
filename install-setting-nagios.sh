#!/bin/sh

if [ "`pgrep httpd`" = "" ]; then
  echo "httpd should be running before installing nagios"
  exit 1
fi
