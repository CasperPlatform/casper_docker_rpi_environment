# Docker environment for RPI

- This is a scalable docker env that can be modified easily with more containers.
- shell scripts do all the heavy lifting to instantiate containers. 

- Syntax for starting or stopping a container:

```bash
sudo service <servicename> start/stop/restart
```

- to debug a running container, type:

```bash
sudo journalctl -f -u <servicename>
```

- after each change to a systemd script, run:

```
sudo systemctl daemon-reload
```