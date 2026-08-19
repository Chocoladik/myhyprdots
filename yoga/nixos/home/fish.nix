{ pkgs, ... }: {

programs.fish = {
    enable = true;
    shellAliases = {
      yay = "cd /etc/nixos && sudo git add -A && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#YOGA";
      garbage = "sudo nix-collect-garbage -d";
    };
    interactiveShellInit = ''
      set -g fish_greeting ""
      set -g fish_color_normal d0d0d0
      set -g fish_color_command --bold ffffff
      set -g fish_color_keyword ffffff
      set -g fish_color_quote 9e9e9e
      set -g fish_color_redirection 757575
      set -g fish_color_end 616161
      set -g fish_color_error --underline 757575
      set -g fish_color_param b0b0b0
      set -g fish_color_comment 505050
      set -g fish_color_selection --background=303030
      set -g fish_color_search_match --background=303030
      set -g fish_color_operator 9e9e9e
      set -g fish_color_escape 9e9e9e
      set -g fish_color_autosuggestion 424242
      set -g fish_color_cancel -r
      set -g fish_color_option 9e9e9e
      set -g fish_pager_color_completion d0d0d0
      set -g fish_pager_color_description 616161
      set -g fish_pager_color_prefix --bold ffffff
      set -g fish_pager_color_progress 505050
      set -g fish_pager_color_selected_background --background=303030
    '';  
    
    functions = {
      fish_prompt = ''
        set -l last_status $status
        
        # Directory path (Nord Frost Blue)
        set_color 8a8a8a
        echo -n (prompt_pwd)
        
        # Status indicator color (Nord Aurora Green / Red)
        if test $last_status -eq 0
            set_color --bold ffffff
        else
            set_color 505050
        end
        
        echo -n " › "
        set_color normal
      '';
      
      fish_right_prompt = "";
    };
  };
}
