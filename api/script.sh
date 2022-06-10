#!/bin/bash

set -e
set -u

CURRENT=$(date)

php bin/console debug:router >> logs/"debug_$CURRENT.log"
