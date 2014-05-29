$(document).on('submit', '.form', function (event) {
	// Stop form from submitting normally
	console.log("start of submission");
	event.preventDefault();

	// Get some values from elements on the page:
	var $form = $( this ),
	url = $form.attr( "action" );

	// Send the data using post
	var posting = $.post( url, $(this).serialize() );

	// Put the results in a div
	posting.done(function( data ) {
		console.log(data);
		$("#"+data).show();
		
		$(".form").each (function(){
			this.reset();
		});
	});
});
