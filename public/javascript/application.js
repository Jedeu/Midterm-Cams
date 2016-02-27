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


  $("#power-on").on("click", function(e){
    e.stopPropagation();
    // console.log("The user id is ", $(this).data("current-user-id"));
    var userId = $(this).data("current-user-id")
    $.post("/go_online", {user_id: userId}, function(data){ 
      if (data.online) {
        $(this).addClass("user-offline");
        $("#user-status-tag").removeClass("online");
        $("#user-status-tag").addClass("offline");
        $("#user-status-tag").html("OFFLINE").addClass("smallz");

      } else {
        $(this).addClass("user-online");
        $("#user-status-tag").removeClass("offline");
        $("#user-status-tag").addClass("online");
        $("#user-status-tag").html("ONLINE").addClass("smallz");
      }
    });
  });

});



