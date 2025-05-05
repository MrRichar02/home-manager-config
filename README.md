# Home-manager config

First clone the repo

```
git clone https://github.com/MrRichar02/home-manager-config.git
```

Now edit the home.nix file to change the username

```
nano home.nix
```

Enter a nix shell with home-manager

```
nix shell nixpkgs#home-manager --experimental-features 'nix-command flakes'
```

run the home config

```
home-manager switch --flake /path/to/where/you/cloned/the/repo 
```

now be happy my darling
