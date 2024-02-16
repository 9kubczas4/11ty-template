{ pkgs, ... }: {
  packages = [
    pkgs.nodejs
  ];
  bootstrap = ''
    mkdir "$WS_NAME"
    cd "$WS_NAME"
    npm init -y
    npm install @11ty/eleventy --save-dev
    echo '# Hello World!' > index.md
    cd ..
    mkdir -p "$WS_NAME/.idx/"
    cp -rf ${./dev.nix} "$WS_NAME/.idx/dev.nix"
    chmod -R +w "$WS_NAME"
    mv "$WS_NAME" "$out"
  '';
}