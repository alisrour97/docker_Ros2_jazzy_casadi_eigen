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
RUN apt-get update && apt-get install -y \
    socat \
    ros-jazzy-desktop-full \ 
    ros-jazzy-geographic-msgs \
    libqt5serialport5-dev \
    libprotobuf-dev \
    libprotoc-dev \
    protobuf-compiler \
    libqt5serialport5 \
    colcon \
    python3-colcon-common-extensions \
    && apt-get clean

# Installation des dependences python 
#RUN python3 -m pip install colcon-common-extensions --break-system-packages

# Creation d'un utilisateur non root (optionnel mais recommandé)
#RUN useradd -ms /bin/bash seaowl && \
#    echo "seaowl:seaowl" | chpasswd && \
#    usermod -aG sudo seaowl

# Définition du répertoire de travail pour le mapping
WORKDIR /build

# Copier le contenu du dépôt dans le conteneur
#COPY . /build

# Donner les permissions d'exécution au script de builds
#RUN chmod +x /build/*.sh

# Commande par défaut
#USER seaowl

RUN echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc 

#RUN echo 'export CMAKE_PREFIX_PATH=/opt/ros/jazzy:$CMAKE_PREFIX_PATH' >> ~/.bashrc
#RUN echo 'export ament_cmake_DIR=/opt/ros/jazzy/share/ament_cmake/cmake' >> ~/.bashrc

CMD ["/bin/bash"]

