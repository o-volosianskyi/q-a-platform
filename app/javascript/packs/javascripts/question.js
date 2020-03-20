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
  });
});

var toolbarOptions = [
  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
  ['blockquote', 'code-block'],

  [{ 'header': 1 }, { 'header': 2 }],               // custom button values
  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
  [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
  [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
  [{ 'direction': 'rtl' }],                         // text direction

  [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
  [{ 'font': [] }],
  [{ 'align': [] }],

  ['clean']                                         // remove formatting button
];

$(document).ready((params) => {
  var quill = new Quill('#create-answer', {
    modules: {
      toolbar: toolbarOptions
    },
    theme: 'snow'
  });

  $('#create-answer__button').on('click', () => {
    const text = document.getElementById('create-answer').firstChild.innerHTML
    const question_id = document.getElementById("question_id").getAttribute("value")
    createAnswer(text, question_id);
  })

  async function createAnswer(text, question_id) {
    await animateProgress(0);
    $.ajax({
      url: "/answers",
      type: "post",
      data: {
        text: text,
        question_id: question_id
      },
      success: function(data) {
        alert("success")
      },
      error: function(data) {
        $(".create-answer__footer").addClass("create-answer__footer--with-error")
        $('#create-answer__progress').addClass('d-none');
        $("#create-answer__progress-bar").css("width", 0);    
        $("#create-answer__error").removeClass('d-none');
        let error = JSON.stringify(data.responseText).match("summary:(.*)resolution")[1].replace(/\\n/g, "")
        $("#create-answer__error").append(`<br/> (${error})`)
      }
    }); 
  }

  const animateProgress = (start) => {
    return new Promise(resolve => {
      $('#create-answer__progress').removeClass('d-none');
      let interval = setInterval(() => {
        start+=10
        $("#create-answer__progress-bar").css("width", start)
        if ($("#create-answer__progress-bar").css("width")==$("#create-answer__progress").css("width")) {
          resolve()
          clearInterval(interval)
        }
      }, 10);
    });
  }
});
