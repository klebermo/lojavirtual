$(document).on('submit', '.form', function (event) {
	event.preventDefault();

	var $form = $( this ),
	url = $form.attr( "action" );
	
	$('select.lista').find('option.item').each(function(){
        $(this).attr('selected', 'selected');
    });
		
	var posting = $.post( url, $(this).serialize() );
	posting.done(function( data ) {
		$("#"+data).css("display", "block");
		
		if($("#pergunta").is(":visible"))
			$("#pergunta").css("display", "none");
		
		$(".form").each (function(){
			this.reset();
		});
	});
});
