{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.default = with
      nixpkgs.legacyPackages.x86_64-linux; stdenv.mkDerivation {
      name = "external-repo";
      src = ./determinate-repro-external-repo;
      nativeBuildInputs = [ cmake ];
      installPhase = ''
        mv example $out
      '';
    };
  };
}
