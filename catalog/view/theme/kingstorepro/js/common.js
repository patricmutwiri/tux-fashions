$(document).ready(function() {
	$(window).scroll(function(){
		if ($(this).scrollTop() > 300) {
	    	$('.scrollup').fadeIn();
	    } else {
			$('.scrollup').fadeOut();
		}
	}); 
	
	$('.scrollup').click(function(){
		$("html, body").animate({ scrollTop: 0 }, 600);
		return false;
	});
	
	$('.dropdown-menu').click(function(event){
		if($(this).hasClass('keep_open')){
		 event.stopPropagation();
		}
	});
	


if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) && $(window).width() < 768) {
		var i = 0;
		var products = [];
		
		$( ".box-product .carousel .item" ).each(function() {
			$( this ).find( ".product-grid .row > div" ).each(function() {
				if(i > 1) {
					products.push($(this).html());
				}
				
				i++;
			});
			for ( var s = i-3; s >= 0; s--, s-- ) {
				var html = "<div class='item'><div class='product-grid'><div class='row'>";
				if (products[s-1] != undefined) {
					html += "<div class='col-xs-6'>" + products[s-1] + "</div>";
				}
				if (products[s] != undefined) {
					html += "<div class='col-xs-6'>" + products[s] + "</div>";
				}
				html += "</div></div></div>";
				
				$( this ).after( html );
			}
			
			products = [];
			i = 0;
		});

	}
	
	/* Search MegaMenu */
	$('.button-search2').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $('.container-megamenu input[name=\'search2\']').val();
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('.container-megamenu input[name=\'search2\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('.container-megamenu input[name=\'search2\']').val();
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	$('[data-placeholder]').focus(function() {
		var input = $(this);
	    if (input.val() == input.attr('data-placeholder')) {
	    	input.val('');
	    }
	 }).blur(function() {
	    var input = $(this);
	    if (input.val() == '' || input.val() == input.attr('data-placeholder')) {
	        input.addClass('placeholder');
	        input.val(input.attr('data-placeholder'));
	    }
	 }).blur();
	
	 $('[data-placeholder]').parents('form').submit(function() {
	     $(this).find('[data-placeholder]').each(function() {
	     	var input = $(this);
	        if (input.val() == input.attr('data-placeholder')) {
	           input.val('');
	        }
	     })
	 });
	 
	 
	/* Search */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $('input[name=\'search\']').attr('value');
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('.button-search2').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $('input[name=\'search2\']').attr('value');
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('#header input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	}); 
	
	$('#tg-search input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	}); 
	
	$('#tg-search2 input[name=\'search2\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search2\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	/* Quatity buttons */
	
	$('#q_up').click(function(){
		var q_val_up=parseInt($("input#quantity_wanted").val());
		if(isNaN(q_val_up)) {
			q_val_up=0;
		}
		$("input#quantity_wanted").val(q_val_up+1).keyup(); 
		return false; 
	});
	
	$('#q_down').click(function(){
		var q_val_up=parseInt($("input#quantity_wanted").val());
		if(isNaN(q_val_up)) {
			q_val_up=0;
		}
		
		if(q_val_up>1) {
			$("input#quantity_wanted").val(q_val_up-1).keyup();
		} 
		return false; 
	});
});

function getURLVar(key) {
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

// Cart add remove functions	
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			success: function(json) {			
				if (json['redirect']) {
					location = json['redirect'];
				}
				
				if (json['success']) {
					
					$("#notification .modal-footer").show();
					$("#notification").modal('show');
					$("#notification .modal-body p").html(json['success']);	
					
					$('#cart').load('index.php?route=common/cart/info #cart > *');
					$('#cart-total').html(json['total']);
				}
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			success: function(json) {
				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart #cart_content').load('index.php?route=common/cart/info #cart_content_ajax');
					$('#cart-total').html(json['total']);
				}			
			}
		});			
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',			
			success: function(json) {
				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart #cart_content').load('index.php?route=common/cart/info #cart_content_ajax');
					$('#cart-total').html(json['total']);
				}
			}
		});			
	}
}

var voucher = {
	'add': function() {
		
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},      
			complete: function() {
				$('#cart > button').button('reset');
			},			
			success: function(json) {
				$('#cart-total').html(json['total']);
				
				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart #cart_content').load('index.php?route=common/cart/info #cart_content_ajax');
					$('#cart-total').html(json['total']);
				}			
			}
		});	
	}
}

var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();
				
				
				$("#notification .modal-footer").hide();
				$("#notification").modal('show');
							
				if (json['success']) {
					$("#notification .modal-body p").html(json['success']);
				}  
				
				if (json['info']) {
					$("#notification .modal-body p").html(json['info']);
				}   

				$('#wishlist-total').html(json['total']);
			}
		});
	},
	'remove': function() {
	
	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();
							
				if (json['success']) {
					
					$("#notification .modal-footer").hide();
					$("#notification").modal('show');
					$("#notification .modal-body p").html(json['success']);
					$('#compare-total').html(json['total']);
				}   
			}
		});
	},
	'remove': function() {
	
	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});