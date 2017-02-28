$(document).ready(function(){
  $('#filter').keyup(function(){
    filter();
  })
})

function filter() {

  var $filter = $('#filter');
  var keyword = $filter.val().toUpperCase();
  var $list = $('#links-list');
  var $link = $('.link')

  for (var i = 0; i < $link.length; i++) {
    var url = $($link[i]).children('.link-url').html()
    var title = $($link[i]).children('.link-title').html()
    if ( url.toUpperCase().indexOf(keyword) > -1 ||
         title.toUpperCase().indexOf(keyword) > -1 )
       {
         $link[i].style.display = "";
       } else {
         $link[i].style.display = "none";
       }
  }
}
