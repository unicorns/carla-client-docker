# carla-client-docker
Carla Client (0.9.8) as a docker image (ubuntu16.04)

This repo contains a Carla Python API precompiled on Ubuntu 16.04. This enables any machine capable of running docker to quickly set up a Carla client.

### Getting Started (macOS)

(Modified from [X11 in docker on macOS])

1. Install XQuartz: https://www.xquartz.org/
1. Launch XQuartz.  Under the XQuartz menu, select Preferences
1. Go to the security tab and ensure "Allow connections from network clients" is checked.
1. Run `xhost + ${hostname}` to allow connections to the macOS host *
1. Setup a HOSTNAME env var `` export HOSTNAME=`hostname` ``*
1. Pull and run the docker image
```bash
docker pull docker.pkg.github.com/unicorns/carla-client-docker/carla-client:0.9.8
docker run -e DISPLAY=$(hostname):0 -v /tmp/.X11-unix:/tmp/.X11-unix -it docker.pkg.github.com/unicorns/carla-client-docker/carla-client:0.9.8
```

In the docker container, run (assuming Carla server is running on ports 2000-2002 on the host machine):
```bash
python3 examples/automatic_control.py --host "host.docker.internal"
```

### Building

```bash
git clone https://github.com/unicorns/carla-client-docker.git
cd carla-client-docker
docker build -t carla-client-docker .
```

### References

* [Carla]
* [X11 in docker on macOS]

[Carla]: https://github.com/carla-simulator/carla

[X11 in docker on macOS]: https://gist.github.com/cschiewek/246a244ba23da8b9f0e7b11a68bf3285
