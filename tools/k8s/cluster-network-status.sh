#!/usr/bin/env bash

cat <<EOF>curl-format.txt
    time_namelookup:  %{time_namelookup}\n
       time_connect:  %{time_connect}\n
    time_appconnect:  %{time_appconnect}\n
   time_pretransfer:  %{time_pretransfer}\n
      time_redirect:  %{time_redirect}\n
 time_starttransfer:  %{time_starttransfer}\n
                    ----------\n
         time_total:  %{time_total}\n
EOF
curl -w "@curl-format.txt" -v --globoff "$(kubectl cluster-info | awk '{print $6}' | head -n1 | perl -pe 's/\x1b\[[0-9;]*[mG]//g')/healthz"

