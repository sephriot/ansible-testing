# Demo

###
- demo_playbook_1.yaml: status, logs collection, diff
- demo_playbook_2.yaml: Roles
- demo_playbook_3.yaml: Failed task
- demo_playbook_4.yaml: Ignore error
- demo_playbook_5.yaml: Conditional ignore error, `SPACELIFT_SKIP_PLANNING=true`
- demo_playbook_6.yaml: Rescue
- demo_playbook_7.yaml: Gather facts only in check mode


### Helper lines
```
ansible-galaxy role install webofmars.dummy
```

https://docs.spacelift.io/vendors/ansible/reference
```
SPACELIFT_ANSIBLE_CLI_ARGS="--diff"
```

```
environment:
    SPACELIFT_SKIP_PLANNING: true
```

### Plan
1. Configure stack, show simple run, then edit inventory to use one mounted from context, execute run again, display only one host being updated.
2. Run playbook_2 without installing the role. Display error, add hook, run again
3. Display failed task
4. Ignore failed task
5. Show how to skip planning
6. Discard SKIP_PLANNING and present rescue status
7. Present drift in hosts if gathering tasks is inconsistent

