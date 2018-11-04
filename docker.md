# Install and Configure Docker

## Install

1. Remove Existing Docker

```sh
sudo apt remove docker docker-engine docker.io
```

2. Install Dependences

```sh
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

3. Install Docker

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
sudo usermod -aG docker $USER
```

4. Install Docker Compose

```sh
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

5. Configure Docker without sudo

```sh
sudo usermod -aG docker $USER
```

## Install Services

### Postgresql

1. Pull imagem

```sh
docker pull postgres
```

2. Run config to image

```sh
docker run --name postgres -p 0.0.0.0:5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres
```

3. Start image

```sh
docker start postgres
```

### Redis

1. Pull imagem

```sh
docker pull redis
```

2. Run config to image

```sh
docker run --name redis -d redis -p 127.0.0.1:6379:6379
```

3. Start image

```sh
docker start redis
```