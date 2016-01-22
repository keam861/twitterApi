$(document).ready(function() {
  spiner();
  loadTweets();
  tweet();
});

function spiner() {
    $('#submit').click(function() {
        $('#spinner').show();
    });
}

function hideSpin() {
    $('#spinner').hide();
}

function loadTweets() {
   $('#begin').submit(function() {
    event.preventDefault();
      value = getInput("Tname").value;   
      url = "/" + value
      $.get( url, function( data ) {
      $("div#tweets").html(data);
      hideSpin();
    });
   });
}

function getInput(input) {
   return document.getElementById(input);
}

function postOutPut() {
  $("#message").html("Tweet Successful");
}

function tweet() {
// =========================pseudocode=========================
  // post '/tweet' do
  //   # Recibe el input del usuario

  //   # Crea el tweet utilizando la API de Twitter

  //   # Regresa al usuario el tweet o un mensaje de EXITO o ERROR
  // end
  $('#tweet').submit(function() {
    event.preventDefault();
      value = getInput("twee").value; 
      if (value != "") {
        url = "/" + value
        $.post( url, function( data ) {
        // console.log("this should tweet :");
        // console.log(typeof value);
        // console.log("data :");
        // console.log(data =="");
        $("#message").html("Tweet Successfully created");
         
        });
       
      } else {
        $("#message").html("You should write a tweet");
      };  
  });
}