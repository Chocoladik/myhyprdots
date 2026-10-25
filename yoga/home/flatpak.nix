{ pkgs, inputs, ... }: {

  services.flatpak = {
    enable = true;
    packages = [
      "com.spotify.Client"
      "org.torproject.torbrowser-launcher"
      "app.zen_browser.zen"
      #"org.onlyoffice.desktopeditors"
    ];
  };
}
