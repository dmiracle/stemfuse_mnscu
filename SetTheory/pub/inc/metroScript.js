/** 
	metroScript.js.
	@VERSION:	1
*/ 

/* 
	This Script works with metroStyle.css and metrosStyleIE8.css
*/

/****************** SECTION ONE**************************/

//Show or Hide ".toTop" Div depending on the pageContainer height

/*	@AUTHORS: 	Mathew Nyamagwa, Robert "Bob" Bilyk and Tuyen Le
	@FOR: 		Metropolitan State University, 
				Center for Online Learning,
	@LMS: 		Desire2Learn v10
	@DATE: 		12/13/2012
*/

$(document).ready(function(){
	$('.toTop').hide();
	var pageContainerHeight = parseInt($('#pageContainer').css('height'));//Getting the height of pageContainer Div
	
		//if pageContainer Div is longer that 800px then the .toTop Div appears
		if (pageContainerHeight >= 800){
			$('.toTop').show();
		}else  {
			$('.toTop').hide();
 }
})

//checking for the printDiv div, adding if it is missing -- added by Owen Hansen 2/11/2016


$(document).ready(function() {
	
	if (!$('#printDiv').length){
        $('body').prepend('<div style="margin-left: 15px;" align="left" id="printDiv"><input width="32" height="32" onclick="window.print(); return false;" type="image" alt="Print" title="Print" src="/shared/images/icons/print.png" /></div>');
    }
	
  
});

//allowing full screen for embedded videos in content pages

window.parent.document.querySelector('iframe').setAttribute('allowfullscreen',true);
/****************** END OF SECTION ONE**********************/