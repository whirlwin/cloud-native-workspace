#!/usr/bin/env bash

kubectl get pod --all-namespaces -o jsonpath="{..image}" | \
    tr -s '[[:space:]]' '\n' | \
    sort | \
    uniq -c
