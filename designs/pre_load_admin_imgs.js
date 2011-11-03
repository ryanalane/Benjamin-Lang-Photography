(function() {
  $(function() {
    window.img_path_prefix = 'images/';
    window.full_circle_filename = 'full_circle_c1.png';
    window.empty_circle_filename = 'empty_circle_c1.png';
    return $([img_path_prefix + full_circle_filename, img_path_prefix + empty_circle_filename]).preload();
  });
}).call(this);
