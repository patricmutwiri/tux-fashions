<?php echo $header; ?><?php echo $column_left; ?>
<div id="content"><div class="container-fluid">
	<div class="page-header">
	    <h1>TG KingStore MegaMenu Vertical</h1>
	    <ul class="breadcrumb">
		     <?php foreach ($breadcrumbs as $breadcrumb) { ?>
		      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		      <?php } ?>
	    </ul>
	  </div>
    
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:600,500,400' rel='stylesheet' type='text/css'>
	
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
	
	<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } elseif ($success) {  ?>
		<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } ?>
	<div class="set-size" id="tg_kspro_megamenu_vertical">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<div class="content">
				<div>
					<div class="background clearfix">
						<div class="left">
							<a href="<?php echo $action; ?>&action=create" class="create-new-item"></a>
							<?php echo $nestable_list; ?>
							<div id='sortDBfeedback' style="padding: 10px 0px 0px 0px"></div>
						</div>
						
						<?php if($action_type == 'create' || $action_type == 'edit') { ?>
						<div class="right">
							<?php if($action_type == 'edit') { ?>
							<h4>Edit item (ID: <?php echo $_GET['edit']; ?>)</h4>
							<input type="hidden" name="id" value="<?php echo $_GET['edit']; ?>" />
							<?php } else { ?>
							<h4>Create new item</h4>
							<?php } ?>
							
							<div class="input clearfix">
								<p>Name</p>
								<div class="list-language">
								<?php foreach ($languages as $language) { ?>
								<div class="language">
									<?php $language_id = $language['language_id']; ?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
									<input type="text" name="name[<?php echo $language_id; ?>]" <?php if(isset($name[$language_id])) { echo 'value="'.$name[$language_id].'"'; } ?>>
								</div>
								<?php } ?>
								</div>
							</div>
							
							
							<div class="input clearfix">
								<p>Description</p>
								<div class="list-language">
								<?php foreach ($languages as $language) { ?>
								<div class="language">
									<?php $language_id = $language['language_id']; ?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
									<input type="text" name="description[<?php echo $language_id; ?>]" <?php if(isset($description[$language_id])) { echo 'value="'.$description[$language_id].'"'; } ?>>
								</div>
								<?php } ?>
								</div>
							</div>
							
							
							<div class="input clearfix">
								<p>Icon</p>
								<div class="own_image clearfix">
									<input type="hidden" name="icon" value="<?php echo $icon; ?>" id="input-icon_img_preview" />
									
									<?php if($icon == '') { ?>
										<a href="" id="thumb-icon_img_preview" class="img-thumbnail img-edit" data-toggle="image"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
									<?php } else { ?>
										<a href="" id="thumb-icon_img_preview" class="img-thumbnail img-edit" data-toggle="image"><img src="../image/<?php echo $icon; ?>" data-placeholder="<?php echo $placeholder; ?>" alt="" /></a>
									<?php } ?>
								</div>
							</div>
							
							
							<div class="input clearfix">
								<p>Link</p>
								<input type="text" value="<?php echo $link; ?>" name="link">
							</div>
							
							
							<div class="input clearfix">
								<p>Link in new window</p>
								<select name="new_window">
									<?php if($new_window == 1) { ?>
									<option value="0">disabled</option>
									<option value="1" selected="selected">enabled</option>
									<?php } else { ?>
									<option value="0" selected="selected">disabled</option>
									<option value="1">enabled</option>
									<?php } ?>
								</select>
							</div>
							
							
							<div class="input clearfix">
								<p>Status</p>
								<select name="status">
									<?php if($status == 1) { ?>
									<option value="0">enabled</option>
									<option value="1" selected="selected">disabled</option>
									<?php } else { ?>
									<option value="0" selected="selected">enabled</option>
									<option value="1">disabled</option>
									<?php } ?>
								</select>
							</div>

							<div class="input clearfix">
								<p>Position</p>
								<select name="position">
									<?php if($position == 1) { ?>
									<option value="0">Left</option>
									<option value="1" selected="selected">Right</option>
									<?php } else { ?>
									<option value="0" selected="selected">Left</option>
									<option value="1">Right</option>
									<?php } ?>
								</select>
							</div>
							
							
							<div class="input clearfix">
								<p>Submenu width</p>
								<input type="text" name="submenu_width" value="<?php echo $submenu_width; ?>"> <div>Example: 100%, 250px</div>
							</div>
							
							
							<div class="input clearfix">
								<p>Display submenu on</p>
								<select name="display_submenu">
									<?php if($display_submenu == '0') { ?>
									<option value="0" selected="selected">Hover</option>
									<?php } else { ?>
									<option value="0">Hover</option>
									<?php } ?>
									<?php if($display_submenu == '2') { ?>
									<option value="2" selected="selected">Hover intent</option>
									<?php } else { ?>
									<option value="2">Hover intent</option>
									<?php } ?>
									<?php if($display_submenu == '1') { ?>
									<option value="1" selected="selected">Click</option>
									<?php } else { ?>
									<option value="1">Click</option>
									<?php } ?>
								</select>
							</div>
							
							<h5 style="margin-top:20px">Content item - content of these fields will only be displayed if the menu be set as submenu.</h5>
							
							<div class="input clearfix">
								<p>Content width</p>
								<select name="content_width">
									<?php for($i=1; $i<13; $i++) { ?>
									<option value="<?php echo $i; ?>" <?php if($i == $content_width) { echo 'selected="selected"'; } ?>><?php echo $i; ?>/12</option>
									<?php } ?>
								</select>
							</div>
							
							
							<div class="input clearfix">
								<p>Content type</p>
								<select name="content_type">
									<?php if($content_type != '0') { ?>
									<option value="0">HTML</option>
									<?php } else { ?>
									<option value="0" selected="selected">HTML</option>
									<?php } ?>
									<?php if($content_type != '1') { ?>
									<option value="1">Product</option>
									<?php } else { ?>
									<option value="1" selected="selected">Product</option>
									<?php } ?>
									<?php if($content_type != '2') { ?>
									<option value="2">Category</option>
									<?php } else { ?>
									<option value="2" selected="selected">Category</option>
									<?php } ?>
								</select>
							</div>
							
							<div id="content_type0"<?php if($content_type != '0') { ?> style="display:none"<?php } ?> class="content_type">
								<h5 style="margin-top:20px">HTML</h5>
								
								<div class="htmltabs htabs">
								<?php foreach ($languages as $language) { ?>
								<a href="#content_html_<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
								<?php } ?>
								</div>
								
								<?php foreach ($languages as $language) { $lang_id = $language['language_id']; ?>
								
								<div id="content_html_<?php echo $language['language_id']; ?>" class="content_html">
									
										<textarea name="content[html][text][<?php echo $language['language_id']; ?>]" id="content_html_text_<?php echo $language['language_id']; ?>" class="form-control"><?php if(isset($content['html']['text'][$lang_id])) { echo $content['html']['text'][$lang_id]; } ?></textarea>
								
								</div>
								<?php } ?>
							</div>
							
							<div id="content_type1"<?php if($content_type != '1') { ?> style="display:none"<?php } ?> class="content_type">
								<h5 style="margin-top:20px">Product</h5>
								
								
								<div class="input clearfix">
									<p>Products:<br><span style="font-size:11px;color:#808080">(Autocomplete)</span></p>
									<input type="hidden" name="content[product][id]" value="<?php echo $content['product']['id']; ?>" />
									<input type="text" id="product_autocomplete" name="content[product][name]" value="<?php echo $content['product']['name']; ?>">
								</div>
							</div>
							
							<div id="content_type2"<?php if($content_type != '2') { ?> style="display:none"<?php } ?> class="content_type">
								<h5 style="margin-top:20px">Categories</h5>
								
								
								<div class="input clearfix">
									<p>Add categories<br><span style="font-size:11px;color:#808080">(Autocomplete)</span></p>
									<input type="text" id="categories_autocomplete" value="">								
								</div>
								
								
								<div class="input clearfix">
									<p>Sort categories</p>
									<div class="cf nestable-lists">
										<div class="dd" id="sort_categories">
										    <ol class="dd-list">
										    	<?php echo $list_categories; ?>
										    </ol>
										</div>
										<input type="hidden" id="sort_categories_data" name="content[categories][categories]" value="<?php echo $content['categories']['categories']; ?>" />
									</div>
								</div>
								
								
								<div class="input clearfix">
									<p>Columns</p>
									<select name="content[categories][columns]">
										<?php if($content['categories']['columns'] != '1') { ?>
										<option value="1">1</option>
										<?php } else { ?>
										<option value="1" selected="selected">1</option>
										<?php } ?>
										<?php if($content['categories']['columns'] != '2') { ?>
										<option value="2">2</option>
										<?php } else { ?>
										<option value="2" selected="selected">2</option>
										<?php } ?>
										<?php if($content['categories']['columns'] != '3') { ?>
										<option value="3">3</option>
										<?php } else { ?>
										<option value="3" selected="selected">3</option>
										<?php } ?>
										<?php if($content['categories']['columns'] != '4') { ?>
										<option value="4">4</option>
										<?php } else { ?>
										<option value="4" selected="selected">4</option>
										<?php } ?>
										<?php if($content['categories']['columns'] != '5') { ?>
										<option value="5">5</option>
										<?php } else { ?>
										<option value="5" selected="selected">5</option>
										<?php } ?>
										<?php if($content['categories']['columns'] != '6') { ?>
										<option value="6">6</option>
										<?php } else { ?>
										<option value="6" selected="selected">6</option>
										<?php } ?>
									</select>
								</div>
								
								
								<div class="input clearfix" id="submenu-type">
									<p>Submenu type</p>
									<select name="content[categories][submenu]">
										<?php if($content['categories']['submenu'] != '1') { ?>
										<option value="1">Hover</option>
										<?php } else { ?>
										<option value="1" selected="selected">Hover</option>
										<?php } ?>
										<?php if($content['categories']['submenu'] != '2') { ?>
										<option value="2">Visible</option>
										<?php } else { ?>
										<option value="2" selected="selected">Visible</option>
										<?php } ?>
									</select>
								</div>
								
								
								<div class="input clearfix" <?php if($content['categories']['submenu'] != '2') { echo 'style="display:none"'; } ?> id="submenu-columns">
									<p>Submenu columns</p>
									<select name="content[categories][submenu_columns]">
										<?php if($content['categories']['submenu_columns'] != '1') { ?>
										<option value="1">1</option>
										<?php } else { ?>
										<option value="1" selected="selected">1</option>
										<?php } ?>
										<?php if($content['categories']['submenu_columns'] != '2') { ?>
										<option value="2">2</option>
										<?php } else { ?>
										<option value="2" selected="selected">2</option>
										<?php } ?>
										<?php if($content['categories']['submenu_columns'] != '3') { ?>
										<option value="3">3</option>
										<?php } else { ?>
										<option value="3" selected="selected">3</option>
										<?php } ?>
										<?php if($content['categories']['submenu_columns'] != '4') { ?>
										<option value="4">4</option>
										<?php } else { ?>
										<option value="4" selected="selected">4</option>
										<?php } ?>
										<?php if($content['categories']['submenu_columns'] != '5') { ?>
										<option value="5">5</option>
										<?php } else { ?>
										<option value="5" selected="selected">5</option>
										<?php } ?>
										<?php if($content['categories']['submenu_columns'] != '6') { ?>
										<option value="6">6</option>
										<?php } else { ?>
										<option value="6" selected="selected">6</option>
										<?php } ?>
									</select>
								</div>
							</div>
						</div>
						<?php } else { ?>
						<div class="right">
							<h4>Basic configuration</h4>
							
							<div class="input clearfix">
								<p>Status</p>
								<select name="status">
									<?php if ($status) { ?>
									<option value="1" selected="selected">Enabled</option>
									<option value="0">Disabled</option>
									<?php } else { ?>
									<option value="1">Enabled</option>
									<option value="0" selected="selected">Disabled</option>
									<?php } ?>
								</select>
							</div>
							
							
							<!-- Input -->
							<div class="input clearfix">
								<p>Heading Title</p>
								<div class="list-language">
								<?php foreach ($languages as $language) { ?>
								<div class="language">
									<?php $language_id = $language['language_id']; ?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" />
									<input type="text" name="heading_title[<?php echo $language_id; ?>]" <?php if(isset($heading_title[$language_id])) { echo 'value="'.$heading_title[$language_id].'"'; } ?>>
								</div>
								<?php } ?>
								</div>
							</div>
							
							
							<div class="input clearfix">
								<p>Position</p>
								<select name="position">
									<?php if ($position == 'header_left') { ?>
									<option value="header_left" selected="selected">Header left</option>
									<?php } else { ?>
									<option value="header_left">Header left</option>
									<?php } ?>
								</select>
							</div>
							
							
							
							
							<div class="input clearfix">
								<p>Layout</p>
								<select name="layout_id">
									<?php if (99999 == $layout_id) { ?>
									<option value="99999" selected="selected">All pages</option>
									<?php } else { ?>
									<option value="99999">All pages</option>
									<?php } ?>
									<?php foreach ($layouts as $layout) { ?>
									<?php if ($layout['layout_id'] == $layout_id) { ?>
									<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</div>
							
							
							<div class="input clearfix">
								<p>Sort order</p>
								<input type="text" name="sort_order" value="<?php echo $sort_order; ?>">
							</div>
						
							
							<h4 style="margin-top:20px">jQuery Animations</h4>
							
							<div class="input clearfix">
								<p>Animation</p>
								<div>
									<input type="radio" value="slide" name="animation" <?php if($animation == 'slide') { echo 'checked'; } ?>> Slide<br>
									<input type="radio" value="fade" name="animation" <?php if($animation == 'fade') { echo 'checked'; } ?>> Fade<br>
									<input type="radio" value="none" name="animation" <?php if($animation == 'none') { echo 'checked'; } ?>> None
								</div>
							</div>
							
							
							<div class="input clearfix">
								<p>Animation Time</p>
								<input type="text" name="animation_time" style="width:50px;margin-right:10px" value="<?php echo $animation_time; ?>">
								<div>ms</div>
							</div>
							
						</div>
						<?php } ?>
					</div>
					
					<div class="buttons">
						<?php if($action_type == 'create') { ?>
						<input type="submit" name="button-create" class="button-save" value="">
						<?php } elseif ($action_type == 'edit') { ?>
						<input type="submit" name="button-edit" class="button-save" value="">
						<?php } else { ?>
						<input type="submit" name="button-save" class="button-save" value="">
						<?php } ?>
					</div>
				</div>
			</div>
			<!-- End Content -->
		</form>
	</div>
 </div>
 
 <script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#content_html_text_<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>
//--></script> 
 
 <script type="text/javascript"><!--
 $('.htmltabs a').tabs();
 //--></script> 

 
<script type="text/javascript">
$(document).ready(function() {

	$("select[name=content_type]").change(function () {
		$("select[name=content_type] option:selected").each(function() {
			$(".content_type").hide();
			$("#content_type" + $(this).val()).show();
		});
	});
	
	$("#submenu-type").change(function () {
		$("#submenu-type option:selected").each(function() {
			if($(this).val() == 2) {
				$("#submenu-columns").show();
			} else {
				$("#submenu-columns").hide();
			}
		});
	});


	$('#product_autocomplete').autocomplete({
		delay: 500,
		source: function(request, response) {		
			$.ajax({
				url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $_GET['token']; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		select: function(item) {
			$('#product_autocomplete').val(item['label']);
			$('input[name=\'content[product][id]\']').val(item['value']);
			
			return false;
		},
		focus: function(event, ui) {
	      	return false;
	   	}
	});
	
	$('#categories_autocomplete').autocomplete({
		delay: 500,
		source: function(request, response) {		
			$.ajax({
				url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $_GET['token']; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['category_id']
						}
					}));
				}
			});
		},
		select: function(item) {
			$("#sort_categories > .dd-list").append('<li class="dd-item" data-id="' + item['value'] + '" data-name="' + item['label'] + '"><a class="icon-delete"></a><div class="dd-handle">' + item['label'] + '</div></li>');
			updateOutput2($('#sort_categories').data('output', $('#sort_categories_data')));
			return false;
		},
		focus: function(event, ui) {
	      	return false;
	   	}
	});
	
	function lagXHRobjekt() {
		var XHRobjekt = null;
		
		try {
			ajaxRequest = new XMLHttpRequest(); // Firefox, Opera, ...
		} catch(err1) {
			try {
				ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP"); // Noen IE v.
			} catch(err2) {
				try {
						ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP"); // Noen IE v.
				} catch(err3) {
					ajaxRequest = false;
				}
			}
		}
		return ajaxRequest;
	}
	
	
	function menu_updatesort(jsonstring) {
		mittXHRobjekt = lagXHRobjekt(); 
	
		if (mittXHRobjekt) {
			mittXHRobjekt.onreadystatechange = function() { 
				if(ajaxRequest.readyState == 4){
					var ajaxDisplay = document.getElementById('sortDBfeedback');
					ajaxDisplay.innerHTML = ajaxRequest.responseText;
				} 
			}
						
			ajaxRequest.open("GET", "index.php?route=module/tg_kspro_megamenu_vertical&token=<?php echo $_GET['token']; ?>&jsonstring=" + jsonstring, true);
			ajaxRequest.setRequestHeader("Content-Type", "application/json");
			ajaxRequest.send(null); 
		}
	}
	
	var updateOutput = function(e)
	{
	    var list   = e.length ? e : $(e.target),
	        output = list.data('output');
	    if (window.JSON) {
	        menu_updatesort(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
	    } else {
	        alert('JSON browser support required for this demo.');
	    }
	};
	
	$('#nestable').nestable({
		group: 1,
		maxDepth: 2
	}).on('change', updateOutput);
	
	updateOutput($('#nestable').data('output', $('#nestable-output')));
	
	
	<?php if($action_type == 'create' || $action_type == 'edit') { ?>
		var updateOutput2 = function(e)
		{
		    var list   = e.length ? e : $(e.target),
		        output = list.data('output');
		    if (window.JSON) {
		        output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
		    } else {
		        output.val('JSON browser support required for this demo.');
		    }
	};
		
		$('#sort_categories').nestable({
			group: 1,
			maxDepth: 5
		}).on('change', updateOutput2);
		
		updateOutput2($('#sort_categories').data('output', $('#sort_categories_data')));
		
		$('#sort_categories').on('click', '.icon-delete', function() {
			$(this).parent().remove();
			updateOutput2($('#sort_categories').data('output', $('#sort_categories_data')));
		});
	<?php } ?>
	
});
</script>
<?php echo $footer; ?>