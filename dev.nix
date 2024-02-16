# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  channel = "stable-23.11"; # "stable-23.11" or "unstable"
  # Use https://search.nixos.org/packages to  find packages
  packages = [
    pkgs.nodejs
  ];
  # runs when a workspace is first created with this `dev.nix` file
  # to run something each time the environment is rebuilt, use the `onStart` hook
  idx.workspace.onCreate = {
    install = "npm install";
  };
  # preview configuration
  idx.previews = {
    enable = true;
    previews = [
      {
        command = ["npx" "@11ty/eleventy" "--serve"];
        env = { PORT = "$PORT";};
        manager = "web";
        id = "web";
      }
      {
        manager = "ios";
        id = "ios";
      }
    ];
  };
}