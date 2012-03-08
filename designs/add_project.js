(function() {
  $(function() {
    var add_project, new_proj_input, new_proj_li;
    new_proj_input = $('#new_proj_input');
    new_proj_li = $('#new_proj_li');
    $('#add_project_a').click(function() {
      window.show(new_proj_li);
      return new_proj_input.focus();
    });
    add_project = function(project_name) {
      var next_project, old_last_project;
      next_project = $('#stock_empty_project_li').clone(true);
      next_project.removeAttr('id');
      next_project.removeClass('invisible');
      next_project.find('img').removeClass('invisible');
      next_project.find('.nav_a').html(project_name);
      old_last_project = $('#new_proj_li').prev();
      return $(old_last_project).after(next_project);
    };
    return $(new_proj_input).keypress(function(e) {
      if (e.which === 13) {
        window.hide(new_proj_li);
        add_project($(this).val());
        $(this).val('');
        return false;
      }
    });
  });
}).call(this);
