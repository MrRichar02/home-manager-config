{ lib, ... }: {
  options.flake = {
    # Esto habilita el merge recursivo para homeConfigurations
    homeConfigurations = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.raw;
      default = {};
    };
    # Esto hace lo mismo para tus módulos de home-manager
    homeModules = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.unspecified; # 'unspecified' o 'deferredModule'
      default = {};
    };
  };
}
