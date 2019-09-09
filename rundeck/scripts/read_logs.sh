#!/bin/bash
while IFS= read -r LOGLINE || [[ -n "$LOGLINE" ]]; do
    printf '%s\n' "$LOGLINE"

done < <(timeout 600 tail -f /servicios/wecorp_tedbrasil/tomcat-7.0.35/logs/catalina.out)
exit 0

##READING LOGS
