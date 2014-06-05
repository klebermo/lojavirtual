function load_content(lista, target){
	var atributos = [];
	target.find("thead.header").each(function(){
		var temp = $(this).text();
		console.log(temp);
		atributos.push(temp);
	});
	
	var url = lista;
	$.get(url, function(data){
		var json = jQuery.parseJSON( data );
		$.each(json.item, function(index, item){
			var row = $('<tr id=user'+item.id+'>');
			
			for(var i=0; i<atributos.length; i++) {
				if(atributos[i] == '#') {
					row.append('<td></td>');
				}
				else if(atributos[i] == '') {
				    var col = $('<td>');
				    target.find("tfoot.actions").each(function(){
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
		});
	});
}
