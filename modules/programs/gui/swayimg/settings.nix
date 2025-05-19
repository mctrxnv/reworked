{
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;

{
  general = {
    mode = "viewer";
    position = "parent";
    size = "fullscreen";
    sigusr1 = "reload";
    sigusr2 = "next_file";
    app_id = "swayimg";
  };

  viewer = {
    window = "#000000" + "ff";
    transparency = "grid";
    scale = "optimal";
    fixed = "yes";
    antialiasing = "none";
    slideshow = "no";
    slideshow_time = "3";
    history = "5";
    preload = "5";
  };

  gallery = {
    size = "400";
    cache = "100";
    fill = "yes";
    antialiasing = "box";
    window = base00 + "ff";
    background = base01 + "ff";
    select = base02 + "ff";
    border = base0E + "ff";
    shadow = base00 + "a0";
  };

  list = {
    order = "alpha";
    loop = "yes";
    recursive = "no";
    all = "yes";
  };

  font =
    let
      font = config.stylix.fonts;
    in
    {
      name = font.monospace.name;
      size = toString (font.sizes.applications + 2);
      color = base06 + "ff";
      shadow = base00 + "a0";
    };

  info = {
    show = "yes";
    info_timeout = "1";
    status_timeout = "1";
  };

  "info.viewer" = {
    top_left = "+name,+imagesize";
    top_right = "index";
    bottom_left = "status";
    bottom_right = "scale";
  };

  "info.gallery" = {
    top_left = "none";
    top_right = "index";
    bottom_left = "none";
    bottom_right = "none";
  };

  "keys.viewer" = {
    F1 = "help";
    "Space" = "mode";
    Return = "mode";
    "Delete" = ''exec trash put "%"; skip_file'';
    "Shift+Delete" = ''exec rm "%"; skip_file'';
    Home = "first_file";
    g = "first_file";
    End = "last_file";
    "Shift+g" = "last_file";
    "Shift+Space" = "next_file";
    Next = "next_file";
    Prior = "prev_file";
    j = "next_file";
    k = "prev_file";
    "0" = "zoom real";
    Equal = "zoom +10";
    Plus = "zoom +10";
    Minus = "zoom -10";
    w = "zoom width";
    "Shift+w" = "zoom height";
    z = "zoom fit";
    "Shift+z" = "zoom fill";
    h = "zoom +10";
    l = "zoom -10";
    Left = "step_left 10";
    Right = "step_right 10";
    Up = "step_up 10";
    Down = "step_down 10";
    bracketleft = "rotate_left";
    bracketright = "rotate_right";
    m = "flip_vertical";
    "Shift+m" = "flip_horizontal";
    f = "fullscreen";
    a = "antialiasing";
    r = "reload";
    i = "info";
    q = "exit";
    Escape = "exit";
    "Ctrl+ScrollUp" = "zoom +10";
    "Ctrl+ScrollDown" = "zoom -10";
    "Shift+ScrollUp" = "prev_file";
    "Shift+ScrollDown" = "next_file";
  };

  "keys.gallery" = {
    F1 = "help";
    Space = "mode";
    Return = "mode";
    Home = "first_file";
    g = "first_file";
    End = "last_file";
    "Shift+g" = "last_file";
    Left = "step_left";
    Right = "step_right";
    Up = "step_up";
    Down = "step_down";
    h = "step_left";
    j = "step_down";
    k = "step_up";
    l = "step_right";
    Prior = "page_up";
    Next = "page_down";
    f = "fullscreen";
    a = "antialiasing";
    r = "reload";
    i = "info";
    q = "exit";
    Escape = "exit";
    "Delete" = ''exec trash put "%"; skip_file'';
    "Shift+Delete" = ''exec rm "%"; skip_file'';
    ScrollUp = "page_up";
    ScrollDown = "page_down";
  };
}
