$(function(){
  $('.upvotes').on('click', (e) => {
    let node = null;
    if (e.target.className != 'upvotes'){
      node = e.target.parentNode.childNodes[1]
    }else{
      node = e.target.childNodes[1]
    }
    $(node).animate({
      opacity: [0, 'swing'],
      marginBottom: ["50px", 'swing']
    }, 200, () => {
      $(node).animate({
        marginBottom: ["0px", 'swing']
      }, 250, () => {
        $(node).animate({
          opacity: [100, 'swing'],
        }, 350);
      });
    });
    $(node).unbind();
  })
})