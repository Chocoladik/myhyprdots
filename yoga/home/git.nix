{pkgs, ...}: {

  programs.gh.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "aktire";
      user.email = "dognalamenya@gmail.com";
    };
  };
}


