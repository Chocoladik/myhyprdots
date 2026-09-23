{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms-plugin-registry.nixosModules.default
  ];
  systemd.user.services.dms.Service.Environment = ["YDOTOOL_SOCKET=/run/user/$(id -u)/.ydotool_socket"];
  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    plugins = {
      virtualKeyboard.enable = true;
      quickCapture.enable = true;
      dankKDEConnect.enable = true;
      calculator.enable = true;
      emojiLauncher.enable = true;
      dankPomodoroTimer.enable = true;
      hiddenBar.enable = true;
      fullscreenPowerMenu.enable = true;
      systemMonitorPlus.enable = true;
    };
  };  

  xdg.configFile."DankMaterialShell/settings.json".text = '' 
  {
  "currentThemeName": "dynamic",
  "currentThemeCategory": "dynamic",
  "matugenScheme": "scheme-content",
  "cornerRadius": 13,
  "firstDayOfWeek": 1,
  "calendarBackend": "khal",
  "clockFormat": "24h",
  "showSeconds": true,
  "windSpeedUnit": "ms",
  "animationSpeed": 2,
  "customAnimationDuration": 200,
  "syncComponentAnimationSpeeds": false,
  "popoutAnimationSpeed": 2,
  "modalAnimationSpeed": 2,
  "springBounce": 2,
  "animationVariant": 2,
  "motionEffect": 2,
  "m3ElevationEnabled": false,
  "m3ElevationOpacity": 33,
  "popoutElevationEnabled": false,
  "barElevationEnabled": false,
  "blurBorderColor": "secondary",
  "blurWallpaperOnOverview": true,
  "wallpaperBackgroundColorMode": "surface",
  "systemTrayIconTintMode": "monochrome",
  "controlCenterShowMicPercent": true,
  "controlCenterWidgets": [
    {
      "enabled": true,
      "id": "brightnessSlider",
      "width": 100
    },
    {
      "enabled": true,
      "id": "wifi",
      "width": 50
    },
    {
      "enabled": true,
      "id": "bluetooth",
      "width": 50
    },
    {
      "enabled": true,
      "id": "audioOutput",
      "width": 50
    },
    {
      "enabled": true,
      "id": "audioInput",
      "width": 50
    },
    {
      "enabled": true,
      "id": "colorPicker",
      "width": 50
    },
    {
      "enabled": true,
      "id": "doNotDisturb",
      "width": 50
    }
  ],
  "workspaceFollowFocus": true,
  "showOccupiedWorkspacesOnly": true,
  "scrollTitleEnabled": false,
  "audioWheelScrollAmount": 2,
  "focusedWindowShowIcon": false,
  "appIdSubstitutions": [],
  "centeringMode": "geometric",
  "clockDateFormat": "ddd d",
  "spotlightSectionViewModes": {
    "apps": "grid",
    "settings": "list"
  },
  "appDrawerSectionViewModes": {
    "apps": "grid"
  },
  "dankLauncherV2Size": "micro",
  "dankLauncherV2ShowSourceBadges": false,
  "dankLauncherV2BorderEnabled": true,
  "dankLauncherV2BorderColor": "secondary",
  "dashTabs": [
    {
      "id": "overview",
      "enabled": false
    },
    {
      "id": "media",
      "enabled": false
    },
    {
      "id": "weather",
      "enabled": false
    },
    {
      "id": "wallpaper",
      "enabled": false
    },
    {
      "id": "settings",
      "enabled": false
    }
  ],
  "networkPreference": "ethernet",
  "iconThemeDark": "Fluent-dark",
  "launcherLogoMode": "os",
  "launcherLogoColorOverride": "primary",
  "monoFontFamily": "JetBrains Mono",
  "textRenderType": 1,
  "textRenderQuality": 4,
  "soundVolumeChanged": false,
  "acMonitorTimeout": 300,
  "acSuspendTimeout": 1800,
  "batteryMonitorTimeout": 120,
  "batterySuspendTimeout": 1200,
  "batteryCriticalThreshold": 5,
  "batteryNotifyLow": true,
  "batteryLowNotificationType": 1,
  "lockBeforeSuspend": true,
  "fadeToLockEnabled": false,
  "fadeToDpmsGracePeriod": 3,
  "terminalsAlwaysDark": true,
  "matugenTemplateNiri": false,
  "matugenTemplateMangowc": false,
  "matugenTemplateQt5ct": false,
  "matugenTemplateFcitx5": false,
  "matugenTemplateQtengine": false,
  "matugenTemplateFirefox": false,
  "matugenTemplatePywalfox": false,
  "matugenTemplateVesktop": false,
  "matugenTemplateVencord": false,
  "matugenTemplateEquibop": false,
  "matugenTemplateGhostty": false,
  "matugenTemplateFoot": false,
  "matugenTemplateAlacritty": false,
  "matugenTemplateNeovim": true,
  "matugenTemplateWezterm": false,
  "matugenTemplateDgop": false,
  "matugenTemplateVscode": false,
  "matugenTemplateEmacs": false,
  "matugenTemplateZed": false,
  "notificationOverlayEnabled": true,
  "notificationPopupShadowEnabled": false,
  "notificationPopupBodyInvokesAction": true,
  "lockScreenShowTime": false,
  "lockScreenShowDate": false,
  "lockScreenShowProfileImage": false,
  "lockScreenShowPasswordField": false,
  "lockScreenShowWeather": false,
  "lockScreenPowerOffMonitorsOnLock": true,
  "lockScreenFontFamily": "JetBrainsMono Nerd Font",
  "notificationTimeoutLow": 3000,
  "notificationPopupPosition": -1,
  "notificationHistoryMaxCount": 200,
  "notificationHistoryMaxAgeDays": 1,
  "notificationHistorySaveLow": false,
  "notificationRules": [
    {
      "enabled": true,
      "field": "appName",
      "pattern": "zen",
      "matchType": "contains",
      "action": "default",
      "urgency": "normal"
    }
  ],
  "notificationFocusedMonitor": true,
  "osdIdleInhibitorEnabled": false,
  "powerActionConfirm": false,
  "powerMenuActions": [
    "poweroff"
  ],
  "powerMenuDefaultAction": "poweroff",
  "powerMenuGridLayout": true,
  "updaterIntervalSeconds": 1382023168,
  "updaterIncludeFlatpak": false,
  "screenPreferences": {
    "dock": [
      "all"
    ],
    "wallpaper": [
      "all"
    ],
    "toast": [
      "all"
    ],
    "lockScreen": [
      "all"
    ]
  },
  "showOnLastDisplay": {
    "dock": true,
    "toast": false
  },
  "displayProfileAutoSelect": true,
  "connectedFrameBarStyleBackups": {
    "default": {
      "shadowIntensity": 0,
      "squareCorners": true,
      "attachToScreenEdge": false,
      "gothCornersEnabled": true,
      "borderEnabled": false
    }
  },
  "barConfigs": [
    {
      "autoHide": false,
      "autoHideDelay": 250,
      "borderColor": "surfaceText",
      "borderEnabled": false,
      "borderOpacity": 1,
      "borderThickness": 1,
      "bottomGap": 0,
      "centerWidgets": [
        {
          "enabled": true,
          "id": "workspaceSwitcher"
        },
        {
          "enabled": true,
          "id": "spacer",
          "size": 200
        }
      ],
      "clickThrough": false,
      "enabled": true,
      "fontScale": 1,
      "gothCornerRadiusOverride": false,
      "gothCornerRadiusValue": 15,
      "gothCornersEnabled": false,
      "hoverPopoutDelay": 150,
      "hoverPopouts": true,
      "iconScale": 1,
      "id": "default",
      "innerPadding": 5,
      "leftWidgets": [
        {
          "id": "clock",
          "enabled": true,
          "clockCompactMode": false
        },
        {
          "id": "music",
          "enabled": true,
          "mediaSize": 1
        },
        {
          "enabled": true,
          "id": "launcherButton"
        },
        {
          "id": "privacyIndicator",
          "enabled": true
        }
      ],
      "maximizeDetection": false,
      "maximizeWidgetIcons": false,
      "maximizeWidgetText": false,
      "name": "Main Bar",
      "noBackground": false,
      "openOnOverview": false,
      "popupGapsAuto": true,
      "popupGapsManual": 4,
      "position": 2,
      "removeWidgetPadding": false,
      "rightWidgets": [
        {
          "id": "systemTray",
          "enabled": true,
          "trayUseInlineExpansion": true,
          "trayMaxVisibleItems": 0
        },
        {
          "id": "quickCapture",
          "enabled": true
        },
        {
          "id": "dankKDEConnect",
          "enabled": true
        },
        {
          "id": "dankPomodoroTimer",
          "enabled": true
        },
        {
          "enabled": true,
          "id": "clipboard"
        },
        {
          "id": "hiddenBar",
          "enabled": true
        },
        {
          "enabled": true,
          "id": "keyboard_layout_name",
          "keyboardLayoutNameCompactMode": false,
          "keyboardLayoutNameShowIcon": false
        },
        {
          "id": "systemMonitorPlus",
          "enabled": true
        },
        {
          "enabled": true,
          "id": "battery",
          "batteryStyle": "ring",
          "showBatteryPercent": false,
          "showBatteryPowerDischarging": true
        },
        {
          "enabled": true,
          "id": "controlCenterButton",
          "showAudioIcon": false,
          "showDoNotDisturbIcon": true,
          "showMicPercent": false
        },
        {
          "enabled": true,
          "id": "notificationButton"
        }
      ],
      "screenPreferences": [
        "all"
      ],
      "scrollEnabled": false,
      "scrollXBehavior": "column",
      "scrollYBehavior": "workspace",
      "shadowColorMode": "text",
      "shadowCustomColor": "#000000",
      "shadowIntensity": 0,
      "shadowOpacity": 60,
      "showOnLastDisplay": true,
      "showOnWindowsOpen": false,
      "spacing": 0,
      "squareCorners": false,
      "transparency": 1,
      "visible": true,
      "widgetOutlineColor": "primary",
      "widgetOutlineEnabled": false,
      "widgetOutlineOpacity": 1,
      "widgetOutlineThickness": 1,
      "widgetPadding": 8,
      "widgetTransparency": 1,
      "useOverlayLayer": false,
      "batteryColorMode": "theme"
    }
  ],
  "desktopClockCustomColor": {
    "r": 1,
    "g": 1,
    "b": 1,
    "a": 1,
    "hsvHue": -1,
    "hsvSaturation": 0,
    "hsvValue": 1,
    "hslHue": -1,
    "hslSaturation": 0,
    "hslLightness": 1,
    "valid": true
  },
  "systemMonitorCustomColor": {
    "r": 1,
    "g": 1,
    "b": 1,
    "a": 1,
    "hsvHue": -1,
    "hsvSaturation": 0,
    "hsvValue": 1,
    "hslHue": -1,
    "hslSaturation": 0,
    "hslLightness": 1,
    "valid": true
  },
  "builtInPluginSettings": {
    "dms_clipboard_search": {
      "trigger": "cb"
    },
    "dms_settings_search": {
      "trigger": "?"
    },
    "dms_power": {
      "trigger": "pw"
    },
    "dms_qr_generator": {
      "trigger": "qrg"
    }
  },
  "clipboardClickToPaste": true,
  "clipboardEnterToPaste": true,
  "clipboardVisibleEntryActions": [
    "edit",
    "delete",
    "copy"
  ],
  "frameEnabled": true,
  "frameThickness": 2,
  "frameRounding": 16,
  "frameColor": "surface",
  "frameBarSize": 50,
  "frameBlurEnabled": false,
  "frameLauncherEmergeSide": "top",
  "frameBarInsetPadding": 5,
  "configVersion": 18
}
'';
}
