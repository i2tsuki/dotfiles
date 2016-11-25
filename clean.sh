#!/bin/sh

set -eu

find ./ -type f -name '*\~' | grep -v 'backup' | xargs -I {} rm -fv {}
