<?php echo $header; ?>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="view/stylesheet/css/colorpicker.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="view/stylesheet/template_options.css" />
<script type="text/javascript" src="view/javascript/jquery/colorpicker.js"></script>
<script type="text/javascript" src="http://themeglobal.com/jquery/jquery.cookie.js"></script>

<script type="text/javascript">
$.fn.tabs = function() {
	var selector = this;
	
	this.each(function() {
		var obj = $(this); 
		
		$(obj.attr('href')).hide();
		
		$(obj).click(function() {
			$(selector).removeClass('selected');
			
			$(selector).each(function(i, element) {
				$($(element).attr('href')).hide();
			});
			
			$(this).addClass('selected');
			
			$($(this).attr('href')).show();
			
			return false;
		});
	});

	$(this).show();
	
	$(this).first().click();
};
</script>
<?php echo $column_left; ?>
<div id="content"><div class="container-fluid">
	<div class="page-header">
	    <h1>TG KingStore Lite Settings</h1>
	    <ul class="breadcrumb">
		     <?php foreach ($breadcrumbs as $breadcrumb) { ?>
		      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		      <?php } ?>
	    </ul>
	  </div>

	<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } elseif ($success) {  ?>
		<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } ?>

<!-- Theme Options -->

<div class="set-size" id="theme-options">
	
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	
		<!-- MULTISTORE -->
		<div id="tb_store_select">
			<label class="inline">Store</label>
			<select name="d_store_id" id="d_store_id">
			<?php foreach ($stores as $store): ?>
				<option value="<?php echo 'index.php?route=module/tg_kspro_settings&store_id=' . $store['store_id'] . '&token=' . $_GET['token']; ?>"<?php if($store_id == $store['store_id']) echo ' selected="selected"'; ?>><?php echo $store['name']; ?></option>
			<?php endforeach; ?>
			</select>
		</div>
					    
		<input type="hidden" name="store_id" value="<?php echo $store_id; ?>" />
					    
		<input type="hidden" name="store_id" value="<?php echo $store_id; ?>" />
					    
		<script type="text/javascript">
			$(document).ready(function (){
				$("#d_store_id").bind("change", function() {
					window.location = $(this).val();
				});
				
				$("#form input").keypress(function(event) {
				    if (event.which == 13) {
				        return false;
				    }
				});
				
				$(".button-add").click(function() {
					$(".add-skin").show();
					return false;
				});
			});
		</script>
		<!-- END MULTISTORE -->
		
		<!-- Unlimited theme skins -->
		<div class="content theme-skins">
			<div>
				<ul class="skins">
					<?php $liczba_skinow = 0; if(isset($skins)) { foreach($skins as $skin) { $liczba_skinow++; } } ?>
					<?php $aktywny_skin = false; if($liczba_skinow > 0) { ?>
					<li><p>Active skin: <br><span><?php echo $active_skin; ?></span></p></li>
					<li>
						<select name="skin">
							<?php foreach($skins as $skin) { ?>
							<option<?php if($skin == $active_skin_edit) { $aktywny_skin = true; echo ' selected="selected"'; } ?> value="<?php echo $skin; ?>"><?php echo $skin; ?></option>
							<?php } ?>
						</select>
						<input type="hidden" name="save_skin" value="<?php echo $active_skin_edit; ?>" />
					</li>
					<li><input type="submit" name="button-active" class="button-active"></li>
					<?php } ?>
					<li><a onclick="#" class="button-add"><span>Add</span></a><div class="add-skin"><input type="text" name="add-skin-name" class="add-skin-name" value=""><input type="submit" name="add-skin" value="Add skin" class="button-add-skin"></div></li>
					<?php if($liczba_skinow > 0) { ?>
					<li><input type="submit" name="button-edit" class="button-edit"></li>
					<li><input type="submit" name="button-delete" class="button-delete" onclick="return confirm('Are you sure you want to delete?')"></li>
					<?php } ?>
				</ul>
			</div>
		</div>
		
		<?php if($liczba_skinow > 0 && ($active_skin != '' || $aktywny_skin == true)) { ?>
		<!-- Content -->
		
		<div class="content">
		
			<div>
				<!-- Tabs -->
				
				<div class="bg-tabs">
				
					<!-- General, Design, Footer TABS -->
					
					<div id="tabs" class="htabs2 main-tabs">
					
						<a href="#tab_general" id="general" ><span>General</span></a>
						<a href="#tab_design" id="design"><span>Design</span></a>
						<a href="#tab_footer" id="tfooter"><span>Custom Footer</span></a>
						<a href="#tab_custom_code" id="tcustomcode"><span>Custom code</span></a>
						<a href="#tab_payment" id="tpayment"><span>Payment</span></a>
						<a href="#tab_widgets" id="twidgets"><span>Widgets</span></a>
						<a href="#tab_compressor_code" id="tcompressorcode"><span>Compressor code</span></a>
						<a href="#tab_install_data" id="tinstalldata"><span>Install data</span></a>
						<a href="#tab_gopro" id="tpayment"><span><b>Upgrade to Pro</b></span></a>
					
					</div>
					
					<!-- End General, Design Footer Tabs -->
					
					<!-- /////////////////// General -->
					
					<div id="tab_general" class="tab-content2">
					
						<!-- Font, colors, background TABS -->
						
						<div id="tabs_general" class="htabs tabs-design">
						
							<a href="#tab_layout" id="tlayout" style="border-left: 1px solid #ededed;"><span>Layout</span></a>
							<a href="#tab_product" id="tproduct"><span>Product</span></a>
							<a href="#tab_category" id="tcategory"><span>Category</span></a>
							<a href="#tab_translations" id="ttranslations"><span>Translations</span></a>
						
						</div>
						
						<!-- **************** Tab GENERAL OPTIONS -->
						
						<div id="tab_layout" class="tab-content">
						
							<h4 style="padding-top:30px">Page Width</h4>
							<!-- Input -->
							<div class="input">
								<p>Page Width:</p>
								<select name="page_width" class="select-page-width">
									<option value="1" <?php if($page_width == 1) { echo 'selected="selected"'; } ?>>Wide (1300px)</option>
									<option value="3" <?php if($page_width == 3) { echo 'selected="selected"'; } ?>>Standard (980px)</option>
									<option value="2" <?php if($page_width == 2) { echo 'selected="selected"'; } ?>>Full width</option>
								</select>
								<div class="clear"></div>
							</div>
							
							<!-- Input -->
							<div class="input page-width" <?php if($page_width != 2) { echo 'style="display:none"'; } ?>>
								<p>Max width:</p>
								<input type="text" name="max_width" value="<?php echo $max_width; ?>" style="margin-right:10px;width:60px">
								<div style="float:left;width:auto;padding-top:7px"><span style="color:#808080;font-size:11px">px</span></div>
								<div class="clear"></div>
							</div>
							
							
						</div>
						
						
						<!-- Product -->
						<div id="tab_product" class="tab-content">
							<h4>Sale badge</h4>
							<div class="input with-status">
								<p style="width:270px">Display Sale:</p>
								<?php if($display_text_sale == 0 && $display_text_sale != '') { echo '<div class="status status-off" title="0" rel="display_text_sale"></div>'; } else { echo '<div class="status status-on" title="1" rel="display_text_sale"></div>'; } ?>
								<input name="display_text_sale" value="<?php echo $display_text_sale; ?>" id="display_text_sale" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input">
								<p style="width:270px">Type Sale:</p>
								<select name="type_sale">
									<option value="0" <?php if($type_sale =='0'){echo ' selected="selected"';} ?>>Text</option>
									<option value="1" <?php if($type_sale =='1'){echo ' selected="selected"';} ?>>%</option>
								</select>
								<div class="clear"></div>
							</div>
							
							<div class="input">
								<p style="width:270px">Text Sale:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="sale_text[<?php echo $language_id; ?>]" <?php if(isset($sale_text[$language_id])) { echo 'value="'.$sale_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
							<h4 style="margin-top: 20px">Product page</h4>
							
							<div class="input">
								<p style="width:270px">Position image additional:</p>
								<select name="position_image_additional">
									<option value="1" <?php if($position_image_additional =='1'){echo ' selected="selected"';} ?>>Bottom</option>
									<option value="2" <?php if($position_image_additional =='2'){echo ' selected="selected"';} ?>>Left</option>
								</select>
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">Product social share:</p>
								<?php if($product_social_share == 0 && $product_social_share != '') { echo '<div class="status status-off" title="0" rel="product_social_share"></div>'; } else { echo '<div class="status status-on" title="1" rel="product_social_share"></div>'; } ?>
								<input name="product_social_share" value="<?php echo $product_social_share; ?>" id="product_social_share" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<h4 style="margin-top: 20px">Product grid</h4>
							<div class="input">
								<p style="width:270px">Product number per row:</p>
								<select name="product_per_pow">
									<option value="3"<?php if($product_per_pow =='3'){echo ' selected="selected"';} ?>>3</option>
									<option value="4"<?php if($product_per_pow =='4' || $product_per_pow < 3){echo ' selected="selected"';} ?>>4</option>
									<option value="5"<?php if($product_per_pow =='5'){echo ' selected="selected"';} ?>>5</option>
									<option value="6"<?php if($product_per_pow =='6'){echo ' selected="selected"';} ?>>6</option>
								</select>
								<div class="clear"></div>
							</div>
							
							
							<div class="input with-status">
								<p style="width:270px">Quick view:</p>
								<?php if($quick_view == 0 && $quick_view != '') { echo '<div class="status status-off" title="0" rel="quick_view"></div>'; } else { echo '<div class="status status-on" title="1" rel="quick_view"></div>'; } ?>
								<input name="quick_view" value="<?php echo $quick_view; ?>" id="quick_view" type="hidden" />
								<div class="clear"></div>
							</div>
							
							
							<div class="input">
								<p style="width:250px">Display elements on product for Home Page and Product Page:</p>
								<div class="clear"></div>
							</div>


							<div class="input with-status">
								<p style="width:270px">&nbsp;&nbsp;&nbsp;- rating</p>
								<?php if($display_rating == 0 && $display_rating != '') { echo '<div class="status status-off" title="0" rel="display_rating"></div>'; } else { echo '<div class="status status-on" title="1" rel="display_rating"></div>'; } ?>
								<input name="display_rating" value="<?php echo $display_rating; ?>" id="display_rating" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">&nbsp;&nbsp;&nbsp;- add to compare</p>
								<?php if($display_add_to_compare == 0 && $display_add_to_compare != '') { echo '<div class="status status-off" title="0" rel="display_add_to_compare"></div>'; } else { echo '<div class="status status-on" title="1" rel="display_add_to_compare"></div>'; } ?>
								<input name="display_add_to_compare" value="<?php echo $display_add_to_compare; ?>" id="display_add_to_compare" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">&nbsp;&nbsp;&nbsp;- add to wishlist</p>
								<?php if($display_add_to_wishlist == 0 && $display_add_to_wishlist != '') { echo '<div class="status status-off" title="0" rel="display_add_to_wishlist"></div>'; } else { echo '<div class="status status-on" title="1" rel="display_add_to_wishlist"></div>'; } ?>
								<input name="display_add_to_wishlist" value="<?php echo $display_add_to_wishlist; ?>" id="display_add_to_wishlist" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">&nbsp;&nbsp;&nbsp;- add to cart</p>
								<?php if($display_add_to_cart == 0 && $display_add_to_cart != '') { echo '<div class="status status-off" title="0" rel="display_add_to_cart"></div>'; } else { echo '<div class="status status-on" title="1" rel="display_add_to_cart"></div>'; } ?>
								<input name="display_add_to_cart" value="<?php echo $display_add_to_cart; ?>" id="display_add_to_cart" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input">
								<p>Product scroll:</p>
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">&nbsp;&nbsp;&nbsp;- latest</p>
								<?php if($product_scroll_latest == 0 && $product_scroll_latest != '') { echo '<div class="status status-off" title="0" rel="product_scroll_latest"></div>'; } else { echo '<div class="status status-on" title="1" rel="product_scroll_latest"></div>'; } ?>
								<input name="product_scroll_latest" value="<?php echo $product_scroll_latest; ?>" id="product_scroll_latest" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">&nbsp;&nbsp;&nbsp;- featured</p>
								<?php if($product_scroll_featured == 0 && $product_scroll_featured != '') { echo '<div class="status status-off" title="0" rel="product_scroll_featured"></div>'; } else { echo '<div class="status status-on" title="1" rel="product_scroll_featured"></div>'; } ?>
								<input name="product_scroll_featured" value="<?php echo $product_scroll_featured; ?>" id="product_scroll_featured" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">&nbsp;&nbsp;&nbsp;- bestsellers</p>
								<?php if($product_scroll_bestsellers == 0 && $product_scroll_bestsellers != '') { echo '<div class="status status-off" title="0" rel="product_scroll_bestsellers"></div>'; } else { echo '<div class="status status-on" title="1" rel="product_scroll_bestsellers"></div>'; } ?>
								<input name="product_scroll_bestsellers" value="<?php echo $product_scroll_bestsellers; ?>" id="product_scroll_bestsellers" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">&nbsp;&nbsp;&nbsp;- specials</p>
								<?php if($product_scroll_specials == 0 && $product_scroll_specials != '') { echo '<div class="status status-off" title="0" rel="product_scroll_specials"></div>'; } else { echo '<div class="status status-on" title="1" rel="product_scroll_specials"></div>'; } ?>
								<input name="product_scroll_specials" value="<?php echo $product_scroll_specials; ?>" id="product_scroll_specials" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">&nbsp;&nbsp;&nbsp;- related</p>
								<?php if($product_scroll_related == 0 && $product_scroll_related != '') { echo '<div class="status status-off" title="0" rel="product_scroll_related"></div>'; } else { echo '<div class="status status-on" title="1" rel="product_scroll_related"></div>'; } ?>
								<input name="product_scroll_related" value="<?php echo $product_scroll_related; ?>" id="product_scroll_related" type="hidden" />
								<div class="clear"></div>
							</div>
						</div>

						
						<!-- Category -->
						<div id="tab_category" class="tab-content">
							<h4>Category page</h4>
							<!-- Input -->
							<div class="input">
								<p style="width:270px">Product grid number per row:</p>
								<select name="product_per_pow2">
									<option value="2"<?php if($product_per_pow2 =='2'){echo ' selected="selected"';} ?>>2</option>
									<option value="3"<?php if($product_per_pow2 =='3'){echo ' selected="selected"';} ?>>3</option>
									<option value="4"<?php if($product_per_pow2 =='4' || $product_per_pow2 < 2){echo ' selected="selected"';} ?>>4</option>
									<option value="5"<?php if($product_per_pow2 =='5'){echo ' selected="selected"';} ?>>5</option>
									<option value="6"<?php if($product_per_pow2 =='6'){echo ' selected="selected"';} ?>>6</option>
								</select>
								<div class="clear"></div>
							</div>
							
							
							<div class="input with-status">
								<p style="width:270px">Product grid Rating</p>
								<?php if($category_page_display_rating == 0 && $category_page_display_rating != '') { echo '<div class="status status-off" title="0" rel="category_page_display_rating"></div>'; } else { echo '<div class="status status-on " title="1" rel="category_page_display_rating"></div>'; } ?>
								<input name="category_page_display_rating" value="<?php echo $category_page_display_rating; ?>" id="category_page_display_rating" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">Quick View</p>
								<?php if($category_page_display_quickview == 0 && $category_page_display_quickview != '') { echo '<div class="status status-off" title="0" rel="category_page_display_quickview"></div>'; } else { echo '<div class="status status-on " title="1" rel="category_page_display_quickview"></div>'; } ?>
								<input name="category_page_display_quickview" value="<?php echo $category_page_display_quickview; ?>" id="category_page_display_quickview" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">Product grid add to Compare</p>
								<?php if($category_page_display_add_to_compare == 0 && $category_page_display_add_to_compare != '') { echo '<div class="status status-off" title="0" rel="category_page_display_add_to_compare"></div>'; } else { echo '<div class="status status-on " title="1" rel="category_page_display_add_to_compare"></div>'; } ?>
								<input name="category_page_display_add_to_compare" value="<?php echo $category_page_display_add_to_compare; ?>" id="category_page_display_add_to_compare" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">Product grid add to Wishlist</p>
								<?php if($category_page_display_add_to_wishlist == 0 && $category_page_display_add_to_wishlist != '') { echo '<div class="status status-off" title="0" rel="category_page_display_add_to_wishlist"></div>'; } else { echo '<div class="status status-on " title="1" rel="category_page_display_add_to_wishlist"></div>'; } ?>
								<input name="category_page_display_add_to_wishlist" value="<?php echo $category_page_display_add_to_wishlist; ?>" id="category_page_display_add_to_wishlist" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<div class="input with-status">
								<p style="width:270px">Product grid Add to Cart</p>
								<?php if($category_page_display_add_to_cart == 0 && $category_page_display_add_to_cart != '') { echo '<div class="status status-off" title="0" rel="category_page_display_add_to_cart"></div>'; } else { echo '<div class="status status-on " title="1" rel="category_page_display_add_to_cart"></div>'; } ?>
								<input name="category_page_display_add_to_cart" value="<?php echo $category_page_display_add_to_cart; ?>" id="category_page_display_add_to_cart" type="hidden" />
								<div class="clear"></div>
							</div>
							
							<!-- Input -->
							<div class="input">
								<p style="width:270px">Default list/grid:</p>
								<select name="default_list_grid">
							  		<option value="0" <?php if($default_list_grid =='0'){echo ' selected="selected"';} ?>>List</option>
							 		<option value="1" <?php if($default_list_grid =='1'){echo ' selected="selected"';} ?>>Grid</option>
								</select>
								<div class="clear"></div>
							</div>
							
							<!-- Input -->
							<div class="input">
								<p style="width:270px">Refine search style:</p>
								<select name="refine_search_style">
									<option value="0" <?php if($refine_search_style =='0'){echo ' selected="selected"';} ?>>With images</option>
									<option value="1" <?php if($refine_search_style =='1'){echo ' selected="selected"';} ?>>Text only</option>
									<option value="2" <?php if($refine_search_style =='2'){echo ' selected="selected"';} ?>>Disable</option>
								</select>
								<div class="clear"></div>
							</div>
							
							<div class="input">
								<p style="width:270px">Refine search number per row:</p>
								<select name="refine_search_number">
									<option value="2"<?php if($refine_search_number =='2'){echo ' selected="selected"';} ?>>2</option>
									<option value="3"<?php if($refine_search_number =='3'){echo ' selected="selected"';} ?>>3</option>
									<option value="4"<?php if($refine_search_number =='4'|| $refine_search_number < 4){echo ' selected="selected"';} ?>>4</option>
									<option value="5"<?php if($refine_search_number =='5'){echo ' selected="selected"';} ?>>5</option>
									<option value="6"<?php if($refine_search_number =='6'){echo ' selected="selected"';} ?>>6</option>
								</select>
								<div class="clear"></div>
							</div>
							
							<!-- Input -->
							<div class="input">
								<p style="width:270px">Refine search image size:</p>
								<input type="text" name="refine_image_width" style="width:40px" value="<?php echo $refine_image_width; ?>" />
								<div style="float:left;width:auto;padding-right:15px;position:relative;margin-left:-5px;padding-top:5px"> x </div>
								<input type="text" name="refine_image_height" style="width:40px" value="<?php echo $refine_image_height; ?>" />
								<div class="clear"></div>
							</div>
						</div>
						
						<!-- Translations -->
						<div id="tab_translations" class="tab-content">
							<h4>Translate words</h4>
							
							<div class="input">
								<p style="width:200px">Welcome Text:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="welcome_text[<?php echo $language_id; ?>]" <?php if(isset($welcome_text[$language_id])) { echo 'value="'.$welcome_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
							<div class="input">
								<p style="width:200px">Confirmation:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="confirmation_text[<?php echo $language_id; ?>]" <?php if(isset($confirmation_text[$language_id])) { echo 'value="'.$confirmation_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
							<div class="input">
								<p style="width:200px">Continue Shopping:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="continue_shopping_text[<?php echo $language_id; ?>]" <?php if(isset($continue_shopping_text[$language_id])) { echo 'value="'.$continue_shopping_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
							<div class="input">
								<p style="width:200px">View Cart:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="checkout_text[<?php echo $language_id; ?>]" <?php if(isset($checkout_text[$language_id])) { echo 'value="'.$checkout_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
						
							<div class="input">
								<p style="width:200px">Add to cart:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="add_to_cart_text[<?php echo $language_id; ?>]" <?php if(isset($add_to_cart_text[$language_id])) { echo 'value="'.$add_to_cart_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
							<div class="input">
								<p style="width:200px">Add to compare:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="add_to_compare_text[<?php echo $language_id; ?>]" <?php if(isset($add_to_compare_text[$language_id])) { echo 'value="'.$add_to_compare_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
							<div class="input">
								<p style="width:200px">Add to wishlist:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="add_to_wishlist_text[<?php echo $language_id; ?>]" <?php if(isset($add_to_wishlist_text[$language_id])) { echo 'value="'.$add_to_wishlist_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
							
							<div class="input">
								<p style="width:200px">Shopping Cart Title:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="mycart_text[<?php echo $language_id; ?>]" <?php if(isset($mycart_text[$language_id])) { echo 'value="'.$mycart_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
							
							
							<div class="input">
								<p style="width:200px">Category Heading Title:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="category_text[<?php echo $language_id; ?>]" <?php if(isset($category_text[$language_id])) { echo 'value="'.$category_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
							<div class="input">
								<p style="width:200px">Search Text:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="search_text[<?php echo $language_id; ?>]" <?php if(isset($search_text[$language_id])) { echo 'value="'.$search_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
							<div class="input">
								<p style="width:200px">Brands Text:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="brand_text[<?php echo $language_id; ?>]" <?php if(isset($brand_text[$language_id])) { echo 'value="'.$brand_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
							
							
							<div class="input">
								<p style="width:200px">More Detail Text:</p>
								<div class="list-language">
									<?php foreach($languages as $language) { ?>
									<div class="language">
										<?php $language_id = $language['language_id']; ?>
										<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
										<input type="text" name="more_details_text[<?php echo $language_id; ?>]" <?php if(isset($more_details_text[$language_id])) { echo 'value="'.$more_details_text[$language_id].'"'; } ?>>
									</div>
									<?php } ?>
								</div>
								<div class="clear"></div>
							</div>
							
						</div>
						
						
						<!-- **************** END TAB GENERAL OPTIONS -->
								
					</div>
					
					<!-- ////////////////////// End General -->
					
					<!-- Design -->
					
					<div id="tab_design" class="tab-content2">
					
						<!-- Font, colors, background TABS -->
						
						<div id="tabs_design" class="htabs tabs-design">
							<a href="#tab_colors" id="tcolors" style="border-left: 1px solid rgb(237, 237, 237);"><span>Colors</span></a>
							<a href="#tab_backgrounds" id="tbackgrounds"><span>Backgrounds</span></a>
						
						</div>
						
						<!-- Colors -->
						
						<div id="tab_colors" class="tab-content">
													
							<!-- Status -->
							
							<?php if($colors_status == 1) { echo '<div class="status status-on" title="1" rel="colors_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="colors_status"></div>'; } ?>
							
							<input name="colors_status" value="<?php echo $colors_status; ?>" id="colors_status" type="hidden" />
							
							<!-- Colros body -->

								<!-- Input -->
								<div class="color_input">
									<p>Primary Color:</p>
									<div><input type="text" value="<?php echo $primary_color; ?>" id="primary_color" name="primary_color" <?php if($primary_color != '') { echo 'style="border-right: 20px solid '.$primary_color.'"'; } ?> /></div>
								</div>
								
								<!-- Input -->
								<div class="color_input">
									<p>Primary Hover Color:</p>
									<div><input type="text" value="<?php echo $primary_hover_color; ?>" id="primary_hover_color" name="primary_hover_color" <?php if($primary_hover_color != '') { echo 'style="border-right: 20px solid '.$primary_hover_color.'"'; } ?> /></div>
								</div>

						</div>
						
						<!-- End Colors -->
						
						<!-- Backgrounds -->
						<div id="tab_backgrounds" class="tab-content">
													
							<!-- Status -->
							<?php if($background_status == 1) { echo '<div class="status status-on" title="1" rel="background_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="background_status"></div>'; } ?>
							
							<input name="background_status" value="<?php echo $background_status; ?>" id="background_status" type="hidden" />
							
							<!-- Input -->
								<div class="color_input">
									<p>Body Background Color:</p>
									<div><input type="text" value="<?php echo $body_color; ?>" id="body_color" name="body_color" <?php if($body_color != '') { echo 'style="border-right: 20px solid '.$body_color.'"'; } ?> /></div>
								</div>
							
							<div class="input">
								<p>Own background:</p>
								
								<div class="own_image">
									
									<input type="hidden" name="body_background" value="<?php echo $body_background; ?>" id="input-body-background" />
									<?php if($body_background == '') { ?>
										<a href="" id="thumb-body-background" style="border-radius: 0px;border: 1px solid #ededed;"class="img-thumbnail img-edit" data-toggle="image"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
									<?php } else { ?>
										<a href="" id="thumb-body-background" class="img-thumbnail img-edit" data-toggle="image"><img src="../image/<?php echo $body_background; ?>" data-placeholder="<?php echo $placeholder; ?>" alt="" /></a>
									<?php } ?>
								</div>
								
								<div class="clear"></div>	
							</div>
							
							<!-- Input -->
							
							<!-- Input -->
							
							<div class="input">
							
								<p>Background:</p>
								<select name="body_background_background">
									<option value="0"<?php if($body_background_background < 1) { echo ' selected="selected"'; } ?>>Standard</option>
									<option value="1"<?php if($body_background_background == 1) { echo ' selected="selected"'; } ?>>None</option>
									<option value="2"<?php if($body_background_background == 2) { echo ' selected="selected"'; } ?>>Own</option>
								</select>

								<div class="clear"></div>
							
							</div>
							
							<!-- End Input -->
														
							
							
							<!-- End Input -->
							
								<!-- Input -->	
							
							<div class="input">
							
								<p>Position:</p>
								<select name="body_background_position">
									<option value="top left"<?php if($body_background_position == 'top left') { echo ' selected="selected"'; } ?>>Top left</option>
									<option value="top center"<?php if($body_background_position == 'top center') { echo ' selected="selected"'; } ?>>Top center</option>
									<option value="top right"<?php if($body_background_position == 'top right') { echo ' selected="selected"'; } ?>>Top right</option>
									<option value="bottom left"<?php if($body_background_position == 'bottom left') { echo ' selected="selected"'; } ?>>Bottom left</option>
									<option value="bottom center"<?php if($body_background_position == 'bottom center') { echo ' selected="selected"'; } ?>>Bottom center</option>
									<option value="bottom right"<?php if($body_background_position == 'bottom right') { echo ' selected="selected"'; } ?>>Bottom right</option>
								</select>
							
								<div class="clear"></div>
							
							</div>
							
							<!-- End Input -->
							
								<!-- Input -->	
							
							<div class="input">
							
								<p>Repeat:</p>
								<select name="body_background_repeat">
									<option value="no-repeat"<?php if($body_background_repeat == 'no-repeat') { echo ' selected="selected"'; } ?>>no-repeat</option>
									<option value="repeat-x"<?php if($body_background_repeat == 'repeat-x') { echo ' selected="selected"'; } ?>>repeat-x</option>
									<option value="repeat-y"<?php if($body_background_repeat == 'repeat-y') { echo ' selected="selected"'; } ?>>repeat-y</option>
									<option value="repeat"<?php if($body_background_repeat == 'repeat') { echo ' selected="selected"'; } ?>>repeat</option>
								</select>
							
								<div class="clear"></div>
							
							</div>
							
							<!-- End Input -->
							
								<!-- Input -->	
							
							<div class="input">
							
								<p>Attachment:</p>
								<select name="body_background_attachment">
									<option value="scroll"<?php if($body_background_attachment == 'scroll') { echo ' selected="selected"'; } ?>>scroll</option>
									<option value="fixed"<?php if($body_background_attachment == 'fixed') { echo ' selected="selected"'; } ?>>fixed</option>
								</select>
							
								<div class="clear"></div>
							
							</div>
							
							<!-- End Input -->
							
						</div>
					
					</div>
					
					<!-- End Design -->
					
					<!-- Footer -->
					
					<div id="tab_footer" class="tab-content2">
					
						
						<div id="tabs_footer" class="htabs tabs-design">

							<a href="#tab_custom_footer1" class="tcustomblock"><span>Custom Footer 1 Block</span></a>
							<a href="#tab_custom_footer2" class="tcustomblock"><span>Custom Footer 2 Block</span></a>
						
						</div>
												
						
						<div id="tab_custom_footer1" class="tab-content">
						
							<!-- Status -->
							
							<?php if($custom_footer1_status == 1) { echo '<div class="status status-on" title="1" rel="custom_footer1_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="custom_footer1_status"></div>'; } ?>
							
							<input name="custom_footer1_status" value="<?php echo $custom_footer1_status; ?>" id="custom_footer1_status" type="hidden" />
							
							<div class="customblocktabs htabs">
								<?php foreach ($languages as $language) { ?>
								<a href="#content_customblock_<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
								<?php } ?>
							</div>
							
							<?php foreach ($languages as $language) { $lang_id = $language['language_id']; ?>
							<!-- Input -->
							<div id="content_customblock_<?php echo $language['language_id']; ?>" class="content_customblock">
									<textarea name="custom_footer1_content[<?php echo $language['language_id']; ?>]" id="custom_footer1_content_<?php echo $language['language_id']; ?>" class="form-control"><?php if(isset($custom_footer1_content[$lang_id])) { echo $custom_footer1_content[$lang_id]; } ?></textarea>
									
							</div>
							<?php } ?>
							
							<!-- Input -->
									
							
						</div>
						
						<div id="tab_custom_footer2" class="tab-content">
						
							<!-- Status -->
							
							<?php if($custom_footer2_status == 1) { echo '<div class="status status-on" title="1" rel="custom_footer2_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="custom_footer2_status"></div>'; } ?>
							
							<input name="custom_footer2_status" value="<?php echo $custom_footer2_status; ?>" id="custom_footer2_status" type="hidden" />
							
							<div class="customblocktabs htabs">
								<?php foreach ($languages as $language) { ?>
								<a href="#content_customblock_<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
								<?php } ?>
							</div>
							
							<?php foreach ($languages as $language) { $lang_id = $language['language_id']; ?>
							<!-- Input -->
							<div id="content_customblock_<?php echo $language['language_id']; ?>" class="content_customblock">
									<textarea name="custom_footer2_content[<?php echo $language['language_id']; ?>]" id="custom_footer2_content_<?php echo $language['language_id']; ?>" class="form-control"><?php if(isset($custom_footer2_content[$lang_id])) { echo $custom_footer2_content[$lang_id]; } ?></textarea>
									
							</div>
							<?php } ?>
							
							<!-- Input -->
									
							
						</div>

					
					</div>
					
					<!-- End Footer -->
					
					<!-- PAYMENT -->
					
					<div id="tab_payment" class="tab-content">
					
						<!-- Status -->
							
						<?php if($payment_status == 0 && $payment_status != '') { echo '<div class="status status-off" title="0" rel="payment_status"></div>'; } else { echo '<div class="status status-on" title="1" rel="payment_status"></div>'; } ?>
						
						<input name="payment_status" value="<?php echo $payment_status; ?>" id="payment_status" type="hidden" />
						
						<table class="payment_images" id="payment">
							<thead>
								<tr>
									<td class="first">Icon</td>
									<td>Name</td>
									<td>Link</td>
									<td>Sort</td>
									<td>New Tab</td>
									<td>Delete</td>
								</tr>
							</thead>
							<?php $module_row = 0; if($payment != '') { ?>
								<?php foreach($payment as $payments) { ?>
								<tbody id="payment<?php echo $module_row; ?>">
									<tr>
										<td class="first">
											<div class="own_image">
												<input type="hidden" name="payment[<?php echo $module_row; ?>][img]" value="<?php echo $payments['img']; ?>" id="input-<?php echo $module_row; ?>_img_preview" />
												
												<?php if($payments['img'] == '') { ?>
													<a href="" id="thumb-<?php echo $module_row; ?>_img_preview" class="img-thumbnail img-edit" data-toggle="image"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
												<?php } else { ?>
													<a href="" id="thumb-<?php echo $module_row; ?>_img_preview" class="img-thumbnail img-edit" data-toggle="image"><img src="../image/<?php echo $payments['img']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>" /></a>
												<?php } ?>
											</div>
										</td>
										<td>
											<div class="payment-name">
												<input type="text" value="<?php if(isset($payments['name'])) { echo $payments['name']; } ?>" name="payment[<?php echo $module_row; ?>][name]">
											</div>
										</td>
										<td>
											<input type="text" value="<?php if(isset($payments['link'])) { echo $payments['link']; } ?>" name="payment[<?php echo $module_row; ?>][link]">
										</td>
										<td>
											<input type="text" class="sort" value="<?php if(isset($payments['sort'])) { echo $payments['sort']; } ?>" name="payment[<?php echo $module_row; ?>][sort]">
										</td>
										<td>
											<?php if(isset($payments['new_tab'])) { ?>
												<?php if($payments['new_tab'] == 0 && $payments['new_tab'] != '') { echo '<div class="status status-off" title="0" rel="payment_'.$module_row.'_new_tab"></div>'; } else { echo '<div class="status status-on" title="1" rel="payment_'.$module_row.'_new_tab"></div>'; } ?>
											<?php } else { echo '<div class="status status-off" title="0" rel="payment_'.$module_row.'_new_tab"></div>'; } ?>
											<input name="payment[<?php echo $module_row; ?>][new_tab]" value="<?php if(isset($payments['new_tab'])) { echo $payments['new_tab']; } else { echo '0'; } ?>" id="payment_<?php echo $module_row; ?>_new_tab" type="hidden" />
										</td>
										<td>
											<a onclick="$('#payment<?php echo $module_row; ?>').remove();" class="remove-payment">Remove</a>
										</td>
									</tr>
								</tbody>
								<?php $module_row++; } ?>
							<?php } ?>
							<tfoot></tfoot>
						</table>
						
						<a onclick="addPayment();" class="add-item-payment">Add item</a>
						
						<script type="text/javascript"><!--
						var module_row = <?php echo $module_row; ?>;
						
						function addPayment() {
							html  = '<tbody id="payment' + module_row + '">';
							html += '  <tr>';
							html += '	 <td class="first">';
							html += '		<div class="own_image"><input type="hidden" name="payment[' + module_row + '][img]" value="" id="input-' + module_row + '_img_preview" /><a href="" id="thumb-' + module_row + '_img_preview" class="img-thumbnail img-edit" data-toggle="image"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a></div>';
							html += '	 </td>';
							html += '    <td>';
							html += '		<div class="payment_name"><input type="text" name="payment[' + module_row + '][name]"></div>';
							html += '    </td>';
							html += '    <td>';
							html += '		<input type="text" name="payment[' + module_row + '][link]">';
							html += '    </td>';
							html += '    <td>';
							html += '		<input type="text" class="sort" name="payment[' + module_row + '][sort]">';
							html += '    </td>';
							html += '    <td>';
							html += '		<div class="status status-off" title="0" rel="payment_' + module_row + '_new_tab"></div><input name="payment[' + module_row + '][new_tab]" value="0" id="payment_' + module_row + '_new_tab" type="hidden" />';
							html += '    </td>';
							html += '    <td><a onclick="$(\'#payment' + module_row + '\').remove();" class="remove-payment">Remove</a></td>';
							html += '  </tr>';
							html += '</tbody>';
							
							$('#payment tfoot').before(html);
							
							module_row++;
						}
						//--></script> 
	
					</div>
					
					<!-- END PAYMENT -->
					
					
					
					
					
					
					<!-- Custom code -->
					
					<div id="tab_custom_code" class="tab-content2">
					
						<!-- Font, colors, background TABS -->
						
						<div id="tabs_custom_code" class="htabs tabs-design">
						
							<a href="#tab_css" id="tcss" style="border-left: 1px solid #ededed;"><span>Css</span></a>
							<a href="#tab_javascript" id="tjavascript"><span>Javascript</span></a>
						
						</div>
						
						<!-- ....... TABS CSS -->
						
						<div id="tab_css" class="tab-content">
						
							<!-- Status -->
							
							<?php if($custom_code_css_status == 1) { echo '<div class="status status-on" title="1" rel="custom_code_css_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="custom_code_css_status"></div>'; } ?>
							
							<input name="custom_code_css_status" value="<?php echo $custom_code_css_status; ?>" id="custom_code_css_status" type="hidden" />
							
							<!-- Input -->
							
							<div class="input">										
							
								<?php if(isset($custom_code_css)) { ?>
								<textarea rows="0" cols="0" name="custom_code_css"><?php echo $custom_code_css; ?></textarea>
								<?php } else { ?>
								<textarea rows="0" cols="0" name="custom_code_css"></textarea>
								<?php } ?>
							
								<div class="clear"></div>
							
							</div>
							
							<!-- End Input -->
						
						</div>
						
						<!-- ....... END TABS CSS -->
						
						<!-- ....... TABS JAVASCRIPT -->
						
						<div id="tab_javascript" class="tab-content">
						
							<!-- Status -->
							
							<?php if($custom_code_javascript_status == 1) { echo '<div class="status status-on" title="1" rel="custom_code_javascript_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="custom_code_javascript_status"></div>'; } ?>
							
							<input name="custom_code_javascript_status" value="<?php echo $custom_code_javascript_status; ?>" id="custom_code_javascript_status" type="hidden" />
							
							<!-- Input -->
							
							<div class="input">										
							
								<?php if(isset($custom_code_js)) { ?>
								<textarea rows="0" cols="0" name="custom_code_js"><?php echo $custom_code_js; ?></textarea>
								<?php } else { ?>
								<textarea rows="0" cols="0" name="custom_code_js"></textarea>
								<?php } ?>
							
								<div class="clear"></div>
							
							</div>
							
							<!-- End Input -->
						
						</div>
						
						<!-- ....... END TABS JAVASCRIPT -->
										
					</div>
					
					<!-- End Custom code -->
					
					<!-- Widget -->
					
					<div id="tab_widgets" class="tab-content2">
											
						<div id="tabs_widgets" class="htabs tabs-design">
						
							<a href="#tab_widget_facebook" class="tfacebook"><span>Facebook</span></a>
							<a href="#tab_widget_twitter" class="ttwitter"><span>Twitter</span></a>
							<a href="#tab_widget_custom" class="tcustomblock"><span>Custom</span></a>
						
						</div>
												
						<div id="tab_widget_facebook" class="tab-content">
						
							<!-- Status -->
							
							<?php if($widget_facebook_status == 1) { echo '<div class="status status-on" title="1" rel="widget_facebook_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="widget_facebook_status"></div>'; } ?>
							
							<input name="widget_facebook_status" value="<?php echo $widget_facebook_status; ?>" id="widget_facebook_status" type="hidden" />
							
							<h4>Facebook</h4>
							
							<!-- Input -->

							<div class="input">
									
								<p>Facebook ID:</p>
								<?php if(isset($widget_facebook_id)) { ?>
									<input name="widget_facebook_id" value="<?php echo $widget_facebook_id; ?>" />
								<?php } else { ?>
									<input name="widget_facebook_id" value="" />
								<?php } ?>
								
								<a href="http://findmyfacebookid.com/" target="_blank" style="display: block;float: left;width: auto;margin-top: 7px">Find your Facebook ID »</a>
									
								<div class="clear"></div>
									
							</div>
									
							<!-- End Input -->
							<!-- Input -->
									
							<div class="input">
									
								<p>Position:</p>
								<select name="widget_facebook_position">
									<?php if(isset($widget_facebook_position)) { ?>
							           <option value="0" <?php if($widget_facebook_position =='0'){echo ' selected="selected"';} ?>>Right</option>
								       <option value="1" <?php if($widget_facebook_position =='1'){echo ' selected="selected"';} ?>>Left</option>
							         <?php } else { ?>
		 						        <option value="0" selected="selected">Right</option>
								        <option value="1">Left</option>						              
							         <?php } ?>
								</select>
									
								<div class="clear"></div>
									
							 </div>
									
							<!-- End Input -->
						
						</div>
												
						<div id="tab_widget_twitter" class="tab-content">
						
							<!-- Status -->
							
							<?php if($widget_twitter_status == 1) { echo '<div class="status status-on" title="1" rel="widget_twitter_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="widget_twitter_status"></div>'; } ?>
							
							<input name="widget_twitter_status" value="<?php echo $widget_twitter_status; ?>" id="widget_twitter_status" type="hidden" />
							
							<h4>Twitter</h4>
							
							<!-- Input -->

							<div class="input">
									
								<p>Twitter username:</p>
								<?php if(isset($widget_twitter_user_name)) { ?>
									<input name="widget_twitter_user_name" value="<?php echo $widget_twitter_user_name; ?>" />
								<?php } else { ?>
									<input name="widget_twitter_user_name" value="" />
								<?php } ?>
																	
								<div class="clear"></div>
									
							</div>
									
							<!-- End Input -->
							
							<!-- Input -->

							<div class="input">
									
								<p>Widget ID:</p>
								<?php if(isset($widget_twitter_id)) { ?>
									<input name="widget_twitter_id" value="<?php echo $widget_twitter_id; ?>" />
								<?php } else { ?>
									<input name="widget_twitter_id" value="" />
								<?php } ?>
																	
								<div class="clear"></div>
									
							</div>
									
							<!-- End Input -->
							
							<!-- Input -->
									
							<div class="input">
									
								<p>Tweet limit:</p>
								<select name="widget_twitter_limit">
									<?php if(isset($widget_twitter_limit)) { ?>
							           <option value="1" <?php if($widget_twitter_limit =='1'){echo ' selected="selected"';} ?>>1</option>
								       <option value="2" <?php if($widget_twitter_limit =='2'){echo ' selected="selected"';} ?>>2</option>
								       <option value="3" <?php if($widget_twitter_limit =='3'){echo ' selected="selected"';} ?>>3</option>
							         <?php } else { ?>
									    <option value="1">1</option>
								        <option value="2">2</option>						              
								        <option value="3" selected="selected">3</option>						              
							         <?php } ?>
								</select>
									
								<div class="clear"></div>
									
							 </div>
									
							<!-- End Input -->
							
							<!-- Input -->
									
							<div class="input">
									
								<p>Position:</p>
								<select name="widget_twitter_position">
									<?php if(isset($widget_twitter_position)) { ?>
							           <option value="0" <?php if($widget_twitter_position =='0'){echo ' selected="selected"';} ?>>Right</option>
								       <option value="1" <?php if($widget_twitter_position =='1'){echo ' selected="selected"';} ?>>Left</option>
							         <?php } else { ?>
		 						        <option value="0" selected="selected">Right</option>
								        <option value="1">Left</option>						              
							         <?php } ?>
								</select>
									
								<div class="clear"></div>
									
							 </div>
									
							<!-- End Input -->
						
						</div>
						
						<div id="tab_widget_custom" class="tab-content">
						
							<!-- Status -->
							
							<?php if($widget_custom_status == 1) { echo '<div class="status status-on" title="1" rel="widget_custom_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="widget_custom_status"></div>'; } ?>
							
							<input name="widget_custom_status" value="<?php echo $widget_custom_status; ?>" id="widget_custom_status" type="hidden" />
							
							<h4>Custom block</h4>
							
							<div class="customblocktabs htabs">
								<?php foreach ($languages as $language) { ?>
								<a href="#content_customblock_<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
								<?php } ?>
							</div>
							
							<?php foreach ($languages as $language) { $lang_id = $language['language_id']; ?>
							<!-- Input -->
							<div id="content_customblock_<?php echo $language['language_id']; ?>" class="content_customblock">
									<textarea name="widget_custom_content[<?php echo $language['language_id']; ?>]" id="widget_custom_content_<?php echo $language['language_id']; ?>" class="form-control"><?php if(isset($widget_custom_content[$lang_id])) { echo $widget_custom_content[$lang_id]; } ?></textarea>
									
							</div>
							<?php } ?>
							
							<!-- Input -->
									
							<div class="input">
									
								<p>Position:</p>
								<select name="widget_custom_position">
									<?php if(isset($widget_custom_position)) { ?>
							           <option value="0" <?php if($widget_custom_position =='0'){echo ' selected="selected"';} ?>>Right</option>
								       <option value="1" <?php if($widget_custom_position =='1'){echo ' selected="selected"';} ?>>Left</option>
							         <?php } else { ?>
									        <option value="0" selected="selected">Right</option>
								        <option value="1">Left</option>						              
							         <?php } ?>
								</select>
									
								<div class="clear"></div>
									
							 </div>
									
							<!-- End Input -->
							
						</div>
																
					</div>
					
					<!-- End Widgets -->
					
					<div id="tab_gopro" class="tab-content">
					
						<p style="font-family: 'Roboto', sans-serif;color:#000000;font-size:13px; font-weight:300;line-height: 21px;">
						You can upgrade KingStore Lite to the <a href="http://themeglobal.com/opencart/kingstorepro"><b>Pro version</b></a> to take advantage of expanded capabilities.
						<br>With KingStore  Pro, you also get: 
						<ul>
						<li style="font-family: 'Roboto', sans-serif;color:#000000;font-size:13px; font-weight:300;"><b>TG KingStore Pro MegaMenu Vertical</b> - All in one vertical MegaMenu with great features.</li>
						<li style="font-family: 'Roboto', sans-serif;color:#000000;font-size:13px; font-weight:300;"><b>TG KingStore Pro MegaMenu</b> - With great features, giving you total control.</li>
						<li style="font-family: 'Roboto', sans-serif;color:#000000;font-size:13px; font-weight:300;"><b>TG KingStore Pro Newsletter</b> - will allow you to place a newsletter subscribe module at home page your website. Your customers will be able to subscribe to your newsletter without the need of creating an account with this module.</li>
						
						</ul>
						<br>
						</p>
						<p style="font-family: 'Roboto', sans-serif;color:#000000;font-size:13px; font-weight:300;line-height: 21px;">
						Here is how to purchase KingStore Pro:
						<ul>
						<li style="font-family: 'Roboto', sans-serif;color:#000000;font-size:13px; font-weight:300;">Visit <a href="http://themeglobal.com">our site.</a></li>
						<li style="font-family: 'Roboto', sans-serif;color:#000000;font-size:13px; font-weight:300;">Choose a plan that fits your needs best. Starts at <b>$59</b>. Satisfaction Guaranteed! Get 100% complete access to our entire collection for the price of one!</li>
						<li style="font-family: 'Roboto', sans-serif;color:#000000;font-size:13px; font-weight:300;">Make your payment via PayPal.</li>
						<li style="font-family: 'Roboto', sans-serif;color:#000000;font-size:13px; font-weight:300;">You can start downloading all of our templates instantly, after your payment has been completed.</li>
						</ul>
						</p>
						
					</div>
					
					
					<!-- Compressor Code -->
					
					<div id="tab_compressor_code" class="tab-content">
					
						<!-- Status -->
						<?php if($compressor_code_status == 0) { echo '<div class="status status-off" title="0" rel="compressor_code_status"></div>'; } else { echo '<div class="status status-on" title="1" rel="compressor_code_status"></div>'; } ?>
						
						<input name="compressor_code_status" value="<?php echo $compressor_code_status; ?>" id="compressor_code_status" type="hidden" />
						
						<p style="font-family: 'Roboto', sans-serif;color:#000000;font-size:13px; font-weight:300;line-height: 21px;">The content of css and js files are placed in a single file, delete spaces, which allows for faster page loading. Changes made when this option is enabled will be visible after an hour.</p>
						
					</div>
					
					<!-- End Compressor Code -->
					
					<!-- Compressor Code -->
					
					<div id="tab_install_data" class="tab-content">

						<p style="font-family: 'Roboto', sans-serif;color:#000000;font-size:14px;line-height: 21px;">If you want to make your shop look exactly like our demo. Install sample data.</p>

						<h4>Install all modules:</h4>
						
						<div class="input" style="border: none;">
							<p style="width:320px">All TG KingStore Lite Modules:</p>
							<input type="submit" name="install_tg_kspro_all_module" class="button-install" onclick="return confirm('Are you sure you want to install sample data?')" value="">
							
							<div class="clear"></div>
						</div>
						
						<h4 style="margin-top: 50px;">Install sample data per module:</h4>
						
						<div class="input">
							<p style="width:320px">TG KingStore Lite Revolution Slider:</p>
							<input type="submit" name="install_tg_kspro_revolution_slider" class="button-install" onclick="return confirm('Are you sure you want to install sample data?')" value="">
							
							<div class="clear"></div>
						</div>
						
						<div class="input">
							<p style="width:320px">TG KingStore Lite Filter Product:</p>
							<input type="submit" name="install_tg_kspro_filter_product" class="button-install" onclick="return confirm('Are you sure you want to install sample data?')" value="">
							
							<div class="clear"></div>
						</div>
						
						<div class="input">
							<p style="width:320px">Other Modules:</p>
							<input type="submit" name="install_tg_other_module" class="button-install" onclick="return confirm('Are you sure you want to install sample data?')" value="">
							
							<div class="clear"></div>
						</div>
						
					</div>
					
					<!-- End Compressor Code -->
										
					<p style="font-size:1px;line-height:1px;height:1px;clear:both;margin:0px;padding:0px;"></p>
				
				</div>
				
				<!-- End Tabs -->
				
				<!-- Buttons -->
				
				<div class="buttons"><input type="submit" name="button-save" class="button-save" value=""></div>
				
				<!-- End Buttons -->
			
			</div>
		
		</div>
		<!-- End Content -->
		<?php } else { ?>
			<div class="content">
				<div style="padding:20px 40px;text-align:center;">
					You need to add or active skin.
				</div>
			</div>
		<?php } ?>
		
	</form>
	
</div>
<!-- End Theme Options -->

</div>

<!-- END #CONTENT -->

 <script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#widget_custom_content_<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#custom_footer1_content_<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#custom_footer2_content_<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>
//--></script> 
 
 <script type="text/javascript"><!--
 $('.customblocktabs a').tabs();
 //--></script> 


<script type="text/javascript">

$(document).ready(function() {

	$('.color_input input').ColorPicker({
		onChange: function (hsb, hex, rgb, el) {
			$(el).val("#" +hex);
			$(el).css("border-right", "20px solid #" + hex);
		},
		onShow: function (colpkr) {
			$(colpkr).show();
			return false;
		},
		onHide: function (colpkr) {
			$(colpkr).hide();
			return false;
		}
	});
});
</script>
<script type="text/javascript"><!--
$(document).ready(function(){ 
	$('#tabs a').tabs();
	if($.cookie('tabs_cookie') > 0) {
		$('#tabs a').eq($.cookie('tabs_cookie')).trigger("click");
	}
	$('#tabs a').click(function() {
		var element_index = $('#tabs a').index(this);
		$.cookie('tabs_cookie', element_index); 
	});
	
	$('#tabs_design a').tabs();
	if($.cookie('tabs_design_cookie') > 0) {
		$('#tabs_design a').eq($.cookie('tabs_design_cookie')).trigger("click");
	}
	$('#tabs_design a').click(function() {
		var element_index = $('#tabs_design a').index(this);
		$.cookie('tabs_design_cookie', element_index); 
	});
	
	$('#tabs_footer a').tabs();
	if($.cookie('tabs_footer_cookie') > 0) {
		$('#tabs_footer a').eq($.cookie('tabs_footer_cookie')).trigger("click");
	}
	$('#tabs_footer a').click(function() {
		var element_index = $('#tabs_footer a').index(this);
		$.cookie('tabs_footer_cookie', element_index); 
	});
	
	$('#tabs_general a').tabs();
	if($.cookie('tabs_general_cookie') > 0) {
		$('#tabs_general a').eq($.cookie('tabs_general_cookie')).trigger("click");
	}
	$('#tabs_general a').click(function() {
		var element_index = $('#tabs_general a').index(this);
		$.cookie('tabs_general_cookie', element_index); 
	});
	
	$('#tabs_widgets a').tabs();
	if($.cookie('tabs_widgets_cookie') > 0) {
		$('#tabs_widgets a').eq($.cookie('tabs_widgets_cookie')).trigger("click");
	}
	$('#tabs_widgets a').click(function() {
		var element_index = $('#tabs_widgets a').index(this);
		$.cookie('tabs_widgets_cookie', element_index); 
	});
	
	$('#tabs_custom_code a').tabs();
	if($.cookie('tabs_custom_code_cookie') > 0) {
		$('#tabs_custom_code a').eq($.cookie('tabs_custom_code_cookie')).trigger("click");
	}
	$('#tabs_custom_code a').click(function() {
		var element_index = $('#tabs_custom_code a').index(this);
		$.cookie('tabs_custom_code_cookie', element_index); 
	});
	
	$('#tabs_custom_block a').tabs();
	if($.cookie('tabs_custom_block') > 0) {
		$('#tabs_custom_block a').eq($.cookie('tabs_custom_block')).trigger("click");
	}
	$('#tabs_custom_block a').click(function() {
		var element_index = $('#tabs_custom_block a').index(this);
		$.cookie('tabs_custom_block', element_index); 
	});
});
//--></script> 

<script type="text/javascript">
jQuery(document).ready(function($) {
	
	$('#theme-options').on('click', '.status', function () {
		
		var styl = $(this).attr("rel");
		var co = $(this).attr("title");
		
		if(co == 1) {
		
			$(this).removeClass('status-on');
			$(this).addClass('status-off');
			$(this).attr("title", "0");

			$("#"+styl+"").val(0);
		
		}
		
		if(co == 0) {
		
			$(this).addClass('status-on');
			$(this).removeClass('status-off');
			$(this).attr("title", "1");

			$("#"+styl+"").val(1);
		
		}
		
	});

});	
</script>
<script type="text/javascript">
$(document).ready(function() {
	
	$('#theme-options').on('change', 'select.select-page-width', function () {
		$("select.select-page-width option:selected").each(function() {
			if($(this).val() == 2) {
				$(".page-width").show();
			} else {
				$(".page-width").hide();
			}
		});
	});
	
	$('#theme-options').on('change', '.input-subtle-pattern', function () {
		$("#content").css("background-image", "url(../image/subtle_patterns/" + $(this).val() + ")");
	});
	
});
</script>
<?php echo $footer; ?>
