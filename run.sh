#!/bin/bash

docker run -it --rm -v $(pwd):/data -w /data hashicorp/terraform:light plan

