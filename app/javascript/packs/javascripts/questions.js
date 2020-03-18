$(document).ready(function() {
  const rotateCreateQuestion = () => {
    $('#create-question__icon').animate({  borderSpacing: 180 }, {
      step: function(now,fx) {
        $(this).css('transform','rotate('+now+'deg)');  
      },
      duration:'slow'
    },'linear');
  }

  setTimeout(rotateCreateQuestion, 500);
});
