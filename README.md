# Dockertex

This is a Dockerfile for building a Docker image which can be used to compile LaTeX documents with different external packages without managing multiple installations on the system. If caching is enabled, it has negligible overhead over running it bare-metal.

# Installation

1. Build the Docker image: `docker build -t dockertex:latest .`
2. Modify `run_dockertex.sh` to suit your needs (comments provided); IMPORTANT: Specify absolute paths, or else 3. won't work properly!
3. Add `run_dockertex.sh` to your path, e.g. with `ln -s run_dockertex.sh /usr/local/bin/dockertex`
