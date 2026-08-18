{ ... }:

{
  networking.hostName = "YOGA";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 57621 ];
    allowedUDPPorts = [ 5353 ];
  };

  time.timeZone = "Europe/Berlin";
}
