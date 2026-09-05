{ config, pkgs, ...}: {
xdg.configFile."matugen/config.toml".text = ''
[config]
[templates.spicetify_colorful]
input_path = '~/.config/matugen/templates/spicetify-colorful.ini'
output_path = '~/.config/spicetify/Themes/Colorful/color.ini'
post_hook = 'spicetify apply -q --no-restart'
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
}
