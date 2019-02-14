#!/usr/bin/env bash

# Replace values enclosed in <...>
SRC="docker://docker.io/<user>/<image>:<from-tag> "
DEST="docker://docker.io/<user>/<image>:<to-tag> "

# Either  base64 of username:password, just username:password, OCP token or similar
SRC_CREDS=""
DEST_CREDS=""

skopeo copy --insecure-policy=true \
        --debug=true \
        --src-tls-verify=false \
        --dest-tls-verify=false \
        --dest-creds=unused:$(oc whoami -t) \
        --src-creds=unused:$(oc whoami -t) \
        $SRC \
        $DEST

