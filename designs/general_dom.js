(function() {
  $(function() {
    window.show = function(element) {
      return element.removeClass('hidden');
    };
    return window.hide = function(element) {
      return element.addClass('hidden');
    };
  });
}).call(this);
