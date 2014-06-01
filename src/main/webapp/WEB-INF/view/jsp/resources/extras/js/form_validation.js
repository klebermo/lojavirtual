function size_of(regex) {
	//
}

function type_of(regex, posicao) {
	//
}

function generate_string(tamanho) {
	//
}

$(document).on('.valida', 'focus', function(){
	var regex = $(this).attr('pattern');
	
	var counter = 0;
	var tam = size_of(regex);
	var str = generate_string(tam);
	
	$(this).val(str);
	
	$(this).keypress(function(event){
		var tecla = e.which;
		
		if(typeof tecla == type_of(regex, counter)){
			str = str + tecla;
			counter++;
		}
		
		$(this).val(str);
	});
});
