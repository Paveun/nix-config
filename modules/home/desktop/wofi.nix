{
  flake.modules.homeManager.wofi =
    { pkgs, ... }:
    {
      programs.wofi = {
        enable = true;

        settings = {
          width = 600;
          height = 350;
          location = "center";
          show = "drun";
          prompt = "Search...";
          filter_rate = 100;
          allow_markup = true;
          no_actions = true;
          halign = "fill";
          orientation = "vertical";
          content_halign = "fill";
          insensitive = true;
          allow_images = true;
          image_size = 40;
          gtk_dark = true;
        };

        style = ''
          * {
            font-family: 'CaskaydiaMono Nerd Font', monospace;
            font-size: 18px;
          }

          window {
            margin: 0px;
            padding: 20px;
            background-color: #1e1e2e;
          }

          #inner-box {
            margin: 0;
            padding: 0;
            border: none;
            background-color: #1e1e2e;
          }

          #outer-box {
            margin: 0;
            padding: 20px;
            border: none;
            background-color: #1e1e2e;
          }

          #scroll {
            margin: 0;
            padding: 0;
            border: none;
            background-color: #1e1e2e;
          }

          #input {
            margin: 0;
            padding: 10px;
            border: none;
            background-color: #1e1e2e;
            color: @text;
          }

          #input:focus {
            outline: none;
            box-shadow: none;
            border: none;
          }

          #text {
            margin: 5px;
            border: none;
            color: #f5e0dc;
          }

          #entry {
            background-color: #1e1e2e;
          }

          #entry:selected {
            outline: none;
            border: none;
          }

          #entry:selected #text {
            color: #313244;
          }

          #entry image {
            -gtk-icon-transform: scale(0.7);
          }
        '';
      };
    };
}
