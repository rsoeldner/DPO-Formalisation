{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?rev=4d2b37a84fad1091b9de401eb450aae66f1a741e";
    flake-utils.url = "github:numtide/flake-utils";
    isabelle2023.url = "github:jvanbruegge/nixpkgs/isabelle-2023";
  };

  outputs = {self, nixpkgs, flake-utils, isabelle2023}:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          packages.default = isabelle2023.legacyPackages.${system}.isabelle;
        }
      );
}
