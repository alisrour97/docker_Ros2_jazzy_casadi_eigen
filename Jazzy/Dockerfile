# Dockerfile
FROM ubuntu:24.04

# Installation des dépendances systèmes nécessaires
RUN apt-get update && apt-get install -y \
    bash \
    build-essential \
    curl \
    vim \
    gnupg \
    gnupg2 \
    software-properties-common \
    sudo \
    git \
    jq \
  && apt-get clean

# Ajout du dépôt officiel ROS Jazzy
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | gpg --dearmor -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Ajout des variables d'environnement pour ROS
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    ROS_DISTRO=jazzy

# Installation des packages de dev
    
# Installation des packages de dev
RUN apt-get update && apt-get install -y socat ros-jazzy-desktop-full ros-jazzy-mavros ros-jazzy-mavros-msgs ros-jazzy-geographic-msgs libprotobuf-dev libprotoc-dev protobuf-compiler libqt5serialport5 libqt5serialport5-dev libqt5serialbus5-dev colcon python3-colcon-common-extensions 
RUN apt-get clean
    
#RUN apt-get update && apt-get install -y libqt5positioning5-dev


# ----------------------------
# Build and install CasADi from the main branch for C++
# ----------------------------
#RUN apt-get update && apt-get install -y liblapack-dev libblas-dev  # dependencies for CasADi
#RUN git clone https://github.com/casadi/casadi.git /opt/casadi && \
#    cd /opt/casadi && \
#    mkdir build && cd build && \
#    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local && \
#    make -j$(nproc) && \
#    make install && \
#    cd / && rm -rf /opt/casadi
    
    
# Install CasADi dependencies INCLUDING IPOPT explicitly
RUN apt-get update && apt-get install -y \
    liblapack-dev libblas-dev \
    coinor-libipopt-dev coinor-libipopt1v5

# Build CasADi explicitly with IPOPT support
RUN git clone https://github.com/casadi/casadi.git /opt/casadi && \
    cd /opt/casadi && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_INSTALL_PREFIX=/usr/local \
             -DWITH_IPOPT=ON && \
    make -j$(nproc) && \
    make install && \
    cd / && rm -rf /opt/casadi



# Installation des dependences python 
#RUN python3 -m pip install colcon-common-extensions --break-system-packages

# Définition du répertoire de travail pour le mapping
WORKDIR /build

# Copier le contenu du dépôt dans le conteneur
#COPY . /build


# Donner les permissions d'exécution au script de builds
#RUN chmod +x /build/*.sh


RUN echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc 


CMD ["/bin/bash"]

