$(document).ready(function(){
  var hotReads;

  $.ajax({
    url: 'https://salty-journey-86577.herokuapp.com/api/v1/reads',
    method: 'GET'
  }).then( setHotReads )
    .fail( hotReadsFail )
});

function setHotReads(data){
  hotReads = data;
  addTitles();
}

function addTitles() {
  var urls = [];
  for (var i = 0; i < hotReads.length; i++) {
    urls.push(hotReads[i].url)
  }
  var hottest = urls[0]

  $('#links-list .link').each(function(){
    var thisUrl = $(this).children('.link-url').html()
    if ($.trim(thisUrl) == $.trim(hottest)) {
      $(this).children('.link-type').html("<h3>TOP LINK</h3>")
    } else if ($.inArray($.trim(thisUrl), urls) == -1) {
      $(this).children('.link-type').html("<h3>REGULAR LINK</h3>")
    } else {
      $(this).children('.link-type').html("<h3>HOT LINK</h3>")
    }
  });
}

function hotReadsFail(){
  console.log("something went wrong");
}
