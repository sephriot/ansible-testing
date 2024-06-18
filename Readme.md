# ansible-testing

## Run image locally:

```
docker build -t sshd-image .
docker run --rm -it --name sshd -p 2222:22  sshd-image
ssh -p 2222 bilbo@localhost
```

## Run in Kind

```
kind load docker-image sshd-image
```

## Ansible runner

```
docker build -t localhost:5001/ansible-runner .
docker push localhost:5001/ansible-runner
```