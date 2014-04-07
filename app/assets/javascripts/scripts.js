function initialize() {
  $('.new').click(function(){
    $('.hide_buttons').hide();
    $('.hidden_form').show();
  });
}


$(document).ready(initialize);
$(document).on('page:load', initialize);
