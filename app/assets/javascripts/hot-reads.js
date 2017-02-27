$(document).ready(function(){

  $.ajax({
    url: 'https://salty-journey-86577.herokuapp.com/api/v1/reads',
    method: 'GET'
  }).then( addTitles )
    .fail( hotReadsFail )
});

function addTitles(hotReads) {
  var urls = [];
  for (var i = 0; i < hotReads.length; i++) {
    urls.push(hotReads[i].url)
  }

  $('#links-list .link').each(function(){
    if ($(this).children('.link-url').html() == urls[0]) {
      $(this).prepend("<h3>TOP LINK</h3>")
    } else if ($.inArray($(this).children('.link_url').html(), urls) == -1) {
      $(this).prepend("<h3>REGULAR LINK</h3>")
    } else {
      $(this).prepend("<h3>HOT LINKS</h3>")
    }
  });
}

function hotReadsFail(){
  console.log("something went wrong");
}
