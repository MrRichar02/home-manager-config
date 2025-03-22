Hello darlings, i'm gonna tell you what you should do after clonning the repo, but first clone it
```
git clone https://github.com/MrRichar02/Nixos-config.git config-flake
```

now let's add the hardware-configuration.nix to our config-flake direcotory

```
cp /etc/nixos/hardware-configuration.nix path/to/where/you/cloned/the/repo
```

now edit the configuration.nix file to change the username to match yours

now justo run the rebuild with an special flag that gpt gave me(if it doesn't is gpt's fault)

```
sudo nixos-rebuild switch --flake path/to/where/you/cloned/the/repo --experimental-features 'nix-command flakes'
```

now be happy :)
