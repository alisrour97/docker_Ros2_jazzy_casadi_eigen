# **Docker Setup Guide for Ubunto ROS2- Jazzy**

This documentation provides a step-by-step guide on how to install Docker locally on a Linux system and use it as a container for `Ros2/Jazzy`.

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
git clone https://github.com/alisrour97/Docker_ubunto_24-Ros_jazzy.git
cd Docker_ubunto_24-Ros_jazzy
./build.bash Jazzy
```

---

## **3. Run the Docker Container**

Before running the docker **Copy the `create_dc_ros2.sh` script** inside `Ros2-ws`.
Each time you need to enter the Docker container, execute the following steps:

```bash
chmod +x create_dc_ros2.sh
./create_dc_ros2.sh
```

This starts the Docker container, and its name will be `dc_ros2`.
Just as a note `chmod +x ` is required only once to give permission.

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


