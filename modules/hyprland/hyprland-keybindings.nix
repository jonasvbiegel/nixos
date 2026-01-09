{pkgs, ...}: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, RETURN, exec, $term"
      "$mod, d, exec, $menu"
      "$mod, b, exec, librewolf"

      "$mod SHIFT, Q, killactive"
      "$mod SHIFT, M, exit"

      "$mod, h, movefocus, l"
      "$mod, j, movefocus, d"
      "$mod, k, movefocus, u"
      "$mod, l, movefocus, r"

      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, j, movewindow, d"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, l, movewindow, r"

      "$mod, f, fullscreen"

      "$mod SHIFT, R, submap, resize"

      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      "$mod SHIFT, 1, movetoworkspacesilent, 1"
      "$mod SHIFT, 2, movetoworkspacesilent, 2"
      "$mod SHIFT, 3, movetoworkspacesilent, 3"
      "$mod SHIFT, 4, movetoworkspacesilent, 4"
      "$mod SHIFT, 5, movetoworkspacesilent, 5"
      "$mod SHIFT, 6, movetoworkspacesilent, 6"
      "$mod SHIFT, 7, movetoworkspacesilent, 7"
      "$mod SHIFT, 8, movetoworkspacesilent, 8"
      "$mod SHIFT, 9, movetoworkspacesilent, 9"
      "$mod SHIFT, 0, movetoworkspacesilent, 10"

      "$mod SHIFT, s, exec, ${pkgs.hyprshot}/bin/hyprshot -m region --clipboard-only"
      " , Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m output --clipboard-only"
    ];

    binde = [
      "$mod, right, resizeactive, 20 0"
      "$mod, left, resizeactive, -20 0"
      "$mod, up, resizeactive, 0 -20"
      "$mod, down, resizeactive, 0 20"

      " , XF86AudioRaiseVolume, exec, pamixer --increase 5"
      " , XF86AudioLowerVolume, exec, pamixer --decrease 5"
      " , XF86AudioMute, exec, pamixer --toggle-mute"

      " , XF86MonBrightnessUp, exec, brightnessctl set +10%"
      " , XF86MonBrightnessDown, exec, brightnessctl set 10-%"

      " , XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
      " , XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
      " , XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl prev"
    ];
  };
}
