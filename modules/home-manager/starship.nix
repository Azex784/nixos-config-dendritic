{ self, inputs, ... }: {

  flake.modules.homeManager.starship = { pkgs, lib, ... }: {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;

      settings =
      let
        # Blue
        colorBack = "bold #0087FF";
        # Green
        colorMain = "bold #50FF64";
        # Red
        colorError = "bold #FF0000";
      in
      {
          format = "[┌──\\(](${colorBack})$username[@](${colorBack})$hostname[\\)\\[](${colorBack})$time[\\]\\[](${colorBack})$directory[\\]](${colorBack})$git_branch$cmd_duration$status$line_break[└](${colorBack})[> ](${colorBack})";

          username = {
            show_always = true;
            style_user = colorMain;
            format = "[$user]($style)";
          };

          hostname = {
            ssh_only = false;
            style = colorMain;
            format = "[$hostname]($style)";
          };

          time = {
            disabled = false;
            time_format = "%H:%M:%S";
            format = "[$time]($style)";
            style = colorMain;
          };

          directory = {
            style = colorMain;
            format = "[$path]($style)";
            truncation_length = 0;
          };

          git_branch = {
            format = "[<](${colorBack})[$branch](${colorMain})[>](${colorBack})";
          };

          cmd_duration = {
            min_time = 1000;
            format = "[ \\($duration\\)](${colorBack})";
          };

          status = {
            disabled = false;
            format = "[ \\($status\\)](${colorError})";
          };

        };
    };
  };
}
