# carla-client-docker
Carla Client (0.9.8) inside a docker image

### Getting Started (macOS)

(Modified from [X11 in docker on macOS])

1. Install XQuartz: https://www.xquartz.org/
1. Launch XQuartz.  Under the XQuartz menu, select Preferences
1. Go to the security tab and ensure "Allow connections from network clients" is checked.
1. Run `xhost + ${hostname}` to allow connections to the macOS host *
1. Setup a HOSTNAME env var `` export HOSTNAME=`hostname` ``*
1. Build and run the docker image:
```bash
docker build -t carla-client-docker .
docker run -e DISPLAY=$(hostname):0 -v /tmp/.X11-unix:/tmp/.X11-unix -it carla-client-docker
```

In the docker container, run (assuming Carla server is running on ports 2000-2002 on the host machine):
```bash
python3 examples/automatic_control.py --host "host.docker.internal"
```

### References

[X11 in docker on macOS]

[X11 in docker on macOS]: https://gist.github.com/cschiewek/246a244ba23da8b9f0e7b11a68bf3285
