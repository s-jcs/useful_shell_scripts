# useful_shell_scripts
## Install
#### copies all scripts in scripts dir to user's bin dir
#### IT WILL OVERWRITE FILES WITH SAME NAME SO USE WITH CAUTION

```
$ bin/install
```
## Clean
removes all scripts in scripts dir to user's bin dir.
```
$ bin/clean
```

## List
lists all executable commands
```
$ bin/list
```

## Current Scripts

### my_kube_cmds
A simple cli for navigating through kubectl commands.
it can...
- get pods
- check pod top
- check pod logs
- enter bash of pod
- delete pod
- get statefulsets
- edit number of stateful sets
- watch/abort・revert/promote argo rollouts

### delete_merged_branches
Command for deleting local branches merge with main|master|develop

### go_build_and_zip
command for building and zipping go code
