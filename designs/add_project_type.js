(function() {
  $(function() {
    var add_project_type, new_proj_type_input, new_proj_type_li;
    new_proj_type_input = $('#new_proj_type_input');
    new_proj_type_li = $('#new_proj_type_li');
    $('#add_project_type_a').click(function() {
      window.show(new_proj_type_li);
      return new_proj_type_input.focus();
    });
    add_project_type = function(project_type_name) {
      var next_project_type, old_last_project_type;
      next_project_type = $('#stock_empty_project_type_li').clone(true);
      next_project_type.removeAttr('id');
      next_project_type.removeClass('invisible');
      next_project_type.find('.nav_a').html(project_type_name);
      old_last_project_type = $('#new_proj_type_li').prev();
      return $(old_last_project_type).after(next_project_type);
    };
    return $(new_proj_type_input).keypress(function(e) {
      if (e.which === 13) {
        window.hide(new_proj_type_li);
        add_project_type($(this).val());
        $(this).val('');
        return false;
      }
    });
  });
}).call(this);
