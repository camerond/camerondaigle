$(function() {

  $("#article_show img").each(function() {
    var $img = $(this);
    $img.parent('p').addClass('image').append($img.attr('alt'));
  });

});