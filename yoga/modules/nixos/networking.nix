{ ... }:

{
  networking.hostName = "YOGA";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 57621 ];
    allowedUDPPorts = [ 5353 ];
    allowedUDPPortRanges = [
    { from = 50000; to = 65535; }
  ];
  };

  time.timeZone = "Europe/Berlin";
}
