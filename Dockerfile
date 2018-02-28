FROM debian:stable-slim
RUN apt-get update && apt-get install -y \
	openscad
WORKDIR /build
ENTRYPOINT ["openscad"]
