# kubernetes-boxkit
## Features
### Kubernetes and Openshift development tools
- kubectl
- openshift-client (oc)
- go
- vscode

![image](https://github.com/user-attachments/assets/29ee97b9-e09f-4ddc-a681-67758f4b13a6)



### VS Code Extensions
By default, this image comes with three VS Code extensions, which can be modified by changing `post-install/vscode-extensions.list`
- Night Owl (my dark theme of choice)
- Git Lens (For git blame and other inspection tools)
- Go (for uh. Go)

These extensions are installed to `$HOME/.vscode-extensions`, which keeps them separate from any other boxes you might spin up. This means your extensions can be unique to the dev environment you use the dev box for.

### 1Password ssh-enabled
The post-installation justfile creates a symlink to `$DISTROBOX_HOST_HOME/.1Password` to allow 1Password ssh keys to be usable inside the distrobox. A symlink to `.gitconfig` and a copied `.ssh/config` are also included to facilitate this.

## For use in Distrobox
This boxkit is designed for use in Distrobox with a modified `HOME` directory. As such, a `justfile` is included in `/opt/post-install` to complete the installation.

Upon loading into the distrobox, do the following:
```bash
$ just -f /opt/post-install/justfile
$ freload # custom fish function reloads the fish config
```
