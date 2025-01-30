# **Docker Setup Guide for DroneController2**

This documentation provides a step-by-step guide on how to install Docker locally on a Linux system and use it as a container for `dev/DroneController2`.

---

## **1. Install Docker on Your Host Machine**

To install Docker easily, use the following script:

```bash
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

### **Run Docker as a Non-Root User**
It is recommended to run Docker as a non-root user to prevent your build folder from being owned by root. Execute the following commands in a new terminal:

```bash
# Create docker group (may not be required)
sudo groupadd docker

# Add your user to the docker group.
sudo usermod -aG docker $USER
```

**Now log out and log back in before using Docker!!**

---

## **2. Build the Docker Image**

The following command builds the Docker image on your host machine. This step is required only once unless you modify the `Dockerfile`.

```bash
git clone http://gitlab.sts.seaowl.com:9004/dev/dock_dronecontroller2.git
cd dock_dronecontroller2
./build.bash Jazzy
```

---

## **3. Run the Docker Container**

Each time you need to enter the Docker container, execute the following steps:

1. **Copy the `create_dc_ros2.sh` script** inside `DroneController2`.
2. **Run the script** using the commands below:

```bash
chmod +x create_dc_ros2.sh
./create_dc_ros2.sh
```

This starts the Docker container, and its name will be `dc_ros2`.

---

## **4. Managing the Docker Container**

If you need to open another instance in a separate terminal, use:

```bash
docker exec -u 0 -it dc_ros2 bash
```

To close the container, simply press `Ctrl+D` inside the container.

To restart it later, use:

```bash
docker start dc_ros2
docker attach dc_ros2
```

If you want to remove the container:

```bash
docker rm dc_ros2
```

If the `./create_dc_ros2.sh` script does not open the container, an old instance may still be running. Remove it using:

```bash
docker rm dc_ros2
```

Then, re-run the script:

```bash
./create_dc_ros2.sh
```

---


