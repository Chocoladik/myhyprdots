{pkgs, ...}: {
programs.git = {
  enable = true;
  settings.user = {
    name  = "aktire";
    email = "dognalamenya@gmail.com";
  };
};
}


