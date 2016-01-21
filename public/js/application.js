$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 

});


$(document).ready(function(){
    $("#spinner").bind("ajaxSend", function() {
        $(this).show();
    }).bind("ajaxStop", function() {
        $(this).hide();
    }).bind("ajaxError", function() {
        $(this).hide();
  });
 
 });

$(document).ready(function(){
    $('#submit').click(function() {
        $('#spinner').show();
    });
});

// function loadtweets(){
   
//     $("#tweets").append("
//       <% @tweets.each do |tweet| %>
//         <p><%= tweet.tuit %></p>
//       <% end %>");
    
// }