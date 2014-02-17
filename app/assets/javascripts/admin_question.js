$("#question_category_type").on('change', function(){
  var option_value = $(this).val();
  alert(option_value)
  $.ajax({url: "/admin/questions/choices", data: 'option='+option_value});
})