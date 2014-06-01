function parse(regexString){
    var regex = /((?!\[|\{).(?!\]|\}))|(?:\[([^\]]+)\]\{(\d+)\})/g,
        match,
        model = [];
    while (match = regex.exec(regexString)) {
        if(typeof match[1] == 'undefined'){
            for(var i=0;i<match[3];i++){
                model.push(match[2]);
            }
        }else{
            model.push(match[1]);
        }
    }
    return model;
}

function replaceAt(s, n, t) {
    return s.substring(0, n) + t + s.substring(n + 1);
}

function size_of(regex) {
	var parsedRegexp = parse(regex);
	return parsedRegexp.length;
}

function type_of(regex, posicao) {
	var parsedRegexp = parse(regex);
	var pos = parsedRegexp[posicao];
	
	if(pos == '0-9')
		return 'number';
	
	if(pos == 'A-Z' || pos == 'a-z')
		return 'string';
	
	return pos;
}

function generate_string(regex, tamanho) {
	var str = '';
	
	for(var i=0; i<tamanho; i++) {
		var type = type_of(regex, i);
		if(type == 'number' || type == 'string')
			str = str + '_';
		else
			str = str + type;
	}
	
	return str;
}

var counter;
var tam;
var str;
var regex;

$('.valida').each(function(){
    
    $(this).on('focus', function(e){
        regex = $(this).attr('pattern');
        
        counter = 0;
        tam = size_of(regex);
        str = generate_string(regex, tam);
        
        $(this).val(str);
    });
    
    $(this).on('keypress', function(e){
        e.preventDefault();
        
        var tecla = e.which;
        
        if(tecla >= 48 && tecla <= 57)
            var tecla2 = tecla - 48;
        else
            var tecla2 = String.fromCharCode(tecla);
        
        result = $("<div>");
        result.append( "tecla = "+tecla+"<br>" );
        
        var t = type_of(regex, counter);
        
        if(counter < tam) {
            if(t != 'number' && t != 'string') {
                str = replaceAt(str, counter, t);
                counter++;
            }
            
            t = type_of(regex, counter);
            
            if(typeof tecla2 == t) {
                result.append( "tecla2 = "+tecla2+"<br>" );
                str = replaceAt(str, counter, tecla2);
                counter++;
            }
        }
        
        result.append( "counter = "+counter+"<br>" );
        $("#result").empty().append(result);
        
        $(this).val(str);
    });
    
});
