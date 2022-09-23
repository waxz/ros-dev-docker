ros in docker with gui 


1. install docker
```sh
sudo apt-get install ca-certificates curl gnupg lsb-release
```

```sh
curl https://get.docker.com | sh && sudo systemctl --now enable docker
```

[Install Docker and Docker-Compose bash completion · GitHub](https://gist.github.com/toschneck/2df90c66e0f8d4c6567d69a36bfc5bcd)
```sh

echo "install docker bash completion"
curl -L https://raw.githubusercontent.com/docker/docker/v$(docker version --format '{{.Server.Version}}')/contrib/completion/bash/docker -o /etc/bash_completion.d/docker

echo "install docker-compose bash completion"
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

echo ".... done!"
```

optional: install nvidia-container-toolkit 

```sh
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
```


2.  add user group
```sh
sudo usermod -aG docker $USER
```

```sh
su - ${USER}
```

3. edit `~/.bashrc`
```sh
export UID=$(id -u)
export GID=$(id -g)
```

4. build and run docker
```sh
docker-compose up
```
or
```sh
docker-compose run --service-ports --rm --entrypoint tmux ros-dev
```
