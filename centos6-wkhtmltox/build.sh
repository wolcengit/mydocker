#!/bin/bash

docker build -t wolcen/centos6-wkhtmltox:1.0.0 .
docker login
docker push wolcen/centos6-wkhtmltox:1.0.0

