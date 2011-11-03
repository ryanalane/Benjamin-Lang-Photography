(function() {
  $(function() {
    var add_new_project_field, place_cursor_in_new_project_field;
    add_new_project_field = function() {
      var new_proj_li;
      new_proj_li = $('#new_proj_li');
      return new_proj_li.removeClass('hidden');
    };
    place_cursor_in_new_project_field = function() {
      return new_proj_input.focus();
    };
    return $('#new_project_link_a').click(function() {
      add_new_project_field();
      return place_cursor_in_new_project_field();
    });
  });
}).call(this);
