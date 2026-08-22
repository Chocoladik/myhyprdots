{ pkgs, ... }: {

programs.fish = {
    enable = true;
    shellAliases = {
      yay = "cd /etc/nixos && sudo git add -A && sudo nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#YOGA";
      garbage = "sudo nix-collect-garbage -d";
    };
    interactiveShellInit = ''
      fetch --rotate-y --infinite --shading-chars 161
      set -g fish_greeting ""
      set -g fish_color_normal f1f1f1
      set -g fish_color_command --bold ffffff
      set -g fish_color_keyword ffffff
      set -g fish_color_quote 9e9e9e
      set -g fish_color_redirection 757575
      set -g fish_color_end 616161
      set -g fish_color_error --underline 757575
      set -g fish_color_param b0b0b0
      set -g fish_color_comment 959595
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
        
        # Directory path
        set_color 8a8a8a
        echo -n (prompt_pwd)
        
        # Status indicator color
        if test $last_status -eq 0
            set_color --bold ffffff
        else
            set_color 959595
        end
        
        echo -n " › "
        set_color normal
      '';
        stt = ''
      set -l raw_text (grim -g (slurp) - | tesseract - stdout -l eng+deu+spa+rus --psm 6 2>/dev/null)
      set -l clean_text (string match -r '\S.*' $raw_text | string join " " | string trim)

      if test -z "$clean_text"
          return 0
      end

      set -l encoded_query (echo -n "$clean_text" | jq -sRr @uri)
      xdg-open "https://translate.google.com/?sl=auto&tl=ru&text=$encoded_query&op=translate" 
      '';
       sts = '' 
      set -l tmp_img (mktemp /tmp/crop_search_XXXXXX.png)
      grim -g (slurp) $tmp_img 2>/dev/null

      if not test -s $tmp_img
          rm -f $tmp_img
          return 0
      end
      set -l search_url (curl -s -i -F "encoded_image=@$tmp_img" "https://lens.google.com/uploadbyurl" | string match -r -i '^location:\s*(.*)' | string replace -r "(?i)^location:\s*" "" | string trim)
      rm -f $tmp_img

      if test -n "$search_url"
          xdg-open "$search_url"
      end
      '';
      fish_right_prompt = "";
    };
  };
}
