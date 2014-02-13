$(document).ready(function(){
	$("#question_option_type").change(function(){
	  if($(this).val() == '0') {
	    $("#text_field_option").show();
	    $("#singlechoice").show();
	    $("#multiplechoice").hide();
	    $("#descriptive_choice").hide();
	  }
	  else if($(this).val() == '1') {
      $("#text_field_option").show();
      $("#multiplechoice").show();
      $("#singlechoice").hide();
      $("#descriptive").hide();
    }
	  else if($(this).val() == '2') {
      $("#descriptive_choice").show();
      $("#text_field_option").hide();
      $("#multiplechoice").hide();
      $("#singlechoice").hide();
    }
	  else {
	    $("#text_field_option").hide();
	    $("#singlechoice").hide();
	    $("#multiplechoice").hide();
	    $("#descriptive_choice").hide();
	  }
	})
})