$(document).ready(function(){
  $('.modal-trigger').leanModal();
  $('.tooltipped').tooltip({delay: 50});
  $('select').material_select();
        

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


// Timer code in seconds.
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


// Whent the Power Button in the Nav is clicked it takes the Users is_online
// and changes it to True or False depending if the user is online.
// These changes are saved in the database when the button is clicked.
$("#power-on").on("click", function(x){
  x.stopPropagation();
  // console.log("The user id is ", $(this).data("current-user-id"));
  var userId = $(this).data("current-user-id")
  $.post("/go_online", {user_id: userId}, function(data){ 
    if (data.online) {
      console.log("offline: ", data);
      $(this).addClass("user-offline");
      $("#butt2").removeClass("hidden");
      $("#power-on").removeClass("on");
      $("#power-on").addClass("off");
      $("#user-status-tag").removeClass("online");
      $("#user-status-tag").addClass("offline");
      $("#user-status-tag").html("OFFLINE").addClass("status-text ");
      $("#status-tip").attr("data-tooltip", "Go Online");
      $("#create-room").fadeOut("slow");
    } else {
      console.log("online: ", data);
      $(this).addClass("user-online");
      $("#butt2").removeClass("hidden");
      $("#power-on").removeClass("off");
      $("#power-on").addClass("on");
      $("#user-status-tag").removeClass("offline");
      $("#user-status-tag").addClass("online");
      $("#user-status-tag").html("ONLINE").addClass("status-text ");
      $("#status-tip").attr("data-tooltip", "Go Offline");
      $("#create-room").fadeIn("slow");
    }
  });
});

// When the 'Create Room' button is clicked this runs.
// It changes the User Host value to 'True'.
$("#create-room").on("click", function(x){
  x.stopPropagation();
  console.log("User has hosted: ", $(this).data("host"));
  // var userHost = $(this).data("host")
  $.post("/host_room", function(data){
  console.log("User has hosted: ", data);
  
  });
});

$("#balance-btn").mouseenter(function() {
  $("#balance-btn").html("Load Account");
});

$("#balance-btn").mouseleave(function() {
  $("#balance-btn").html("Account Balance:");
});


});