$(document).ready(function(){
  $('#links-list .link').each(function(){
    var color = 'white';
    if ($(this).data("read") == true) {
      color = 'lightgrey'
    }
    $(this).css('background-color', color)
  });
});
