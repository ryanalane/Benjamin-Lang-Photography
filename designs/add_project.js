(function() {
  $(function() {
    var add_project, new_proj_input, new_proj_li, place_cursor_in_new_project_field;
    new_proj_input = $('#new_proj_input');
    new_proj_li = $('#new_proj_li');
    place_cursor_in_new_project_field = function() {
      return new_proj_input.focus();
    };
    $('#add_project_a').click(function() {
      window.show(new_proj_li);
      return place_cursor_in_new_project_field();
    });
    add_project = function(project_name) {
      var new_project_li, old_last_li;
      new_project_li = $('#stock_empty_project_li').clone(true);
      new_project_li.removeAttr('id');
      new_project_li.removeClass('invisible');
      new_project_li.find('img').removeClass('invisible');
      new_project_li.find('.nav_a').html(project_name);
      old_last_li = $('#new_proj_li').prev();
      return $(old_last_li).after(new_project_li);
    };
    return $(new_proj_input).keypress(function(e) {
      if (e.which === 13) {
        window.hide(new_proj_li);
        new_proj_li.blur();
        add_project($(this).val());
        $(this).val('');
        return false;
      }
    });
  });
}).call(this);
