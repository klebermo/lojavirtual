
function md5() {
	var senha = $(this).val();
	$("input[name=senha]").val($.md5(senha));
};

function length(subject) {
	var regex = /{(\d+)}/g;
	var group1Caps = [];
	var match = regex.exec(subject);

	// put Group 1 captures in an array
	while (match != null) {
		if( match[1] != null ) group1Caps.push(match[1]);
	    match = regex.exec(subject);
	}

	// Task 2: How many tokens are there?
	return group1Caps.length;
}

function getCharacter(content, pos) {
	var res = str.match(content);
	var c = res.substring(pos, pos+1);
	return c;
}

function getType(content) {
	if(typeof(content) == "number") {
		var retorno = "number";
		return retorno;
	} else if (typeof(content) == "string") {
		if(content.match("^[A-Za-z]+$")) {
			var retorno = "letter";
			return retorno;
		}
		else {
			var retorno = "symbol";
			return retorno;
		}
	} else {
		return null;
	}
}

function makeArray(count, content) {
	   var result = [];
	   if(typeof(content) == "function") {
	      for(var i=0; i<count; i++) {
	         result.push(content(i));
	      }
	   } else {
	      for(var i=0; i<count; i++) {
	    	  var c = getCharacter(content, i);
	    	  if(getType(c) == "symbol") {
	    		  result.push(c);
	    	  }
	    	  else {
	    		  result.push("_");
	    	  }
	      }
	   }
	   return result;
	}

$(document).on(".valida", "onfocus", function(e){
	e.preventDefault();
	
	var regex = $(this).attr("pattern");
	if(regex == null)
		return true;
	
	var texto = [];
	var counter = length(regex);
	texto = makeArray(counter, regex);
	
	var index = 0;
	while(index < counter) {
		var key = which;
		if(getType(key) == getType(getCharacter(regex, index))) {
			texto[index++] = key;
			$(this).val(texto);
		}
	}
});

