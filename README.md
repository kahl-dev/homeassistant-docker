# Home Assistant Docker Setup

This repository contains a Makefile to manage the Home Assistant Docker container on a Raspberry Pi 4.

## Makefile Targets

The Makefile includes the following commands:

- `make build`: Builds the Docker image.
- `make run`: Runs a new Docker container from the image.
- `make start`: Starts the existing Docker container.
- `make stop`: Stops the running Docker container.
- `make remove`: Removes the Docker container.
- `make webinterface`: Outputs the URL for accessing the Home Assistant web interface.

## Usage

1. Open a terminal and navigate to the directory containing the Makefile.

2. If this is your first time running Home Assistant, build the Docker image:

```bash
make build
```

3. Start the Home Assistant Docker container:

```bash
make run
```

The output will include the URL for accessing the Home Assistant web interface. It will look something like this: `http://192.168.1.10:8001`.

4. If you need to stop the Home Assistant Docker container for any reason, use the following command:

```bash
make stop
```

5. To start the container again, use the following command:

```bash
make start
```

This command will also output the URL for accessing the Home Assistant web interface.

6. If you need to remove the Docker container, use the following command:

```bash
make remove
```

**Note**: This command will delete all data stored in the container.

7. To display the URL for the Home Assistant web interface, use the following command:

```bash
make webinterface
```

## Customizing

You can customize the Docker image name, the Docker container name, the IP address of your Raspberry Pi, and the port mapped on your Raspberry Pi by editing the following variables at the top of the Makefile:

- `IMAGE_NAME`: The name of the Docker image. Default is `homeassistant`.
- `CONTAINER_NAME`: The name of the Docker container. Default is `home-assistant`.
- `PI_IP`: The IP address of your Raspberry Pi. Default is the output of the `hostname -I | cut -d' ' -f1` command, which should be the IP address of your Raspberry Pi.
- `PORT`: The port mapped on your Raspberry Pi. Default is `8001`.

