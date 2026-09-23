{ config, pkgs, ...}: {
xdg.configFile."matugen/config.toml".text = ''
[config]

[templates.spicetify_colorful]
input_path = '~/.config/matugen/templates/spicetify-colorful.ini'
output_path = '~/.config/spicetify/Themes/Colorful/color.ini'
post_hook = 'spicetify apply -q --no-restart'

[templates.btop]
input_path = '~/.config/matugen/templates/btop.theme'
output_path = '~/.config/btop/themes/matugen.theme'
post_hook = 'pkill -USR2 btop || true'
'';

xdg.configFile."matugen/templates/spicetify-colorful.ini".text = ''
[noctalia]
text               = {{colors.on_surface.default.hex_stripped}}
subtext            = {{colors.on_surface_variant.default.hex_stripped}}
main               = {{colors.surface.default.hex_stripped}}
sidebar            = {{colors.surface_container_lowest.default.hex_stripped}}
player             = {{colors.surface_container_lowest.default.hex_stripped}}
card               = {{colors.surface_container_high.default.hex_stripped}}
shadow             = 000000
selected-row       = {{colors.surface_container_highest.default.hex_stripped}}
button             = {{colors.primary.default.hex_stripped}}
button-active      = {{colors.primary.default.hex_stripped}}
button-disabled    = {{colors.outline.default.hex_stripped}}
tab-active         = {{colors.primary.default.hex_stripped}}
notification       = {{colors.surface_container_high.default.hex_stripped}}
notification-error = {{colors.error.default.hex_stripped}}
misc               = {{colors.tertiary.default.hex_stripped}}
'';

xdg.configFile."matugen/templates/btop.theme".text = ''
[matugen]
theme[main_bg]=""
theme[main_fg]="{{colors.on_surface.default.hex}}"
theme[title]="{{colors.primary.default.hex}}"
theme[hi_fg]="{{colors.secondary.default.hex}}"
theme[selected_bg]="{{colors.primary.default.hex}}"
theme[selected_fg]="{{colors.on_primary.default.hex}}"
theme[inactive_fg]="{{colors.on_surface_variant.default.hex}}"
theme[proc_misc]="{{colors.tertiary.default.hex}}"
theme[cpu_box]="{{colors.outline.default.hex}}"
theme[mem_box]="{{colors.outline.default.hex}}"
theme[net_box]="{{colors.outline.default.hex}}"
theme[proc_box]="{{colors.outline.default.hex}}"
theme[div_line]="{{colors.outline_variant.default.hex}}"
theme[temp_start]="{{colors.secondary.default.hex}}"
theme[temp_mid]="{{colors.primary.default.hex}}"
theme[temp_end]="{{colors.error.default.hex}}"
theme[cpu_start]="{{colors.secondary.default.hex}}"
theme[cpu_mid]="{{colors.primary.default.hex}}"
theme[cpu_end]="{{colors.error.default.hex}}"
theme[free_start]="{{colors.secondary.default.hex}}"
theme[free_mid]=""
theme[free_end]="{{colors.secondary_container.default.hex}}"
theme[cached_start]="{{colors.tertiary.default.hex}}"
theme[cached_mid]=""
theme[cached_end]="{{colors.tertiary_container.default.hex}}"
theme[available_start]="{{colors.primary.default.hex}}"
theme[available_mid]=""
theme[available_end]="{{colors.primary_container.default.hex}}"
theme[used_start]="{{colors.error.default.hex}}"
theme[used_mid]=""
theme[used_end]="{{colors.error_container.default.hex}}"
theme[download_start]="{{colors.secondary.default.hex}}"
theme[download_mid]="{{colors.primary.default.hex}}"
theme[download_end]="{{colors.tertiary.default.hex}}"
theme[upload_start]="{{colors.secondary.default.hex}}"
theme[upload_mid]="{{colors.primary.default.hex}}"
theme[upload_end]="{{colors.tertiary.default.hex}}"
'';
}
