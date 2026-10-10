{ pkgs, ... }: {

  programs.fish = {
    enable = true;
    binds = {
      "ctrl-right".command = "forward-word";
      "ctrl-left".command = "backward-word";
      "alt-right".command = "forward-token";
      "alt-left".command = "backward-token";
      "ctrl-delete".command = "kill-word";
      "alt-delete".command = "kill-token";
    };
    shellAliases = {
      yay = "cd /etc/nixos && sudo git add -A && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#YOGA";
      garbage = "sudo nix-collect-garbage -d";
      fetch = "fetch --rotate-y --infinite --shading-chars 161";
    };
    functions = {
      fish_prompt = ''
        set -l last_status $status
        set_color e1e1e1
        echo -n (prompt_pwd)
        if test $last_status -eq 0
            set_color --bold ffffff
        else
            set_color e1e1e1 
        end
        echo -n " |-/ "
        set_color normal
      '';

      fish_right_prompt = "";

      fish_greeting = "";
    };
  };
}
