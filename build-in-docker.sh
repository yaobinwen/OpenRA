#!/bin/sh

# Build the Docker builder for OpenRA.
docker image build \
	--file "$PWD/Dockerfile" \
	--tag "openra-builder:22.04" \
	"$PWD"

docker run \
	--dns "8.8.8.8" \
	--volume "$PWD:/openra" \
	--workdir "/openra" \
	openra-builder:22.04 \
	./build.sh
