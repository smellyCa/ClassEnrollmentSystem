function addChoose(id,course,teacher,classroom,day,time){
	$('.input_num').remove();
	$('.chosen1').append('<input type=\"text\" class=\"input_num\" name=\"id\" readonly=\"readonly\" value=\"'+id+'"/>');
	$('.chosen2').append('<input type=\"text\" class=\"input_num\" name=\"course\" readonly=\"readonly\" value=\"'+course+'"/>');
	$('.chosen3').append('<input type=\"text\" class=\"input_num\" name=\"teacher\" readonly=\"readonly\" value=\"'+teacher+'"/>');
	$('.chosen4').append('<input type=\"text\" class=\"input_num\" name=\"classroom\" readonly=\"readonly\" value=\"'+classroom+'"/>');
	$('.chosen5').append('<input type=\"text\" class=\"input_num\" name=\"day\" readonly=\"readonly\" value=\"'+day+'"/>');
	$('.chosen6').append('<input type=\"text\" class=\"input_num\" name=\"time\" readonly=\"readonly\" value=\"'+time+'"/>');
//	$('.chosen1').text(id);
//	$('.chosen2').text(course);
//	$('.chosen3').text(teacher);
//	$('.chosen4').text(classroom);
//	$('.chosen5').text(day);
//	$('.chosen6').text(time);
}