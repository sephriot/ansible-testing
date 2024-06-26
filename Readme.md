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

## Other setup notes

I want to test it with roles defined in local directory.

```
export ANSIBLE_INVENTORY=inventory_local.yaml

ansible-runner run -i apply --artifact-dir=artifacts . -p playbook_1.yaml

export ANSIBLE_ROLES_PATH=$(pwd)/galaxy/roles
export ANSIBLE_COLLECTIONS_PATH=$(pwd)/galaxy/collections

ansible-galaxy role install --roles-path=$ANSIBLE_ROLES_PATH geerlingguy.java
```