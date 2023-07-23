# Packet Batch (Standard)
[![Packet Batch Standard Build Workflow](https://github.com/Packet-Batch/PB-Standard/actions/workflows/build.yml/badge.svg)](https://github.com/Packet-Batch/PB-Standard/actions/workflows/build.yml) [![Packet Batch Standard Run Workflow](https://github.com/Packet-Batch/PB-Standard/actions/workflows/run.yml/badge.svg)](https://github.com/Packet-Batch/PB-Standard/actions/workflows/run.yml)

## Description
This is the standard Packet Batch application that utilizes `AF_PACKETv3` Linux sockets. Due to `AF_PACKETv3` Linux sockets support, you are able to use cooked TCP sockets with this version which makes it easier to establish a TCP connection (the three-way handshake).

While this version isn't as fast as the AF_XDP or DPDK versions, having cooked socket support is nice.

A lot of this code is based off of my Packet Sequence project [here](https://github.com/gamemann/Packet-Sequence).

## Configuration
Configuration for this project may be found in the Packet Batch Common [repository](https://github.com/Packet-Batch/PB-Common) including YAML configs and command line support. With that said, you may also check out the Packet Batch Tests [repository](https://github.com/Packet-Batch/PB-Tests) for examples.

## Building And Installing
Building and installing this project is fairly easy. It includes building the Packet Batch Common repository which requires [libyaml](https://github.com/yaml/libyaml). As long as you use the `--recursive` flag with `git`, it should retrieve all of the required submodules automatically located in the `modules/` directory. Otherwise, you will need to go into the Common repository and execute the `git submodule update --init` command. We use `make` to build and install the application.

```bash
# Clone this repository along with its submodules.
git clone --recursive https://github.com/Packet-Batch/PB-Standard.git

# Install build essentials/tools and needed libaries for LibYAML.
sudo apt install build-essential clang autoconf libtool

# Change the current working directory to PB-Standard/.
cd PB-Standard/

# Execute ./build.sh file to build and install dependencies and main project which requires sudo privileges.
# WARNING - If you don't have sudo available on your system, please look at the ./build.sh file and execute make commands as root in order.
# NOTE - You may also look at the .github/workflows/build.yml.
# NOTE - The first argument represents the amount of threads to use with make. 0 uses the amount of available threads on the system and supplying no argument uses 1 thread.
./build.sh 0

# You may use the following to clean the build. You must run this as root or sudo because of the Common's LibYAML clean.
sudo make clean
```

### Installation Video!
[![Click here to watch!](https://i.imgur.com/iQqsTVZ.jpeg)](https://www.youtube.com/watch?v=GFMiPR4me8M)

After installing, the executable is copied to the `/usr/bin/` directory which should be included in your `$PATH`. Therefore, you may use the application globally (in any directory).

For example.

```bash
pcktbatch -c /path/to/pcktbatch.yaml
```

## Credits
* [Christian Deacon](https://github.com/gamemann)
