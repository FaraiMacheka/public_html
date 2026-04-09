(function ($) {
  "use strict";

  if (!$ || !$.fn) {
    return;
  }

  $(function () {
    var $form = $("#contactForm");
    if (!$form.length) {
      return;
    }

    $form.find("input, textarea").jqBootstrapValidation();
  });
})(window.jQuery);
