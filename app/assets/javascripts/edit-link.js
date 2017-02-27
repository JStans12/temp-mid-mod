$(document).ready(function(){
  $('.edit-link').click(function(){
    var linkId = $(this).parents('.link').data('id');
    window.location.replace('/links/' + linkId + '/edit');
  })
})
