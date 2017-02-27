$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-unread', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: false}
    }).then( markUnread )
      .fail( readFail )
  })
})

function markUnread(link){
  $('#links-list #link-' + link.id + ' .link-read').html("false");
  $('#links-list #link-' + link.id + '').css('background-color', 'white');
  $('#links-list #link-' + link.id + ' .link_buttons').html(
    '<button class="mark-read">Mark as Read</button>' +
    "<button class='edit-link'>Edit</button>" +
    "<button class='delete-link'>Delete</button>"
  );
}

function readFail(err){
  console.log("something went wrong");
}
