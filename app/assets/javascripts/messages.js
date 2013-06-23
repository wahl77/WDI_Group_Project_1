$(document).ready(function(){
	//alert("Blah");
	$('form#new_message').on("submit", check_text);
	
	function check_text(e){
		text = $('#new_message #message_content').val();
		console.log(text)
		if (text === ""){
			alert("We are not in the business of sending blank messages");
			return false
			e.preventDefault();
		}
	}

});