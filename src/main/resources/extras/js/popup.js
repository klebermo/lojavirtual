$( ".dialog" ).dialog({
    autoOpen: false,
    closeOnEscape: true,
    closeText: "fechar",
    height: 720,
    width: 720,
    show: {
      effect: "fadeIn",
      duration: 1000
    },
    hide: {
      effect: "fadeOut",
      duration: 1000
    },
});

// The Class Functionality
var Class;

(function(j) {
    
    var Options = {
            setOptions: function(options) {
                j.extend(true, this.options, options);
            }
        };
    
        Class = function (params) {
            if (params instanceof Function) {
                params = {initialize: params};
            }
            var instance = function() {
                j.extend(true, this, params);
                j.extend(true, this, Options);
    
                if (this.initialize instanceof Function) {
                    this.initialize.apply(this, arguments);
                }
                return this;
            }
    
            j.extend(true, instance, this);
    
            return instance;
        };

})(jQuery);

// The Class Declaration
var myClass = new Class({

    options: {
        title: null,
        text: null,
	id: null,
	container: null
    },

    initialize: function(options)
    {
        this.setOptions(options);
    },

    open: function()
    {
        this.options.container.append(
	  '<div id="'+this.option.id+'" class="dialog" title="'+this.option.title+'"> <p> <span id="text'+this.option.id+'">'+this.option.text+'</span> </p> </div>'
        );
	$( 'div#'+id ).dialog( "open" );
    }
    
    close: function()
    {
      $( 'div#'+id ).remove();
    }
});

$('a').click(function(e){
    var link = $(this).attr('href');
    var tam = link.length;
    var primeiraLetra = link.charAt(0);
    var ultimaLetra = link.charAt(tam-1);
    var result = link.substr(1, tam-2);
    
    if(primeiraLetra == '[' && ultimaLetra == ']') {
      e.preventDefault();
      
      $.get(result, function(data){
	  var $temp  = $('<div/>', {html:data});
	  var titulo = $temp.find('title').text();
	  var conteudo = $temp.remove('head').html();
	  var id_dialog_div = Math.floor(Math.random() * 1000000);
	  
	  var hello = new myClass({
	    title: titulo
	    text: conteudo,
	    id: id_dialog_div,
	    container: $('div#container')
	  });
	  hello.open();
      });
    }
});
