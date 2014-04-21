$(function() {

  $("#article_show img").each(function() {
    var $img = $(this),
        $p = $img.closest('p'),
        $figure = $("<figure />").insertBefore($p).html($p.html());
    $("<figcaption />").appendTo($figure).text($img.attr('alt'));
    $p.remove();
  });

  var slides = {
    $el : $("#digital_index .slides[data-slides]"),
    createSlides: function() {
      this.$el.each(function() {
        var $container = $(this),
            slides = +$container.attr("data-slides"),
            $first = $container.children().first();
        for (var i=2; i<=slides; i++) {
          $("<img />").attr("src", $first.attr("src").replace(/\d(.jpg)/, i + "$1")).appendTo($container);
        }
      });
    },
    switchSlides: function() {
      var $img = $(this),
          $container = $img.parent().css("min-height", $img.height()),
          $next = $img.next().length ? $img.next() : $container.children().first();
      $img.fadeOut(100, function() {
        $next.fadeIn(200, function() {
          $container.css("min-height", 0);
        });
      });
    },
    init: function() {
      this.createSlides();
      this.$el.on("click", "img", this.switchSlides);
    }
  };

  slides.init();

});
