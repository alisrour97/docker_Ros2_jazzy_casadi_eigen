# execution du container avec mappage 
# -it    : session interactive
# --name : nom du container
# -v     : Montage du dossier local dans le container sous /build
#
#docker run -it \
#    --name ubuntu24-ros-jazzy \
#    -v $(pwd):/build \
#    ubuntu24-ros-jazzy
    
    
#!/bin/bash

# Enable access to X11 display for GUI applications
xhost +local:docker

# Get the current directory path and name
WORKDIR=$(pwd)                     # Absolute path of the current directory
DIR_NAME=$(basename "$WORKDIR")     # Extracts just the folder name

# Run the Docker container
docker run -it --privileged \
    --env LOCAL_USER_ID="$(id -u)" \
    --env DISPLAY=":10.0" \
    -v "$WORKDIR":"/home/user/$DIR_NAME":rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --network host \
    --workdir "/home/user/$DIR_NAME" \
    --name dc_ros2 \
    dock_dronecontroller2:Jazzy
