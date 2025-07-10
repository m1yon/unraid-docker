This repository is for creating a Docker container that contains all the necessary development tools to interact with an Unraid server. This avoids the need to install these tools directly on the host machine.

This project uses a custom command `etower` to manage the Unraid docker container.

The `etower` command performs the following actions:
1.  SSH into the Unraid container.
2.  Runs `git pull` to update the repository.
3.  Rebuilds and restarts the Docker container.
4.  Execs into the container with a bash shell.
