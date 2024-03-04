# payface
Spring 2024 ML Club Project

## Setup Instructions

**Note: these instructions work for python 3.10.x. Other python versions may work, but there is no guarantee

### 1. Install cmake (needed to build required dependency dlib)

#### MacOS

    brew install cmake

#### Linux

Installing cmake varies by distribution, but some common examples are provided below. You may
need to install additional packages in order for cmake to be able to compile dlib.

Debian-based distributions (Debian, Ubuntu, Mint, etc)

    sudo apt-get install cmake

RHEL-based distributions (Fedora, CentOS, etc)

    sudo dnf install cmake

If you get compile errors while installing dlib, you may have to do troubleshooting on your own, a
s there could be a multitude of issues, depending on your distribution

#### Windows

Download cmake at [cmake.org/downloads](https://cmake.org/download/). Make sure to add cmake to your PATH in the installer.

Download Visual Studio C++ Build Tools [here](https://visualstudio.microsoft.com/visual-cpp-build-tools/)

Additionally, make sure to download cmake's python library

    pip install cmake

If dlib fails to compile with the above steps, you will need to download a precompiled version of dlib
from [here](https://github.com/z-mahmud22/Dlib_Windows_Python3.x), and then install the other requirements, excluding dlib

### 2. Set up Conda Environment (optional but recommended)
    conda create -n payface_env python=3.10
    conda activate payface_env


### 3. Run these commands in the base of the repository
    pip install -r requirements.txt
    python main.py

If all goes well, you should see a graphical popup with the visual output of your camera.
    
