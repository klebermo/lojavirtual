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
  
$(document).on('click', '.link', function (event) {
	event.preventDefault();
	var action = $(this).data('action');
	open(action);
});

$(document).on('click', '.pagina', function(event){
	event.preventDefault();
    var link = $(this).attr('href');
    open(link);
});
