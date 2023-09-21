FROM osrf/ros:humble-desktop

ARG USERNAME={$USER}
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user and add sudo rights
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && usermod -aG sudo $USERNAME

# Set default user
USER $USERNAME