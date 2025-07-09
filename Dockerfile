FROM ubuntu:latest

# This command does nothing but keeps the container running in the background.
# This allows you to 'docker exec' into it at any time.
CMD ["tail", "-f", "/dev/null"]
