$(document).ready(function(){
  $('.modal-trigger').leanModal();
  $('.tooltipped').tooltip({delay: 50});

  $('#theme-0').click(function(){
    $('body').removeClass();
    $('body').addClass("theme-0");
  });
  $('#theme-1').click(function(){
    $('body').removeClass();
    $('body').addClass("theme-1");
  });
  $('#theme-2').click(function(){
    $('body').removeClass();
    $('body').addClass("theme-2");
  });
  $('#theme-3').click(function(){
    $('body').removeClass();
    $('body').addClass("theme-3");
  });
  $('#theme-4').click(function(){
    $('body').removeClass();
    $('body').addClass("theme-4");
  });
  $('#theme-5').click(function(){
    $('body').removeClass();
    $('body').addClass("theme-5");
  });
  $('#theme-6').click(function(){
    $('body').removeClass();
    $('body').addClass("theme-6");
  });
  $('#theme-7').click(function(){
    $('body').removeClass();
    $('body').addClass("theme-7");
  });

});


// Timer code. s
function pad(val) {
    return val > 9 ? val : "0" + val;
}

var sec = 0;
$('#timer_button').one('click', function(){
  $('#timer_text').replaceWith("<span id=\"minutes\">00</span>:<span id=\"seconds\">00</span>");
  console.log("clicked")
  var timer = setInterval(function () {
    document.getElementById("seconds").innerHTML = pad(++sec % 60);
    document.getElementById("minutes").innerHTML = pad(parseInt(sec / 60, 10));
    console.log(sec);
}, 1000);

});


