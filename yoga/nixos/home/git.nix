{pkgs, ...}: {

  programs.gh.enable = true;

  programs.git = {
    enable = true;
    userName = "aktire";
    userEmail = "dognalamenya@gmail.com";
  };
}


