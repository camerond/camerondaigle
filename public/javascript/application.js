$(function() {
  $("#article_show img").each(function() {
    var $img = $(this);
    $img.parent('p').addClass('image').append($img.attr('alt'));
  });
  
  // $(window).resize(function() {
  //   var $f = $("footer");
  //   var wh = $(this).height();
  //   console.log(wh + ' ' + $("#content").outerHeight())
  //   var h = wh > $("#content").outerHeight() ?
  //     wh - $f.outerHeight() - $('header').outerHeight() : 'auto';
  //   console.log(h)
  //   $("#wrapper").height(h);
  // 
  // }).trigger("resize");

});