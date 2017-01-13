
var color = " ";
$(document).ready(function() {
   $('div').mouseenter(function() {
	   $(this).animate({
		   height: '+=10px'
	   });
   });
   $('div').mouseleave(function() {
	   $(this).animate({
		   height: '-=10px'
	   }); 
   });
   $('div').click(function() {
	   if(document.getElementById('name2').value!="Enter your name") 
       {
       		$(this).toggle(1000);
	   		color = (this).id;
	   		document.getElementById('colorBar').style.background = color;
	   		document.getElementById('color').value = color;
        	document.getElementById('add').disabled = false;
        	$(this).remove;
       }
	   else if (document.getElementById('name').value===null) 
	   {
	   		document.getElementById('add').disabled = true;
	   }
   }); 
});

