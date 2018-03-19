FROM debian:stable-slim
RUN apt-get update && apt-get install -y \
	openscad \
	&& rm -rf /var/lib/apt/lists/*
RUN mkdir -p /root/.local/share  # Avoids errors from boost
WORKDIR /build
ENTRYPOINT ["openscad"]
