$(function() {

  $("#article_show img").each(function() {
    var $img = $(this),
        $p = $img.closest('p'),
        $figure = $("<figure />").insertBefore($p).html($p.html());
    $("<figcaption />").appendTo($figure).text($img.attr('alt'));
    $p.remove();
  });

});