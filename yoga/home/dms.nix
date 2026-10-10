{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms-plugin-registry.nixosModules.default
  ];
  systemd.user.services.dms.Service.Environment = [
    "YDOTOOL_SOCKET=/run/user/1000/ydotool_socket"
  ];
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
      fullscreenPowerMenu.enable = true;
      systemMonitorPlus.enable = true;
      openrgbThemeSync.enable = true;
    };
  };

  xdg.configFile."DankMaterialShell/settings.json".text = ''
      {
      "lockScreenWidgetInstances": [
        {
          "id": "lock_clock",
          "widgetType": "desktopClock",
          "enabled": true,
          "config": {
            "displayPreferences": [
              {
                "name": "eDP-1",
                "model": "0x303D"
              }
            ],
            "syncPositionAcrossScreens": true,
            "style": "expressive",
            "transparency": 0,
            "weight": 0,
            "twoTone": true,
            "showDate": false,
            "showDigitalSeconds": false,
            "showAnalogNumbers": false,
            "showAnalogSeconds": true,
            "autoPosition": true,
            "colorMode": "default",
            "customColor": "#ffffff",
            "fontFamily": ""
          }
        },
        {
          "id": "lock_date",
          "widgetType": "lockDate",
          "enabled": true,
          "config": {
            "displayPreferences": [
              "all"
            ],
            "syncPositionAcrossScreens": true,
            "format": "long",
            "colorMode": "default",
            "customColor": "#ffffff"
          }
        },
        {
          "id": "lock_auth",
          "widgetType": "lockAuth",
          "enabled": true,
          "config": {
            "displayPreferences": [
              "all"
            ],
            "syncPositionAcrossScreens": true,
            "style": "ring",
            "profileVisibility": "typing",
            "passwordVisibility": "typing"
          }
        },
        {
          "id": "lock_notifications",
          "widgetType": "lockNotifications",
          "enabled": false,
          "config": {
            "displayPreferences": [
              "all"
            ],
            "syncPositionAcrossScreens": true,
            "mode": 2
          }
        },
        {
          "id": "lock_status",
          "widgetType": "lockStatus",
          "enabled": true,
          "config": {
            "displayPreferences": [
              "all"
            ],
            "syncPositionAcrossScreens": true,
            "showMediaPlayer": false,
            "showWeather": false,
            "background": true
          }
        },
        {
          "id": "lock_power",
          "widgetType": "lockPower",
          "enabled": true,
          "config": {
            "displayPreferences": [
              "all"
            ],
            "syncPositionAcrossScreens": true,
            "shape": "cookie9"
          }
        }
      ],
      "greeterWidgetInstances": [
        {
          "id": "lock_clock",
          "widgetType": "desktopClock",
          "enabled": true,
          "config": {
            "displayPreferences": [
              {
                "name": "eDP-1",
                "model": "0x303D"
              }
            ],
            "syncPositionAcrossScreens": true,
            "style": "expressive",
            "transparency": 0,
            "weight": 0,
            "twoTone": true,
            "showDate": false,
            "showDigitalSeconds": false,
            "showAnalogNumbers": false,
            "showAnalogSeconds": true,
            "autoPosition": true,
            "colorMode": "default",
            "customColor": "#ffffff",
            "fontFamily": ""
          }
        },
        {
          "id": "lock_date",
          "widgetType": "lockDate",
          "enabled": true,
          "config": {
            "displayPreferences": [
              "all"
            ],
            "syncPositionAcrossScreens": true,
            "format": "long",
            "colorMode": "default",
            "customColor": "#ffffff"
          }
        },
        {
          "id": "lock_auth",
          "widgetType": "lockAuth",
          "enabled": true,
          "config": {
            "displayPreferences": [
              "all"
            ],
            "syncPositionAcrossScreens": true,
            "style": "ring",
            "profileVisibility": "typing",
            "passwordVisibility": "typing"
          }
        },
        {
          "id": "lock_status",
          "widgetType": "lockStatus",
          "enabled": true,
          "config": {
            "displayPreferences": [
              "all"
            ],
            "syncPositionAcrossScreens": true,
            "showMediaPlayer": false,
            "showWeather": false,
            "background": true
          }
        },
        {
          "id": "lock_power",
          "widgetType": "lockPower",
          "enabled": true,
          "config": {
            "displayPreferences": [
              "all"
            ],
            "syncPositionAcrossScreens": true,
            "shape": "cookie9"
          }
        },
        {
          "id": "greeter_session",
          "widgetType": "greeterSession",
          "enabled": true,
          "config": {
            "displayPreferences": [
              "all"
            ],
            "syncPositionAcrossScreens": true
          }
        }
      ],
      "currentThemeName": "dynamic",
      "radiusStrength": 41,
      "clockFormat": "24h",
      "showSeconds": true,
      "animationDuration": 500,
      "enableRippleEffects": false,
      "popoutElevationEnabled": false,
      "blurBorderColor": "secondary",
      "wallpaperBackgroundColorMode": "surface",
      "fontFamily": "Google Sans Flex Medium",
      "monoFontFamily": "JetBrains Mono",
      "textRenderType": 1,
      "textRenderQuality": 4,
      "lockScreenShowPowerActions": true,
      "lockScreenShowWeather": false,
      "lockScreenFontFamily": "Notable",
      "powerActionConfirm": false,
      "powerMenuActions": [
        "poweroff",
        "reboot",
        "suspend"
      ],
      "powerMenuDefaultAction": "poweroff",
      "powerMenuGridLayout": true,
      "dockConfigs": [
        {
          "id": "dock",
          "name": "Dock",
          "enabled": false,
          "screenPreferences": [
            "all"
          ],
          "showOnLastDisplay": true,
          "position": 1,
          "mode": "compact",
          "taskbarAlign": "center",
          "widgetExpansion": "popout",
          "iconSize": 40,
          "spacing": 4,
          "itemSpacing": 4,
          "margin": 0,
          "bottomGap": 0,
          "transparency": 1,
          "followInterfaceStyle": true,
          "autoHide": false,
          "smartAutoHide": false,
          "useOverlayLayer": false,
          "editOnRightClick": false,
          "showOnFullscreen": false,
          "openOnOverview": false,
          "groupByApp": false,
          "separatePinnedAndRunningApps": false,
          "restoreSpecialWorkspaceOnClick": false,
          "isolateDisplays": false,
          "indicatorStyle": "circle",
          "borderEnabled": false,
          "borderColor": "surfaceText",
          "borderOpacity": 1,
          "borderThickness": 1,
          "launcherEnabled": false,
          "launcherLogoMode": "apps",
          "launcherLogoCustomPath": "",
          "launcherLogoColorOverride": "",
          "launcherLogoSizeOffset": 0,
          "launcherLogoBrightness": 0.5,
          "launcherLogoContrast": 1,
          "maxVisibleApps": 0,
          "maxVisibleRunningApps": 0,
          "showOverflowBadge": true,
          "showTrash": false,
          "trashFileManager": "default",
          "trashCustomCommand": "",
          "magnification": false,
          "magnificationScale": 130,
          "magnificationProfile": "parabolic",
          "magnificationExpand": false,
          "order": [],
          "widgets": [
            {
              "id": "dock_launcher",
              "widgetId": "dockLauncher",
              "enabled": true
            },
            {
              "id": "dock_apps",
              "widgetId": "appsDock",
              "enabled": true
            },
            {
              "id": "dock_trash",
              "widgetId": "dockTrash",
              "enabled": true
            }
          ]
        }
      ],
      "currentThemeCategory": "dynamic",
      "matugenSpec": "2025",
      "generateThemeAtStartup": false,
      "dmsWindowsFloatingSeeded": [
        "hyprland"
      ],
      "widgetColorMode": "colorful",
      "firstDayOfWeek": 1,
      "windSpeedUnit": "ms",
      "popoutAnimationDuration": 300,
      "modalAnimationDuration": 300,
      "motionEffect": 2,
      "m3ElevationEnabled": false,
      "m3ElevationOpacity": 33,
      "barElevationEnabled": false,
      "blurWallpaperOnOverview": true,
      "systemTrayIconTintMode": "monochrome",
      "controlCenterWidgets": [
        {
          "enabled": true,
          "id": "wifi",
          "w": 4,
          "h": 1.5,
          "col": 0,
          "row": 0
        },
        {
          "enabled": true,
          "id": "bluetooth",
          "w": 4,
          "h": 1.5,
          "col": 4,
          "row": 0,
          "small": false
        },
        {
          "enabled": true,
          "id": "audioOutput",
          "w": 2,
          "h": 1,
          "col": 0,
          "row": 1.5
        },
        {
          "enabled": true,
          "id": "audioInput",
          "w": 2,
          "h": 1,
          "col": 2,
          "row": 1.5
        },
        {
          "enabled": true,
          "id": "doNotDisturb",
          "w": 4,
          "h": 1,
          "col": 0,
          "row": 2.5
        },
        {
          "id": "plugin_dankKDEConnect",
          "enabled": true,
          "w": 2,
          "h": 1,
          "col": 4,
          "row": 1.5,
          "small": false
        },
        {
          "id": "plugin_quickCapture",
          "enabled": true,
          "w": 4,
          "h": 1,
          "col": 4,
          "row": 2.5
        },
        {
          "id": "nightMode",
          "enabled": true,
          "w": 2,
          "h": 1,
          "col": 6,
          "row": 1.5,
          "small": false
        },
        {
          "id": "user",
          "enabled": true,
          "w": 1,
          "h": 1,
          "col": 4,
          "row": 3.5,
          "footerW": 1,
          "footerFill": true,
          "background": true,
          "badge": true,
          "hostname": true,
          "compositor": true,
          "footer": true,
          "footerEnd": true
        },
        {
          "id": "edit",
          "enabled": true,
          "w": 1,
          "h": 1,
          "small": false,
          "col": 4,
          "row": 0,
          "footerW": 1,
          "footer": true,
          "footerEnd": true
        },
        {
          "id": "lock",
          "enabled": true,
          "w": 1,
          "h": 1,
          "small": false,
          "col": 4.5,
          "row": 4,
          "footerW": 1,
          "footer": true,
          "footerEnd": true
        },
        {
          "id": "power",
          "enabled": true,
          "w": 1,
          "h": 1,
          "small": false,
          "col": 3.5,
          "row": 4,
          "footerW": 1,
          "footer": true,
          "footerEnd": true
        },
        {
          "enabled": true,
          "id": "brightnessSlider",
          "w": 8,
          "h": 1,
          "col": 0,
          "row": 5,
          "footerW": 4,
          "footer": true
        }
      ],
      "scrollTitleEnabled": false,
      "audioWheelScrollAmount": 2,
      "appIdSubstitutions": [],
      "centeringMode": "geometric",
      "clockDateFormat": "ddd d",
      "appLauncherGridColumns": 5,
      "spotlightSectionViewModes": {
        "apps": "grid",
        "settings": "list"
      },
      "appDrawerSectionViewModes": {
        "apps": "grid"
      },
      "dankLauncherV2ShowSourceBadges": false,
      "dankLauncherV2BorderEnabled": true,
      "dankLauncherV2BorderColor": "secondary",
      "dashTabsEvenlySpaced": false,
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
        },
        {
          "id": "wellbeing",
          "enabled": false
        },
        {
          "id": "notifications",
          "enabled": false
        }
      ],
      "dashOptions": {
        "media": {
          "albumArtAccent": false,
          "lyrics": false,
          "albumArtBackdrop": false,
          "deviceName": false
        },
        "wallpaper": {
          "filename": false,
          "panelColumns": 5
        }
      },
      "networkPreference": "ethernet",
      "iconThemeDark": "Adwaita",
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
      "matugenTemplateNeovimSettings": {
        "dark": {
          "baseTheme": "material-darker",
          "harmony": 0.5
        },
        "light": {
          "baseTheme": "material-lighter",
          "harmony": 0.5
        }
      },
      "notificationOverlayEnabled": true,
      "notificationPopupShadowEnabled": false,
      "notificationPopupBodyInvokesAction": true,
      "lockScreenPowerOffMonitorsOnLock": true,
      "notificationTimeoutLow": 3000,
      "notificationCompactMode": true,
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
      "updaterIntervalSeconds": 1382023168,
      "updaterIncludeFlatpak": false,
      "screenPreferences": {
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
        },
        "dot1791282181276": {
          "shadowIntensity": 0,
          "squareCorners": false,
          "attachToScreenEdge": false,
          "gothCornersEnabled": false,
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
              "id": "workspaceSwitcher",
              "workspaceFollowFocus": true,
              "showOccupiedWorkspacesOnly": true,
              "workspaceIndicatorStyle": "pills",
              "workspaceIndicatorCompact": false,
              "showSpecialWorkspaces": false
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
              "clockCompactMode": false,
              "clockNotificationBadge": false
            },
            {
              "id": "music",
              "enabled": true,
              "mediaSize": 1,
              "mediaShowCoverArt": false,
              "mediaShowLyrics": false
            },
            {
              "enabled": true,
              "id": "launcherButton",
              "launcherLogoMode": "os",
              "launcherLogoColorOverride": "primary"
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
          "rightWidgets": [
            {
              "id": "systemTray",
              "enabled": true,
              "trayUseInlineExpansion": true,
              "trayMaxVisibleItems": 0,
              "overflowMode": "always",
              "trayAutoOverflow": true
            },
            {
              "enabled": true,
              "id": "clipboard",
              "overflowMode": "always"
            },
            {
              "enabled": true,
              "id": "keyboard_layout_name",
              "keyboardLayoutNameCompactMode": false,
              "keyboardLayoutNameShowIcon": false,
              "overflowMode": "bar"
            },
            {
              "id": "dankPomodoroTimer",
              "enabled": true
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
              "showBatteryPowerDischarging": true,
              "overflowMode": "bar"
            },
            {
              "enabled": true,
              "id": "controlCenterButton",
              "showAudioIcon": false,
              "showDoNotDisturbIcon": true,
              "showMicPercent": false,
              "overflowMode": "bar"
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
          "batteryColorMode": "theme",
          "followInterfaceStyle": true,
          "widgetFollowInterfaceStyle": true,
          "widgetStyle": "pills",
          "rightOverflowMode": "bar",
          "centerOverflowMode": "bar",
          "leftOverflowMode": "bar",
          "rightOverflowPosition": 3
        },
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
              "id": "workspaceSwitcher",
              "workspaceFollowFocus": true,
              "showOccupiedWorkspacesOnly": true
            },
            {
              "enabled": true,
              "id": "spacer",
              "size": 200
            }
          ],
          "clickThrough": false,
          "enabled": false,
          "fontScale": 1,
          "gothCornerRadiusOverride": false,
          "gothCornerRadiusValue": 15,
          "gothCornersEnabled": false,
          "hoverPopoutDelay": 150,
          "hoverPopouts": true,
          "iconScale": 1,
          "id": "dot1791282181276",
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
              "id": "launcherButton",
              "launcherLogoMode": "os",
              "launcherLogoColorOverride": "primary"
            },
            {
              "id": "privacyIndicator",
              "enabled": true
            }
          ],
          "maximizeDetection": false,
          "maximizeWidgetIcons": false,
          "maximizeWidgetText": false,
          "name": "Dot",
          "noBackground": false,
          "openOnOverview": false,
          "popupGapsAuto": true,
          "popupGapsManual": 4,
          "position": 2,
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
          "batteryColorMode": "theme",
          "followInterfaceStyle": false,
          "widgetFollowInterfaceStyle": true,
          "island": false,
          "dot": true
        }
      ],
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
        "delete",
        "copy",
        "pin"
      ],
      "frameEnabled": true,
      "frameThickness": 2,
      "frameRounding": 16,
      "frameBarSize": 60,
      "frameBlurEnabled": false,
      "frameLauncherEmergeSide": "top",
      "frameBarInsetPadding": 12,
      "configVersion": 39
    }
  '';
}
