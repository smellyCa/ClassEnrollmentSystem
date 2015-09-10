$(document).ready(function(){
	var delay=document.getElementById("time").innerHTML;
	for(var i=delay;i>=0;i--){
		setTimeout("doUpdate("+i+")",(delay-i)*1000);
	}
});
function doUpdate(delay){	 
	if(delay>0){ 
		delay--;  
		document.getElementById("time").innerHTML=delay; 	
	} 
	else{  
		window.top.location.href="web/Register.jsp" ;  
	} 
}