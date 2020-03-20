$('#user-actions__dropdown-toggle').click(function(e){
  // Kill click event:
  e.stopPropagation();
  // Toggle dropdown if not already visible:
  if ($('.dropdown').find('.dropdown-menu').is(":hidden")){
    $('.dropdown-toggle').dropdown('toggle');
  }
});
