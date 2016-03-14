$(document).ready(function() {
  $('body').on('click', ".faved", function(e) {
    // pass in the e (the event paramater)
    e.preventDefault();
  var fav = $('.faved-off')
   //ajax handle the rest then
  $.ajax({
    type: "POST",
    url: "favs/"+this.id,
      success: function(data) {
      console.log(data);
    //change the color of your heart to red here
      },
      error: function(jqXHR) {
      console.error(jqXHR.responseText);
      }
    });
  });
});
