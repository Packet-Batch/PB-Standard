# Packet Batch (Standard)
## Description
This is the standard Packet Batch application that utilizes `AF_PACKETv3` Linux sockets. Due to `AF_PACKETv3` Linux sockets support, you are able to use cooked TCP sockets with this version which makes it easier to establish a TCP connection (the three-way handshake).

While this version isn't as fast as the AF_XDP or DPDK versions, having cooked socket support is nice.

A lot of this code is based off of my Packet Sequence project [here](https://github.com/gamemann/Packet-Sequence).

## Configuration
Configuration for this project may be found in the Packet Batch Common [repository](https://github.com/Packet-Batch/PB-Common) including YAML configs and command line support. With that said, you may also check out the Patch Batch Tests [repository](https://github.com/Packet-Batch/PB-Tests) for examples.

## Building And Installing
Building and installing this project is fairly easy. It includes building the Packet Batch Common repository which requires [libyaml](https://github.com/yaml/libyaml). As long as you use the `--recursive` flag with `git`, it should retrieve all of the required submodules automatically located in the `modules/` directory. Otherwise, you will need to go into the Common repository and execute the `git submodule update --init` command. We use `make` to build and install the application.

```bash
# Clone this repository along with its submodules.
git clone --recursive https://github.com/Packet-Batch/PB-Standard.git

# Change the current working directory to PB-Standard/.
cd PB-Standard/

# Make and install (must be ran as root via sudo or root user itself).
sudo make
sudo make install
```

After installing, the executable is copied to the `/usr/bin/` directory which should be included in your `$PATH`. Therefore, you may use the application globally (in any directory).

For example.

```bash
pcktbatch -c /path/to/pcktbatch.yaml
```

## Credits
* [Christian Deacon](https://github.com/gamemann)