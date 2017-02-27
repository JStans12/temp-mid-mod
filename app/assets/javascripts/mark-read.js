$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    var linkUrl = $this.parents('.link').children('.link-url').html();

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    }).then( markRead )
      .fail( readFail )

    $.ajax({
      url: "https://salty-journey-86577.herokuapp.com/api/v1/reads",
      method: "POST",
      headers: {url: linkUrl }
    }).then( hotlinksSuccess )
      .fail( hotlinksFail )
  })
})

function markRead(link){
  $('#links-list #link-' + link.id + ' .link-read').html("true");
  $('#links-list #link-' + link.id + '').css('background-color', 'lightgrey');
  $('#links-list #link-' + link.id + ' .link_buttons').html(
    '<button class="mark-unread">Mark as Unread</button>' +
    "<button class='edit-link'>Edit</button>" +
    "<button class='delete-link'>Delete</button>"
  );
}

function hotlinksSuccess(){
  console.log("hot links success");
}

function hotlinksFail(){
  console.log("hot links fail");
}

function readFail(err){
  console.log("something went wrong");
}
