$(document).ready(function(){
  $('#read-only').click(function(){
    filterOnlyRead();
  });

  $('#unread-only').click(function(){
    filterOnlyUnread();
  });
});

function filterOnlyRead(){
  var $link = $('.link');

  for (var i = 0; i < $link.length; i++) {
    if ($($link[i]).data("read") == true) {
      $link[i].style.display = "";
    } else {
      $link[i].style.display = "none";
    }
  }
}

function filterOnlyUnread(){
  var $link = $('.link');

  for (var i = 0; i < $link.length; i++) {
    if ($($link[i]).data("read") == false) {
      $link[i].style.display = "";
    } else {
      $link[i].style.display = "none";
    }
  }
}
