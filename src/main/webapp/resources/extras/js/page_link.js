$( ".dialog" ).dialog({
	  autoOpen: false,
	  closeOnEscape: true,
	  closeText: "fechar",
	  show: {
	    effect: "fadeIn",
	    duration: 1000
	  },
	  hide: {
	    effect: "fadeOut",
	    duration: 1000
	  },
	  close: function( event, ui ) {
		  //
	  }
});
    	
function open(url) {
	$.ajax({
		type: "GET",
		url: url
	}).done(function( data ) {
		var $temp  = $('<div/>', {html:data});
		var titulo = $temp.find('title').text();
		var conteudo = $temp.remove('head').html();
		$("#titulo").empty();
		$("#conteudo").empty();
		$("#titulo").text(titulo);
		$("#conteudo").html(conteudo);
		$("#content").show();
	});
}

function open_dialog(url, dialog_div, func) {
	$.ajax({
		type: "GET",
		url: url
	}).done(function(data){
		var $temp  = $('<div/>', {html:data});
		var text = $(dialog_div).find('#text');
        $( dialog_div ).dialog({ title: $temp.find('title').text() });
        $( text ).html($temp.remove('head').html());
        $( dialog_div ).dialog({ height: 720 });
        $( dialog_div ).dialog({ width: 720 });
        $( dialog_div ).dialog( "open" );
        $( dialog_div ).on( "dialogclose", function( event, ui ) {
        	func();
        });
	});
}
  
$(document).on('click', '.link', function (event) {
	event.preventDefault();
	var action = $(this).data('action');
	open(action);
});

$(document).on('click', '.popup', function (event) {
	event.preventDefault();
	var action = $(this).attr('href');
	var target = $(this).data('target');
	var func = $(this).data('function');
	var div = $("#"+target);
	open_dialog(action, div, func);
});

$(document).on('click', '.pagina', function(event){
	event.preventDefault();
    var link = $(this).attr('href');
    open(link);
});
