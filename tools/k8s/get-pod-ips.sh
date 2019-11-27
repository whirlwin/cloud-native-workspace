#!/usr/bin/env bash

oc get pod -ojsonpath='{range .items[*]}{@.metadata.name}{" "}{@.status.podIP}{"\n"}'

