function md5() {
	var senha = $(this).val();
	$("input[name=senha").val($.md5(senha));
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

function tokens(subject) {
	var regex = /{(\d+)}/g;
	var group1Caps = [];
	var match = regex.exec(subject);

	// put Group 1 captures in an array
	while (match != null) {
		if( match[1] != null ) group1Caps.push(match[1]);
	    match = regex.exec(subject);
	}
	
	// Task 3: What is the length?
	var counter = 0;
	if (group1Caps.length > 0) {
	   for (key in group1Caps) counter += parseInt(group1Caps[key]);
	   }
	
	return counter;
}

function makeArray(count, content) {
   var result = [];
   if(typeof(content) == "function") {
      for(var i=0; i<count; i++) {
         result.push(content(i));
      }
   } else {
      for(var i=0; i<count; i++) {
         result.push(content);
      }
   }
   return result;
}

function template(subject) {
	var myArray = [];
	
	var regex = /{(\d+)}/g;
	var group1Caps = [];
	var match = regex.exec(subject);

	while (match != null) {
		if( match[1] != null ) group1Caps.push(match[1]);
	    match = regex.exec(subject);
	}
	
	if (group1Caps.length > 0) {
		for (key in group1Caps) {
			var tam = parseInt(group1Caps[key]);
			myArray.push(makeArray(tam, "_"));
		};
	};
	
	return myArray;
}

$(document).on(".valida", "onfocus", function(e){
	e.preventDefault();
	var regex = $(this).attr("pattern");
	if(regex == null)
		return true;
	
	var tam = length(regex);
	var conteudo = makeArray(tam, "_");
	
	do {
		var key = which;
		if(key != "") {
			conteudo.push(key);
			$(this).val(conteudo++);
		}
	} while(counter < tam);
});

