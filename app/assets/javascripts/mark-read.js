var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    }).then( updateLink )
      .fail( readFail )
  })
})

function updateLink(link){
  $('#links-list #link-' + link.id + ' .link-read').html("true");
  $('#links-list #link-' + link.id + ' .link_buttons').html(
    '<button class="mark-unread" style="text-decoration: line-through;">Mark as Unread</button>' +
    "<button class='edit-link'>Edit</button>" +
    "<button class='delete-link'>Delete</button>"
  );
}

function readFail(err){
  console.log("something went wrong")
}
