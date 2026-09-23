{ pkgs, ... }: {

programs.fish = {
    enable = true;
    shellAliases = {
      yay = "cd /etc/nixos && sudo git add -A && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#YOGA";
      garbage = "sudo nix-collect-garbage -d";
      fetch = "fetch --rotate-y --infinite --shading-chars 161";
    };
    functions = {
      fish_prompt = ''
        set -l last_status $status
        
        set_color 8a8a8a
        echo -n (prompt_pwd)
        
        if test $last_status -eq 0
            set_color --bold ffffff
        else
            set_color 959595
        end
        
        echo -n " |-/ "
        set_color normal
      '';
      fish_right_prompt = "";
      fish_greeting = "";
    };
  };
}
