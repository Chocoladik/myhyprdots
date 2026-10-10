{ config, pkgs, ... }: {
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

    [templates.browser]
    input_path = '~/.config/matugen/templates/firefox-colors.css'
    output_path = '~/.config/zen/10fbz8qq.Default Profile/chrome/colors.css'

    [templates.obsidian]
    input_path = '~/.config/matugen/templates/obsidian.css'
    output_path = '~/Documents/TUHH/.obsidian/snippets/matugen.css'
  '';

  xdg.configFile."matugen/templates/spicetify-colorful.ini".text = ''
    [matugen]
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

  xdg.configFile."spicetify/Themes/Colorful/user.css".text = ''
    :root,
    .encore-dark-theme,
    .encore-base-set,
    .encore-inverted-light-set {
      --background-highlight: rgba(var(--spice-rgb-highlight), 0.25) !important;
    }
    .main-nowPlayingBar-container {
      background-color: var(--background-base);
      border-radius: 0.5rem;
      padding: 0.5rem;
      color: var(--spice-text);
    }
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

  xdg.configFile."matugen/templates/firefox-colors.css".text = ''
    :root {
    <* for name, value in colors *>
      --{{name}}: {{value.default.hex}};
    <* endfor *>
    <* for name, value in colors *>
      --{{name}}_rgb: {{value.default.red}} {{value.default.green}} {{value.default.blue}};
    <* endfor *>
    }
  '';

  xdg.configFile."zen/10fbz8qq.Default Profile/chrome/userContent.css".text = ''
    @import url("/home/aktire/.config/zen/10fbz8qq.Default Profile/chrome/colors.css");
    @import url("/home/aktire/.config/zen/10fbz8qq.Default Profile/chrome/github.css");
    @import url("/home/aktire/.config/zen/10fbz8qq.Default Profile/chrome/youtube.css");
  '';

  xdg.configFile."zen/10fbz8qq.Default Profile/chrome/github.css".text = ''
    @-moz-document domain("github.com") {
        :root {
            --bgColor-default: var(--background) !important;
            --bgColor-muted: var(--surface_container_low) !important;
            --bgColor-inset: var(--surface_container_lowest) !important;
            --bgColor-emphasis: var(--surface_bright) !important;

            /* Borders */
            --borderColor-default: var(--outline_variant) !important;
            --borderColor-muted: var(--outline_variant) !important;
            --borderColor-emphasis: var(--outline) !important;

            /* Text Colors */
            --fgColor-default: var(--on_surface) !important;
            --fgColor-muted: var(--on_surface_variant) !important;
            --fgColor-accent: var(--primary) !important;

            /* Buttons */
            --button-primary-bgColor-rest: var(--primary) !important;
            --button-primary-fgColor-rest: var(--on_primary) !important;
            --button-primary-bgColor-hover: var(--primary_fixed_dim) !important;
            --button-primary-bgColor-active: var(--primary_fixed) !important;
            --button-primary-borderColor-rest: var(--outline_variant) !important;

            --button-default-bgColor-rest: var(--surface_container_high) !important;
            --button-default-fgColor-rest: var(--on_surface) !important;
            --button-default-bgColor-hover: var(--surface_bright) !important;
            --buttonCounter-default-bgColor-rest: var(--surface_container_highest) !important;

            --bgColor-accent-emphasis: var(--primary) !important;
            --borderColor-accent-emphasis: var(--primary) !important;
            --bgColor-accent-muted: var(--primary_container) !important;
            --borderColor-accent-muted: var(--primary_container) !important;

            /* Looks kinda bad in issues but here if you want it */
            /* --bgColor-success-emphasis: var(--tertiary) !important; */
            /* --fgColor-success: var(--tertiary) !important; */

            --bgColor-danger-emphasis: var(--error) !important;
            --fgColor-danger: var(--error) !important;
            --button-danger-fgColor-rest: var(--error) !important;
            --button-danger-bgColor-hover: var(--error_container) !important;

            --bgColor-attention-emphasis: var(--secondary) !important;
            --borderColor-attention-muted: var(--secondary_container) !important;

            --control-checked-bgColor-rest: var(--primary) !important;
            --control-checked-bgColor-hover: var(--primary_fixed_dim) !important;
            --control-checked-bgColor-active: var(--primary_fixed) !important;

            /* Star button */
            --button-star-iconColor: var(--primary) !important;

            /* Hovered button color */
            --control-bgColor-active: var(--surface_container_highest) !important;

            /* Profile popout color */
            --overlay-bgColor: var(--surface_container) !important;
        }
    }
  '';

  xdg.configFile."zen/10fbz8qq.Default Profile/chrome/youtube.css".text = ''
    @-moz-document domain("youtube.com") {

        :root, [dark], [light] {
            --yt-spec-base-background: var(--background) !important;
            --yt-spec-raised-background: var(--surface_container) !important;
            --yt-spec-general-background-a: var(--background) !important;
            --yt-spec-general-background-b: var(--surface_container_low) !important;
            --yt-spec-general-background-c: var(--surface_container_lowest) !important;
            --yt-spec-menu-background: var(--surface_container) !important;
            --yt-spec-text-primary: var(--on_surface) !important;
            --yt-spec-text-secondary: var(--on_surface_variant) !important;
            --yt-icon-color: var(--on_surface) !important;
            --yt-spec-icon-active-other: var(--primary) !important;
            --yt-spec-red-indicator: var(--primary) !important;
            --yt-spec-icon-inactive: var(--outline) !important;
            --yt-spec-brand-background-solid: var(--primary) !important;
            --yt-spec-brand-icon-active: var(--primary) !important;
            --yt-spec-static-brand-red: var(--primary) !important;
            --yt-spec-call-to-action: var(--primary) !important;
            --yt-spec-10-percent-layer: var(--surface_variant) !important;
            --yt-spec-badge-chip-background: var(--surface_container_high) !important;
            --yt-spec-button-chip-background-hover: var(--surface_bright) !important;
            --yt-saturated-raised-background: var(--surface_container) !important;
            --t3e41d7b17b187f69: var(--background) !important; /* General background */
            --t518e925f61bdcb91: var(--surface_container) !important;
            --t2d807bb79e75606d: var(--primary) !important;
            --t6216186c28b3834b: var(--on_primary) !important;
            --t617db776af0de196: var(--primary) !important;
            --t08a7c6c176cbc5c2: var(--surface_container) !important;
        }

        /* Sidebar / Navigation */
        #guide-content.ytd-app,
        ytd-guide-renderer,
        #contentContainer.app-drawer,
        .style-scope ytd-two-column-browse-results-renderer,
        .style-scope ytd-rich-grid-renderer,
        .style-scope ytd-feed-filter-chip-bar-renderer {
            background-color: var(--background) !important;
        }

        /* Progress bar */
        .ytp-play-progress.ytp-swatch-background-color,
        .ytp-play-progress,
        .yt-play-progress {
            background-image: linear-gradient(to right, var(--primary) 80%, var(--primary) 100%) !important;
            background-color: transparent !important;
        }

        .ytp-scrubber-button.ytp-swatch-background-color {
            background-color: var(--secondary) !important;
        }

        /* YouTube Logo Color */
        #logo-icon svg g path[fill^="#ff"],
        #logo-icon svg g path[fill^="#FF"],
        ytd-logo svg g path[fill^="#ff"],
        .ytd-logo svg g path[fill^="#FF"],
        #logo-icon path.style-scope.ytd-logo[fill="#FF0000"],
        #logo-icon path.style-scope.ytd-logo[fill="#ff0000"] {
            fill: var(--primary) !important;
        }

        #logo-icon [fill="white"],
        .ytd-logo [fill="white"] {
            fill: var(--on_primary) !important;
        }

        #logo-icon path[fill="#212121"],
        #logo-icon path[fill="#fff"],
        .yt-icon-shape path[fill="#fff"] {
            fill: var(--on_surface) !important;
        }

        .ytp-volume-slider-handle:before {
            background: var(--primary) !important;
        }

        /* Notification Badges */
        .yt-spec-icon-badge-shape--type-notification .yt-spec-icon-badge-shape__badge {
            background-color: var(--primary) !important;
            color: var(--on_primary) !important;
        }


        /* Search Bar */
        .ytSearchboxComponentInputBox {
            background-color: var(--surface_container) !important;
            color: var(--on_surface_container) !important;
        }

        .ytSearchboxComponentInputBox.ytSearchboxComponentInputBoxHasFocus {
            border-color: var(--primary) !important;
        }

        .ytSearchboxComponentSearchButton {
            background-color: var(--primary) !important;
            color: var(--on_primary) !important;
        }

        /* Header + Top Bar + Chip background */
        #masthead-container.ytd-app,
        #background.ytd-masthead,
        ytd-feed-filter-chip-bar-renderer[frosted-glass-mode="with-chipbar"] #chips-wrapper.ytd-feed-filter-chip-bar-renderer,
        ytd-mini-guide-entry-renderer[frosted-glass],
        ytd-mini-guide-renderer[frosted-glass] {
            background-color: var(--background) !important;
            color: var(--on_background) !important
        }


        /* Buttons */
        ytd-button-renderer.style-primary {
            --yt-spec-button-chip-background-hover: var(--primary_container) !important;
        }

        /* Live Chat + Comments */
        ytd-live-chat-frame#chat {
            border: 1px solid var(--outline_variant) !important;
            border-radius: 12px !important;
        }

        /* Primary Buttons */
        ytd-button-renderer.style-primary .yt-spec-button-shape-next--filled {
            background-color: var(--primary) !important;
            color: var(--on_primary) !important;
        }

        ytd-button-renderer.style-primary:hover .yt-spec-button-shape-next--filled {
            background-color: var(--primary_fixed_dim) !important;
        }

        /* Tonal/Secondary Buttons */
        .yt-spec-button-shape-next--tonal,
        .yt-spec-touch-feedback-shape--touch-response .yt-spec-touch-feedback-shape__fill {
            background-color: var(--secondary_container) !important;
            color: var(--on_secondary_container) !important;
        }

        .yt-spec-button-shape-next--tonal:hover,
        .yt-spec-touch-feedback-shape--touch-response .yt-spec-touch-feedback-shape__fill:hover {
            background-color: var(--secondary_fixed_dim) !important;
            color: var(--on_secondary_fixed_variant) !important;
        }

        /* Community posts */
        ytd-post-renderer {
        	background-color: var(--surface_container) !important;
    		border: 1px solid var(--outline_variant) !important;
    		color: var(--on_surface_container) !important;
        }

        /* Dropdowns */
        ytd-multi-page-menu-renderer {
    	    background: var(--surface_container) !important;
    	    color: var(--on_surface_container) !important;
        }

        /* Search box */
        .ytSearchboxComponentSuggestionsContainer {
        	background-color: var(--surface_container) !important;
    		color: var(--on_surface_container) !important;
        }

        /* The "Subscribe" button */
        /* Disabled because it looks kinda bad to me */
        /* #subscribe-button .yt-spec-button-shape-next--filled {
            background-color: var(--primary) !important;
        } */

        /* #subscribe-button:hover .yt-spec-button-shape-next--filled {
            background-color: var(--primary_fixed) !important;
            filter: brightness(1.1) !important;
        } */
    }
  '';

  xdg.configFile."matugen/templates/obsidian.css".text = ''
      /* Matugen Obsidian Dynamic Colors Snippet
     * Place output in: <vault>/.obsidian/snippets/matugen.css
     * Then enable it in: Settings → Appearance → CSS Snippets
     */

    .theme-dark, .theme-light {

        /* ── Material You RGB helpers ──────────────────────────── */
        --mat-bg-rgb:             {{colors.background.default.red}}, {{colors.background.default.green}}, {{colors.background.default.blue}};
        --mat-surface-rgb:        {{colors.surface.default.red}}, {{colors.surface.default.green}}, {{colors.surface.default.blue}};
        --mat-on-surface-rgb:     {{colors.on_surface.default.red}}, {{colors.on_surface.default.green}}, {{colors.on_surface.default.blue}};
        --mat-primary-rgb:        {{colors.primary.default.red}}, {{colors.primary.default.green}}, {{colors.primary.default.blue}};
        --mat-on-primary-rgb:     {{colors.on_primary.default.red}}, {{colors.on_primary.default.green}}, {{colors.on_primary.default.blue}};

        /* ── Core Backgrounds ──────────────────────────────────── */
        --background-primary:           {{colors.background.default.hex}};
        --background-primary-alt:       {{colors.surface_dim.default.hex}};
        --background-secondary:         {{colors.surface_container_low.default.hex}};
        --background-secondary-alt:     {{colors.surface_container.default.hex}};

        /* ── Titlebar ──────────────────────────────────────────── */
        --titlebar-background:          {{colors.surface_dim.default.hex}};
        --titlebar-background-focused:  {{colors.surface_container_low.default.hex}};
        --titlebar-text-color:          {{colors.on_surface.default.hex}};

        /* ── Borders & Dividers ────────────────────────────────── */
        --background-modifier-border:         {{colors.outline_variant.default.hex}};
        --background-modifier-border-focus:   {{colors.outline.default.hex}};
        --background-modifier-border-hover:   {{colors.outline.default.hex}};

        /* ── Text Colors ───────────────────────────────────────── */
        --text-normal:      {{colors.on_surface.default.hex}};
        --text-muted:       {{colors.on_surface_variant.default.hex}};
        --text-faint:       {{colors.outline.default.hex}};
        --text-on-accent:   {{colors.on_primary.default.hex}};
        --text-selection:   rgba({{colors.primary.default.red}}, {{colors.primary.default.green}}, {{colors.primary.default.blue}}, 0.25);

        /* ── Accent & Interactive ──────────────────────────────── */
        --interactive-accent:           {{colors.primary.default.hex}};
        --interactive-accent-hover:     {{colors.primary_container.default.hex}};
        --interactive-accent-rgb:       {{colors.primary.default.red}}, {{colors.primary.default.green}}, {{colors.primary.default.blue}};
        --text-accent:                  {{colors.primary.default.hex}};
        --text-accent-hover:            {{colors.primary_container.default.hex}};

        /* ── Hover & Active Modifiers ──────────────────────────── */
        --background-modifier-hover:          rgba(var(--mat-on-surface-rgb), 0.06);
        --background-modifier-active-hover:   rgba(var(--mat-primary-rgb), 0.15);
        --background-modifier-success:        {{colors.tertiary_container.default.hex}};
        --background-modifier-error:          {{colors.error_container.default.hex}};
        --background-modifier-error-hover:    {{colors.error.default.hex}};

        /* ── Obsidian Color Scale (--color-base-XX) ────────────── */
        --color-base-00:    {{colors.background.default.hex}};
        --color-base-05:    {{colors.surface_dim.default.hex}};
        --color-base-10:    {{colors.surface_container_lowest.default.hex}};
        --color-base-20:    {{colors.surface_container_low.default.hex}};
        --color-base-25:    {{colors.surface_container.default.hex}};
        --color-base-30:    {{colors.surface_container_high.default.hex}};
        --color-base-35:    {{colors.surface_container_highest.default.hex}};
        --color-base-40:    {{colors.outline_variant.default.hex}};
        --color-base-50:    {{colors.outline.default.hex}};
        --color-base-60:    {{colors.on_surface_variant.default.hex}};
        --color-base-70:    {{colors.on_surface.default.hex}};
        --color-base-100:   {{colors.inverse_surface.default.hex}};

        /* ── Semantic Colors ───────────────────────────────────── */
        --color-red:        {{colors.error.default.hex}};
        --color-orange:     {{colors.tertiary.default.hex}};
        --color-yellow:     {{colors.secondary.default.hex}};
        --color-green:      {{colors.tertiary_container.default.hex}};
        --color-cyan:       {{colors.secondary_container.default.hex}};
        --color-blue:       {{colors.primary.default.hex}};
        --color-purple:     {{colors.secondary.default.hex}};
        --color-pink:       {{colors.tertiary.default.hex}};

        /* ── Headings ──────────────────────────────────────────── */
        --h1-color:     {{colors.primary.default.hex}};
        --h2-color:     {{colors.primary.default.hex}};
        --h3-color:     {{colors.secondary.default.hex}};
        --h4-color:     {{colors.tertiary.default.hex}};
        --h5-color:     {{colors.on_surface_variant.default.hex}};
        --h6-color:     {{colors.outline.default.hex}};

        /* ── Links ─────────────────────────────────────────────── */
        --link-color:           {{colors.primary.default.hex}};
        --link-color-hover:     {{colors.on_primary_container.default.hex}};
        --link-external-color:  {{colors.tertiary.default.hex}};
        --link-unresolved-color: {{colors.outline.default.hex}};

        /* ── Tags ──────────────────────────────────────────────── */
        --tag-color:            {{colors.on_primary_container.default.hex}};
        --tag-background:       {{colors.primary_container.default.hex}};
        --tag-border-color:     {{colors.primary.default.hex}};
        --tag-color-hover:      {{colors.on_primary.default.hex}};
        --tag-background-hover: {{colors.primary.default.hex}};

        /* ── Checkboxes ────────────────────────────────────────── */
        --checkbox-color:           {{colors.primary.default.hex}};
        --checkbox-color-hover:     {{colors.primary_container.default.hex}};
        --checkbox-border-color:    {{colors.outline.default.hex}};
        --checkbox-marker-color:    {{colors.on_primary.default.hex}};

        /* ── Code Blocks ───────────────────────────────────────── */
        --code-background:  {{colors.surface_container_low.default.hex}};
        --code-normal:      {{colors.on_surface.default.hex}};
        --code-comment:     {{colors.outline.default.hex}};
        --code-function:    {{colors.primary.default.hex}};
        --code-important:   {{colors.error.default.hex}};
        --code-keyword:     {{colors.secondary.default.hex}};
        --code-operator:    {{colors.tertiary.default.hex}};
        --code-property:    {{colors.on_surface_variant.default.hex}};
        --code-punctuation: {{colors.outline_variant.default.hex}};
        --code-string:      {{colors.tertiary.default.hex}};
        --code-tag:         {{colors.error.default.hex}};
        --code-value:       {{colors.secondary.default.hex}};

        /* ── Scrollbar ─────────────────────────────────────────── */
        --scrollbar-thumb-bg:           rgba(var(--mat-on-surface-rgb), 0.12);
        --scrollbar-active-thumb-bg:    rgba(var(--mat-on-surface-rgb), 0.25);
        --scrollbar-bg:                 transparent;

        /* ── Inputs ────────────────────────────────────────────── */
        --input-shadow: none;
        --input-shadow-hover: 0 0 0 2px {{colors.outline.default.hex}};

        /* ── Graph View ────────────────────────────────────────── */
        --graph-node:           {{colors.primary.default.hex}};
        --graph-node-unresolved: {{colors.outline.default.hex}};
        --graph-node-focused:   {{colors.on_primary_container.default.hex}};
        --graph-node-tag:       {{colors.secondary.default.hex}};
        --graph-node-attachment: {{colors.tertiary.default.hex}};
        --graph-line:           {{colors.outline_variant.default.hex}};
        --graph-background:     {{colors.background.default.hex}};

    }

    /* ── Active line highlight ─────────────────────────────────── */
    .cm-active {
        background-color: rgba(var(--mat-on-surface-rgb), 0.03) !important;
    }
  '';
}
