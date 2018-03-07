FROM debian:stable-slim
RUN apt-get update && apt-get install -y \
	openscad \
	&& rm -rf /var/lib/apt/lists/*
WORKDIR /build
ENTRYPOINT ["openscad"]
