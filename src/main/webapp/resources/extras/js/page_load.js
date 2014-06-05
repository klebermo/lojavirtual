function load_content(lista, target){
	var atributos = [];
	
	$(".col").each(function(){
		var property = $(this).data('property');
		atributos.push(property);
		console.log('property = '+property);
	});
	
	var url = lista;
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.item, function(index, item){
			var row = $('<tr id='+item.id+'>');
			var counter = 0;
			
			for(var i=0; i<atributos.length; i++) {
				if(atributos[i] == '#') {
					row.append('<td></td>');
				}
				else if(atributos[i] == '') {
				    var col = $('<td>');
				    $(".comando").each(function(){
					    	var nome = $(this).data("nome");
					    	var action = $(this).data("action");
					    	col.append('<button type="button" class="btn btn-sm btn-primary link" data-action="'+action+'/'+item.id+'">'+nome+'</button>');
				    });
				    row.append(col);
				}
				else {
					var token = item[atributos[i]];
					row.append('<td>'+token+'</td>');
				}
			}
			
			target.find("tbody.content").append(row);
			target.find("tfoot").hide();
			counter++;
		});
	});
}
