#!/bin/bash

# Build BASE
docker build -t ubuntu-base ubuntu-base/

# Build JAVA
docker build -t ubuntu-java ubuntu-java/

# Build MYSQL DEV
# docker build -t ubuntu-mysql ubuntu-mysql/

# # Build LIFERAY
# docker build -t ubuntu-liferay ubuntu-liferay