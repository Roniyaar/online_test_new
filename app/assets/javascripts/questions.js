$(document).ready(function(){
  $("#question_option_type").on('change', function(){
    var option_value = $(this).val();
    $.ajax({url: "/questions/choices", data: 'option='+option_value});
  });
});