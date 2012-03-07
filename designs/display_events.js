(function() {
  $(function() {
    var hide_proj_display, show_proj_display, side_nav_lis, toggle_proj_display;
    show_proj_display = function(li) {
      var proj_display;
      proj_display = $(li).find('img.proj_display');
      return proj_display.removeClass('hidden');
    };
    hide_proj_display = function(li) {
      var proj_display;
      proj_display = $(li).find('img.proj_display');
      return proj_display.addClass('hidden');
    };
    toggle_proj_display = function(proj_display) {
      var a, img, li;
      li = $(proj_display).parents('li');
      a = li.children('a.nav_a');
      img = $(proj_display).children('img.proj_display');
      if (a.hasClass('hidden_project')) {
        a.removeClass('hidden_project');
        return $(img).attr('src', img_path_prefix + full_circle_filename);
      } else {
        a.addClass('hidden_project');
        return $(img).attr('src', img_path_prefix + empty_circle_filename);
      }
    };
    side_nav_lis = $('#side_nav_list > li:not("#new_proj_li")');
    side_nav_lis.mouseover(function() {
      return show_proj_display(this);
    });
    side_nav_lis.mouseout(function() {
      return hide_proj_display(this);
    });
    return side_nav_lis.each(function() {
      var proj_display_a;
      proj_display_a = $(this).find('a.proj_display_a');
      return proj_display_a.click(function() {
        return toggle_proj_display(this);
      });
    });
  });
}).call(this);
