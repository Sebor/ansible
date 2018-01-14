#!/bin/bash
#
METRIC="$1"
CACHE_FILE="/etc/zabbix/out/nginx-stats"
if [ "${METRIC}" = "active" ]; then
  cat "${CACHE_FILE}" | grep "Active connections" | cut -d':' -f2
fi
if [ "${METRIC}" = "accepts" ]; then
  cat "${CACHE_FILE}" | sed -n '3p' | cut -d" " -f2
fi
if [ "${METRIC}" = "handled" ]; then
  cat "${CACHE_FILE}" | sed -n '3p' | cut -d" " -f3
fi
if [ "${METRIC}" = "requests" ]; then
  cat "${CACHE_FILE}" | sed -n '3p' | cut -d" " -f4
fi
if [ "${METRIC}" = "reading" ]; then
  cat "${CACHE_FILE}" | grep "Reading" | cut -d':' -f2 | cut -d' ' -f2
fi
if [ "${METRIC}" = "writing" ]; then
 cat "${CACHE_FILE}" | grep "Writing" | cut -d':' -f3 | cut -d' ' -f2
fi
if [ "${METRIC}" = "waiting" ]; then
 cat "${CACHE_FILE}" | grep "Waiting" | cut -d':' -f4 | cut -d' ' -f2
fi
#
exit 0
