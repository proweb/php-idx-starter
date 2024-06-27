# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.php83
    pkgs.php83Packages.composer
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "devsense.composer-php-vscode"
      "devsense.intelli-php-vscode"
    ];
    workspace = {
      # Runs when a workspace is (re)started
      onStart= {
        run-server = "php -S localhost:3000 index.php";
      };
    };
  };
}