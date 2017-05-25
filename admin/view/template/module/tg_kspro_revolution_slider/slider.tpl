<?php echo $header; ?><?php echo $column_left; ?>
<div id="content"><div class="container-fluid">
	<div class="page-header">
	     <h1>TG KingStore Pro Revolution Slider</h1>
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
	
	 <?php $elements = 1; ?>
	
	<!-- Revolution slider -->
	<div class="set-size" id="revolution-slider">
		
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<?php if(isset($slider_id)) { ?>
			<input type="hidden" name="slider_id" value="<?php echo $slider_id; ?>">
			<?php } ?>
			<!-- Content -->
			<div class="content">
				<div>
					<div class="bg-tabs clearfix">
						<!-- Tabs module -->
						<div id="tabs_slider">
							<a href="#tab-generaloptions">General options</a>
							<?php $module_row = 1; ?>
							<?php foreach ($sliders as $slider) { ?>
							<a href="#tab-slide-<?php echo $module_row; ?>" id="slide-<?php echo $module_row; ?>">Slide <?php echo $module_row; ?> &nbsp;<img src="view/image/module_template/delete2.png"  alt="" onclick="$('#tabs_slider a:first').trigger('click'); $('#slide-<?php echo $module_row; ?>').remove(); $('#tab-slide-<?php echo $module_row; ?>').remove(); return false;" /></a>
							<?php $module_row++; ?>
							<?php } ?>
							<span id="slide-add">Add Slide &nbsp;<img src="view/image/module_template/add2.png" alt="" onclick="addSlide();" /></span>
						</div>
						
						<div class="tab-content2" id="tab-generaloptions">
							<h4>General settings</h4>
							
							<!-- Input -->
							<div class="input clearfix">
								<p>Slider name</p>
								<input type="text" name="slider_name" value="<?php echo $slider_name; ?>" style="width:155px">
							</div>
							
							<!-- Input -->
							<div class="input clearfix">
								<p>Width slider (px)</p>
								<input type="text" name="slider_width" value="<?php echo $slider_width; ?>" style="width:155px">
							</div>
							
							<!-- Input -->
							<div class="input clearfix">
								<p>Height slider (px)</p>
								<input type="text" name="slider_height" value="<?php echo $slider_height; ?>" style="width:155px">
							</div>
							
							<!-- Input -->
							<div class="input clearfix">
								<p>Slideshow speed</p>
								<select name="slider_speed">
									<option value="4" <?php if($slider_speed =='4'){echo ' selected="selected"';} ?>>4000</option>
									<option value="5" <?php if($slider_speed =='5'){echo ' selected="selected"';} ?>>5000</option>
									<option value="6" <?php if($slider_speed =='6'){echo ' selected="selected"';} ?>>6000</option>
									<option value="7" <?php if($slider_speed =='7'){echo ' selected="selected"';} ?>>7000</option>
									<option value="8" <?php if($slider_speed =='8'){echo ' selected="selected"';} ?>>8000</option>
									<option value="9" <?php if($slider_speed =='9' || $slider_speed < 1){echo ' selected="selected"';} ?>>9000</option>
									<option value="10" <?php if($slider_speed =='10'){echo ' selected="selected"';} ?>>10000</option>
									<option value="11" <?php if($slider_speed =='11'){echo ' selected="selected"';} ?>>11000</option>
									<option value="12" <?php if($slider_speed =='12'){echo ' selected="selected"';} ?>>12000</option>
								</select>
							</div>
							
							<!-- Input -->
							<div class="input clearfix">
								<p>Layout Type</p>
								<select name="layout_type">
									<option value="0" <?php if($layout_type == '0'){echo ' selected="selected"';} ?>>Full width</option>
									<option value="1" <?php if($layout_type == '1'){echo ' selected="selected"';} ?>>Fixed</option>
								</select>
							</div>
							
						
						</div>
						
						<?php $module_row = 1; ?>
						<?php foreach ($sliders as $slider) { ?>
						<div class="tab-content" id="tab-slide-<?php echo $module_row; ?>">
							<div id="tab-slider-<?php echo $module_row; ?>-language" class="tab-slider-language">
							<?php foreach ($languages as $language) { ?>
								<a href="#tab_slider_<?php echo $module_row; ?>_language_<?php echo $language['language_id']; ?>"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /><span><?php echo $language['name']; ?></span></a>
							<?php } ?>
							</div>
							
							<?php foreach ($languages as $language) { ?>
							<?php $language_id = $language['language_id']; ?>
							<div id="tab_slider_<?php echo $module_row; ?>_language_<?php echo $language_id; ?>" class="tab-content3">
							
										<!-- Status -->
										
										<?php if(isset($slider[$language_id]['status'])) { ?>
										<?php if($slider[$language_id]['status'] == 1) { echo '<div class="status status-on" title="1" rel="slider_'.$module_row.'_'.$language_id.'_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="slider_'.$module_row.'_'.$language_id.'_status"></div>'; } ?>
										
										<input name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][status]" value="<?php echo $slider[$language_id]['status']; ?>" id="slider_<?php echo $module_row; ?>_<?php echo $language_id; ?>_status" type="hidden" />
										<?php } else { ?>
										<?php echo '<div class="status status-off" title="0" rel="slider_'.$module_row.'_'.$language_id.'_status"></div>'; ?>
										<input name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][status]" value="0" id="slider_<?php echo $module_row; ?>_<?php echo $language_id; ?>_status" type="hidden" />
										<?php } ?>
										
										<!-- Input -->
										<div class="input clearfix">
											<p>Image:</p>
											<div class="image">
												<?php if(isset($slider[$language_id]['slider'])) { ?>
													<?php if ($slider[$language_id]['slider']) { ?>
													<a href="" id="thumb-<?php echo $module_row; ?>-<?php echo $language_id; ?>" class="img-thumbnail img-edit" data-toggle="image"><img src="../image/<?php echo $slider[$language_id]['slider']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
													<?php } else { ?>
													<a href="" id="thumb-<?php echo $module_row; ?>-<?php echo $language_id; ?>" class="img-thumbnail img-edit" data-toggle="image"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
													<?php } ?>
													<input type="hidden" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][slider]" value="<?php echo $slider[$language_id]['slider']; ?>" id="input-<?php echo $module_row; ?>-<?php echo $language_id; ?>" />
												<?php } else { ?>
													<a href="" id="thumb-<?php echo $module_row; ?>-<?php echo $language_id; ?>" class="img-thumbnail img-edit" data-toggle="image"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
													<input type="hidden" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][slider]" value="" id="input-<?php echo $module_row; ?>-<?php echo $language_id; ?>" />
												<?php } ?>
											</div>
										</div>
										
										<!-- Input -->
										<div class="input clearfix">
											<p>Transition slider effect:</p>
											<select name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][transition_effect]" style="float:right;margin-right:0px;width:362px">
												<?php if(isset($slider[$language_id]['transition_effect'])) { ?>
										<option value="boxslide"<?php if($slider[$language_id]['transition_effect'] == 'boxslide') { echo ' selected="selected"'; } ?>>boxslide</option>
										<option value="boxfade"<?php if($slider[$language_id]['transition_effect'] == 'boxfade') { echo ' selected="selected"'; } ?>>boxfade</option>
										<option value="slotzoom-horizontal"<?php if($slider[$language_id]['transition_effect'] == 'slotzoom-horizontal') { echo ' selected="selected"'; } ?>>slotzoom-horizontal</option>
										<option value="slotslide-horizontal"<?php if($slider[$language_id]['transition_effect'] == 'slotslide-horizontal') { echo ' selected="selected"'; } ?>>slotslide-horizontal</option>
										<option value="slotfade-horizontal"<?php if($slider[$language_id]['transition_effect'] == 'slotfade-horizontal') { echo ' selected="selected"'; } ?>>slotfade-horizontal</option>
										<option value="slotzoom-vertical"<?php if($slider[$language_id]['transition_effect'] == 'slotzoom-vertical') { echo ' selected="selected"'; } ?>>slotzoom-vertical</option>
										<option value="slotslide-vertical"<?php if($slider[$language_id]['transition_effect'] == 'slotslide-vertical') { echo ' selected="selected"'; } ?>>slotslide-vertical</option>
										<option value="slotfade-vertical"<?php if($slider[$language_id]['transition_effect'] == 'slotfade-vertical') { echo ' selected="selected"'; } ?>>slotfade-vertical</option>
										<option value="curtain-1"<?php if($slider[$language_id]['transition_effect'] == 'curtain-1') { echo ' selected="selected"'; } ?>>curtain-1</option>
										<option value="curtain-2"<?php if($slider[$language_id]['transition_effect'] == 'curtain-2') { echo ' selected="selected"'; } ?>>curtain-2</option>
										<option value="curtain-3"<?php if($slider[$language_id]['transition_effect'] == 'curtain-3') { echo ' selected="selected"'; } ?>>curtain-3</option>
										<option value="slideleft"<?php if($slider[$language_id]['transition_effect'] == 'slideleft') { echo ' selected="selected"'; } ?>>slideleft</option>
										<option value="slideright"<?php if($slider[$language_id]['transition_effect'] == 'slideright') { echo ' selected="selected"'; } ?>>slideright</option>
										<option value="slideup"<?php if($slider[$language_id]['transition_effect'] == 'slideup') { echo ' selected="selected"'; } ?>>slideup</option>
										<option value="slidedown"<?php if($slider[$language_id]['transition_effect'] == 'slidedown') { echo ' selected="selected"'; } ?>>slidedown</option>
										<option value="fade"<?php if($slider[$language_id]['transition_effect'] == 'fade') { echo ' selected="selected"'; } ?>>fade</option>
										<option value="random"<?php if($slider[$language_id]['transition_effect'] == 'random') { echo ' selected="selected"'; } ?>>random</option>
										<option value="slidehorizontal"<?php if($slider[$language_id]['transition_effect'] == 'slidehorizontal') { echo ' selected="selected"'; } ?>>slidehorizontal</option>
										<option value="slidevertical"<?php if($slider[$language_id]['transition_effect'] == 'slidevertical') { echo ' selected="selected"'; } ?>>slidevertical</option>
										<option value="papercut"<?php if($slider[$language_id]['transition_effect'] == 'papercut') { echo ' selected="selected"'; } ?>>papercut</option>
										<option value="flyin"<?php if($slider[$language_id]['transition_effect'] == 'flyin') { echo ' selected="selected"'; } ?>>flyin</option>
										<option value="turnoff"<?php if($slider[$language_id]['transition_effect'] == 'turnoff') { echo ' selected="selected"'; } ?>>turnoff</option>
										<option value="cube"<?php if($slider[$language_id]['transition_effect'] == 'cube') { echo ' selected="selected"'; } ?>>cube</option>
										<option value="3dcurtain-vertical"<?php if($slider[$language_id]['transition_effect'] == '3dcurtain-vertical') { echo ' selected="selected"'; } ?>>3dcurtain-vertical</option>
										<option value="3dcurtain-horizontal"<?php if($slider[$language_id]['transition_effect'] == '3dcurtain-horizontal') { echo ' selected="selected"'; } ?>>3dcurtain-horizontal</option>
												<?php } else { ?>
										  <option value="boxslide">boxslide</option>
										  <option value="boxfade">boxfade</option>
										  <option value="slotzoom-horizontal">slotzoom-horizontal</option>
										  <option value="slotslide-horizontal">slotslide-horizontal</option>
										  <option value="slotfade-horizontal">slotfade-horizontal</option>
										  <option value="slotzoom-vertical">slotzoom-vertical</option>
										  <option value="slotslide-vertical">slotslide-vertical</option>
										  <option value="slotfade-vertical">slotfade-vertical</option>
										  <option value="curtain-1">curtain-1</option>
										  <option value="curtain-2">curtain-2</option>
										  <option value="curtain-3">curtain-3</option>
										  <option value="slideleft">slideleft</option>
										  <option value="slideright">slideright</option>
										  <option value="slideup">slideup</option>
										  <option value="slidedown">slidedown</option>
										  <option value="fade">fade</option>
										  <option value="random">random</option>
										  <option value="slidehorizontal">slidehorizontal</option>
										  <option value="slidevertical">slidevertical</option>
										  <option value="papercut">papercut</option>
										  <option value="flyin">flyin</option>
										  <option value="turnoff">turnoff</option>
										  <option value="cube">cube</option>
										  <option value="3dcurtain-vertical">3dcurtain-vertical</option>
										  <option value="3dcurtain-horizontal">3dcurtain-horizontal</option>
										  <?php } ?>
											
											</select>

										</div>
										<!-- End Input -->
										
										<!-- Input -->
										<div class="input clearfix">
										
											<p>Link:</p>
											<?php if(isset($slider[$language_id]['link'])) { ?>
											<input type="text" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][link]" value="<?php echo $slider[$language_id]['link']; ?>" style="float:right;margin-right:0px;width:362px" />
											<?php } else { ?>
											<input type="text" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][link]" value="" style="float:right;margin-right:0px;width:332px" />
											<?php } ?>
										
											<div class="clear"></div>
										
										</div>
										<!-- End Input -->
										
										<h4 style="margin-top:20px">Add elements to the slider</h4>
										
										<div id="slider_<?php echo $module_row; ?>_<?php echo $language_id; ?>_elements" class="tabs_add_element clearfix">
											<?php if(isset($slider[$language_id]['elements'])) { ?>
												<?php $i = 1; $element = $slider[$language_id]['elements']; ?>
												<?php foreach($element as $element) { ?>
												<a href="#slider-<?php echo $module_row; ?>-<?php echo $language_id; ?>-element-<?php echo $i; ?>" id="element-<?php echo $elements; ?>"><?php echo $i; ?> &nbsp;<img src="view/image/module_template/delete2.png" alt="" onclick="$('#slider_<?php echo $module_row; ?>_<?php echo $language_id; ?>_elements a:first').trigger('click'); $('#element-<?php echo $elements; ?>').remove(); $('#slider-<?php echo $module_row; ?>-<?php echo $language_id; ?>-element-<?php echo $i; ?>').remove(); return false;" /></a>
												<?php $i++; $elements++; ?>
												<?php } ?>
											<?php } ?>
											<img src="view/image/module_template/add2.png" alt="" onclick="addElement(<?php echo $module_row; ?>, <?php echo $language_id; ?>);">
										</div>
										
										<?php if(isset($slider[$language_id]['elements'])) { ?>
											<?php $i = 1; $element = $slider[$language_id]['elements']; ?>
											<?php foreach($element as $element) { ?>
											<div id="slider-<?php echo $module_row; ?>-<?php echo $language_id; ?>-element-<?php echo $i; ?>" style="padding-top:20px">
											
												<?php if(isset($element['status'])) { ?>
													<?php if($element['status'] == 1) { echo '<div class="status status-on" title="1" rel="slider_'.$module_row.'_'.$language_id.'_element_'.$i.'_status"></div>'; } else { echo '<div class="status status-off" title="0" rel="slider_'.$module_row.'_'.$language_id.'_element_'.$i.'_status"></div>'; } ?>
													<input name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][status]" value="<?php echo $element['status']; ?>" id="slider_<?php echo $module_row; ?>_<?php echo $language_id; ?>_element_<?php echo $i; ?>_status" type="hidden" />
												<?php } else { ?>
													<?php echo '<div class="status status-off" title="0" rel="slider_'.$module_row.'_'.$language_id.'_element_'.$i.'_status"></div>'; ?>
													<input name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][status]" value="0" id="slider_<?php echo $module_row; ?>_<?php echo $language_id; ?>_element_<?php echo $i; ?>_status" type="hidden" />
												<?php } ?>
												
												<div class="input clearfix">
													<p>Element type</p>
													<select name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][element_type]" class="element_type" title="<?php echo $module_row; ?>_<?php echo $language_id; ?>_<?php echo $i; ?>" style="float:right;margin-right:0px;width:444px;margin-left: -30px;position:relative">
														<?php if(isset($element['element_type'])) { ?>
														<option value="html" <?php if($element['element_type'] == 'html') { echo 'selected="selected"'; } ?>>Text / html</option>
														<option value="image" <?php if($element['element_type'] == 'image') { echo 'selected="selected"'; } ?>>Image</option>
														<?php } else { ?>
														<option value="html">Text / html</option>
														<option value="image">Image</option>
														<?php } ?>
													</select>
												</div>
												
												<div class="input clearfix element_<?php echo $module_row; ?>_<?php echo $language_id; ?>_<?php echo $i; ?>_image" <?php if($element['element_type'] != 'image') { echo 'style="display: none"'; } ?>>
													<p>Image</p>
													
													<div class="image" style="width: 424px">
														<input type="hidden" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][image]" value="<?php echo $element['image']; ?>" id="input-<?php echo $module_row; ?>-<?php echo $language_id; ?>-<?php echo $i; ?>" />
														
														<?php if($element['image'] == '') { ?>
															<a href="" id="thumb-<?php echo $module_row; ?>-<?php echo $language_id; ?>-<?php echo $i; ?>" class="img-thumbnail img-edit" data-toggle="image"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
														<?php } else { ?>
															<a href="" id="thumb-<?php echo $module_row; ?>-<?php echo $language_id; ?>-<?php echo $i; ?>" class="img-thumbnail img-edit" data-toggle="image"><img src="../image/<?php echo $element['image']; ?>" alt="" data-placeholder="<?php echo $placeholder; ?>" /></a>
														<?php } ?>
													</div>
												</div>
												
												<div class="input clearfix element_<?php echo $module_row; ?>_<?php echo $language_id; ?>_<?php echo $i; ?>_image" <?php if($element['element_type'] != 'image') { echo 'style="display: none"'; } ?>>
													<p>Image url</p>
													<input type="text" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][image_url]" value="<?php echo $element['image_url']; ?>" style="float:right;margin-right:0px;width:424px;position:relative" />
												</div>
												
												<div class="input clearfix element_<?php echo $module_row; ?>_<?php echo $language_id; ?>_<?php echo $i; ?>_image" <?php if($element['element_type'] != 'image') { echo 'style="display: none"'; } ?>>
													<p>Image url new tab</p>
													<?php if(isset($element['image_url_new_tab'])) { ?>
														<?php if($element['image_url_new_tab'] == 1) { echo '<div class="status status-on" title="1" rel="slider_'.$module_row.'_'.$language_id.'_element_'.$i.'_image_url_new_tab" style="float: left;position: relative"></div>'; } else { echo '<div class="status status-off" title="0" rel="slider_'.$module_row.'_'.$language_id.'_element_'.$i.'_image_url_new_tab" style="float: left;position: relative"></div>'; } ?>
														<input name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][image_url_new_tab]" value="<?php echo $element['image_url_new_tab']; ?>" id="slider_<?php echo $module_row; ?>_<?php echo $language_id; ?>_element_<?php echo $i; ?>_image_url_new_tab" type="hidden" />
													<?php } else { ?>
														<?php echo '<div class="status status-off" title="0" rel="slider_'.$module_row.'_'.$language_id.'_element_'.$i.'_image_url_new_tab" style="float: left;position: relative"></div>'; ?>
														<input name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][image_url_new_tab]" value="0" id="slider_<?php echo $module_row; ?>_<?php echo $language_id; ?>_element_<?php echo $i; ?>_image_url_new_tab" type="hidden" />
													<?php } ?>
												</div>
											
												<div class="input clearfix element_<?php echo $module_row; ?>_<?php echo $language_id; ?>_<?php echo $i; ?>_html" <?php if($element['element_type'] == 'image') { echo 'style="display: none"'; } ?>>
													<p>Text / html</p>
													<textarea rows="0" cols="0" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][text]"><?php echo $element['text']; ?></textarea>
												</div>
												
												<div class="input clearfix">
													<p>Element class</p>
													<input type="text" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][element_class]" value="<?php echo $element['element_class']; ?>" style="float:right;margin-right:0px;width:424px;margin-left: -30px;position:relative" />
												</div>
												
												<div class="input clearfix">
													<p>Element style (css)</p>
													<textarea rows="0" cols="0" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][style]"><?php echo $element['style']; ?></textarea>
												</div>
												
												<div class="input clearfix">
													<p>Animation class</p>
													<select name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][animation_class]" style="float:right;margin-right:0px;width:350px">
														<?php if(isset($element['animation_class'])) { ?>
															<option value="lfl"<?php if($element['animation_class'] == 'lfl') { echo ' selected="selected"'; } ?>>lfl</option>
															<option value="lft"<?php if($element['animation_class'] == 'lft') { echo ' selected="selected"'; } ?>>lft</option>
															<option value="lfr"<?php if($element['animation_class'] == 'lfr') { echo ' selected="selected"'; } ?>>lfr</option>
															<option value="lfb"<?php if($element['animation_class'] == 'lfb') { echo ' selected="selected"'; } ?>>lfb</option>
															<option value="fade"<?php if($element['animation_class'] == 'fade') { echo ' selected="selected"'; } ?>>fade</option>
															<option value="sft"<?php if($element['animation_class'] == 'sft') { echo ' selected="selected"'; } ?>>sft</option>
															<option value="sfr"<?php if($element['animation_class'] == 'sfr') { echo ' selected="selected"'; } ?>>sfr</option>
															<option value="sfb"<?php if($element['animation_class'] == 'sfb') { echo ' selected="selected"'; } ?>>sfb</option>
															<option value="sfl"<?php if($element['animation_class'] == 'sfl') { echo ' selected="selected"'; } ?>>sfl</option>
														<?php } else { ?>
															<option value="lfl">lfl</option>
															<option value="lft">lft</option>
															<option value="lfr">lfr</option>
															<option value="lfb">lfb</option>
															<option value="fade">fade</option>
															<option value="sft">sft</option>
															<option value="sfr">sfr</option>
															<option value="sfb">sfb</option>
															<option value="sfl">sfl</option>
														<?php } ?>
													</select>
												</div>
																							
												<div class="input clearfix">
													<p>Animation easing</p>
														<select name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][easing]" style="float:right;margin-right:0px;width:350px">
															<?php if(isset($element['easing'])) { ?>
															<option value="easeOutBack"<?php if($element['easing'] == 'easeOutBack') { echo ' selected="selected"'; } ?>>easeOutBack</option>
															<option value="easeInQuad"<?php if($element['easing'] == 'easeInQuad') { echo ' selected="selected"'; } ?>>easeInQuad</option>
															<option value="easeOutQuad"<?php if($element['easing'] == 'easeOutQuad') { echo ' selected="selected"'; } ?>>easeOutQuad</option>
															<option value="easeInOutQuad"<?php if($element['easing'] == 'easeInOutQuad') { echo ' selected="selected"'; } ?>>easeInOutQuad</option>
															<option value="easeInCubic"<?php if($element['easing'] == 'easeInCubic') { echo ' selected="selected"'; } ?>>easeInCubic</option>
															<option value="easeOutCubic"<?php if($element['easing'] == 'easeOutCubic') { echo ' selected="selected"'; } ?>>easeOutCubic</option>
															<option value="easeInOutCubic"<?php if($element['easing'] == 'easeInOutCubic') { echo ' selected="selected"'; } ?>>easeInOutCubic</option>
															<option value="easeInQuart"<?php if($element['easing'] == 'easeInQuart') { echo ' selected="selected"'; } ?>>easeInQuart</option>
															<option value="easeOutQuart"<?php if($element['easing'] == 'easeOutQuart') { echo ' selected="selected"'; } ?>>easeOutQuart</option>
															<option value="easeInOutQuart"<?php if($element['easing'] == 'easeInOutQuart') { echo ' selected="selected"'; } ?>>easeInOutQuart</option>
															<option value="easeInQuint"<?php if($element['easing'] == 'easeInQuint') { echo ' selected="selected"'; } ?>>easeInQuint</option>
															<option value="easeOutQuint"<?php if($element['easing'] == 'easeOutQuint') { echo ' selected="selected"'; } ?>>easeOutQuint</option>
															<option value="easeInOutQuint"<?php if($element['easing'] == 'easeInOutQuint') { echo ' selected="selected"'; } ?>>easeInOutQuint</option>
															<option value="easeInSine"<?php if($element['easing'] == 'easeInSine') { echo ' selected="selected"'; } ?>>easeInSine</option>
															<option value="easeOutSine"<?php if($element['easing'] == 'easeOutSine') { echo ' selected="selected"'; } ?>>easeOutSine</option>
															<option value="easeInOutSine"<?php if($element['easing'] == 'easeInOutSine') { echo ' selected="selected"'; } ?>>easeInOutSine</option>
															<option value="easeInExpo"<?php if($element['easing'] == 'easeInExpo') { echo ' selected="selected"'; } ?>>easeInExpo</option>
															<option value="easeOutExpo"<?php if($element['easing'] == 'easeOutExpo') { echo ' selected="selected"'; } ?>>easeOutExpo</option>
															<option value="easeInOutExpo"<?php if($element['easing'] == 'easeInOutExpo') { echo ' selected="selected"'; } ?>>easeInOutExpo</option>
															<option value="easeInCirc"<?php if($element['easing'] == 'easeInCirc') { echo ' selected="selected"'; } ?>>easeInCirc</option>
															<option value="easeOutCirc"<?php if($element['easing'] == 'easeOutCirc') { echo ' selected="selected"'; } ?>>easeOutCirc</option>
															<option value="easeInOutCirc"<?php if($element['easing'] == 'easeInOutCirc') { echo ' selected="selected"'; } ?>>easeInOutCirc</option>
															<option value="easeInElastic"<?php if($element['easing'] == 'easeInElastic') { echo ' selected="selected"'; } ?>>easeInElastic</option>
															<option value="easeOutElastic"<?php if($element['easing'] == 'easeOutElastic') { echo ' selected="selected"'; } ?>>easeOutElastic</option>
															<option value="easeInOutElastic"<?php if($element['easing'] == 'easeInOutElastic') { echo ' selected="selected"'; } ?>>easeInOutElastic</option>
															<option value="easeInBack"<?php if($element['easing'] == 'easeInBack') { echo ' selected="selected"'; } ?>>easeInBack</option>
															<option value="easeOutBack"<?php if($element['easing'] == 'easeOutBack') { echo ' selected="selected"'; } ?>>easeOutBack</option>
															<option value="easeInOutBack"<?php if($element['easing'] == 'easeInOutBack') { echo ' selected="selected"'; } ?>>easeInOutBack</option>
															<option value="easeInBounce"<?php if($element['easing'] == 'easeInBounce') { echo ' selected="selected"'; } ?>>easeInBounce</option>
															<option value="easeOutBounce"<?php if($element['easing'] == 'easeOutBounce') { echo ' selected="selected"'; } ?>>easeOutBounce</option>
															<option value="easeInOutBounce"<?php if($element['easing'] == 'easeInOutBounce') { echo ' selected="selected"'; } ?>>easeInOutBounce</option>
															<?php } else { ?>
															<option value="easeOutBack">easeOutBack</option>
															<option value="easeInQuad">easeInQuad</option>
															<option value="easeOutQuad">easeOutQuad</option>
															<option value="easeInOutQuad">easeInOutQuad</option>
															<option value="easeInCubic">easeInCubic</option>
															<option value="easeOutCubic">easeOutCubic</option>
															<option value="easeInOutCubic">easeInOutCubic</option>
															<option value="easeInQuart">easeInQuart</option>
															<option value="easeOutQuart">easeOutQuart</option>
															<option value="easeInOutQuart">easeInOutQuart</option>
															<option value="easeInQuint">easeInQuint</option>
															<option value="easeOutQuint">easeOutQuint</option>
															<option value="easeInOutQuint">easeInOutQuint</option>
															<option value="easeInSine">easeInSine</option>
															<option value="easeOutSine">easeOutSine</option>
															<option value="easeInOutSine">easeInOutSine</option>
															<option value="easeInExpo">easeInExpo</option>
															<option value="easeOutExpo">easeOutExpo</option>
															<option value="easeInOutExpo">easeInOutExpo</option>
															<option value="easeInCirc">easeInCirc</option>
															<option value="easeOutCirc">easeOutCirc</option>
															<option value="easeInOutCirc">easeInOutCirc</option>
															<option value="easeInElastic">easeInElastic</option>
															<option value="easeOutElastic">easeOutElastic</option>
															<option value="easeInOutElastic">easeInOutElastic</option>
															<option value="easeInBack">easeInBack</option>
															<option value="easeOutBack">easeOutBack</option>
															<option value="easeInOutBack">easeInOutBack</option>
															<option value="easeInBounce">easeInBounce</option>
															<option value="easeOutBounce">easeOutBounce</option>
															<option value="easeInOutBounce">easeInOutBounce</option>
															<?php } ?>
														</select>
												</div>
											
												<div class="input clearfix">
													<p>Animation endeasing</p>
														<select name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][endeasing]" style="float:right;margin-right:0px;width:350px">
															<?php if(isset($element['endeasing'])) { ?>
															<option value="easeOutBack"<?php if($element['endeasing'] == 'easeOutBack') { echo ' selected="selected"'; } ?>>easeOutBack</option>
															<option value="easeInQuad"<?php if($element['endeasing'] == 'easeInQuad') { echo ' selected="selected"'; } ?>>easeInQuad</option>
															<option value="easeOutQuad"<?php if($element['endeasing'] == 'easeOutQuad') { echo ' selected="selected"'; } ?>>easeOutQuad</option>
															<option value="easeInOutQuad"<?php if($element['endeasing'] == 'easeInOutQuad') { echo ' selected="selected"'; } ?>>easeInOutQuad</option>
															<option value="easeInCubic"<?php if($element['endeasing'] == 'easeInCubic') { echo ' selected="selected"'; } ?>>easeInCubic</option>
															<option value="easeOutCubic"<?php if($element['endeasing'] == 'easeOutCubic') { echo ' selected="selected"'; } ?>>easeOutCubic</option>
															<option value="easeInOutCubic"<?php if($element['endeasing'] == 'easeInOutCubic') { echo ' selected="selected"'; } ?>>easeInOutCubic</option>
															<option value="easeInQuart"<?php if($element['endeasing'] == 'easeInQuart') { echo ' selected="selected"'; } ?>>easeInQuart</option>
															<option value="easeOutQuart"<?php if($element['endeasing'] == 'easeOutQuart') { echo ' selected="selected"'; } ?>>easeOutQuart</option>
															<option value="easeInOutQuart"<?php if($element['endeasing'] == 'easeInOutQuart') { echo ' selected="selected"'; } ?>>easeInOutQuart</option>
															<option value="easeInQuint"<?php if($element['endeasing'] == 'easeInQuint') { echo ' selected="selected"'; } ?>>easeInQuint</option>
															<option value="easeOutQuint"<?php if($element['endeasing'] == 'easeOutQuint') { echo ' selected="selected"'; } ?>>easeOutQuint</option>
															<option value="easeInOutQuint"<?php if($element['endeasing'] == 'easeInOutQuint') { echo ' selected="selected"'; } ?>>easeInOutQuint</option>
															<option value="easeInSine"<?php if($element['endeasing'] == 'easeInSine') { echo ' selected="selected"'; } ?>>easeInSine</option>
															<option value="easeOutSine"<?php if($element['endeasing'] == 'easeOutSine') { echo ' selected="selected"'; } ?>>easeOutSine</option>
															<option value="easeInOutSine"<?php if($element['endeasing'] == 'easeInOutSine') { echo ' selected="selected"'; } ?>>easeInOutSine</option>
															<option value="easeInExpo"<?php if($element['endeasing'] == 'easeInExpo') { echo ' selected="selected"'; } ?>>easeInExpo</option>
															<option value="easeOutExpo"<?php if($element['endeasing'] == 'easeOutExpo') { echo ' selected="selected"'; } ?>>easeOutExpo</option>
															<option value="easeInOutExpo"<?php if($element['endeasing'] == 'easeInOutExpo') { echo ' selected="selected"'; } ?>>easeInOutExpo</option>
															<option value="easeInCirc"<?php if($element['endeasing'] == 'easeInCirc') { echo ' selected="selected"'; } ?>>easeInCirc</option>
															<option value="easeOutCirc"<?php if($element['endeasing'] == 'easeOutCirc') { echo ' selected="selected"'; } ?>>easeOutCirc</option>
															<option value="easeInOutCirc"<?php if($element['endeasing'] == 'easeInOutCirc') { echo ' selected="selected"'; } ?>>easeInOutCirc</option>
															<option value="easeInElastic"<?php if($element['endeasing'] == 'easeInElastic') { echo ' selected="selected"'; } ?>>easeInElastic</option>
															<option value="easeOutElastic"<?php if($element['endeasing'] == 'easeOutElastic') { echo ' selected="selected"'; } ?>>easeOutElastic</option>
															<option value="easeInOutElastic"<?php if($element['endeasing'] == 'easeInOutElastic') { echo ' selected="selected"'; } ?>>easeInOutElastic</option>
															<option value="easeInBack"<?php if($element['endeasing'] == 'easeInBack') { echo ' selected="selected"'; } ?>>easeInBack</option>
															<option value="easeOutBack"<?php if($element['endeasing'] == 'easeOutBack') { echo ' selected="selected"'; } ?>>easeOutBack</option>
															<option value="easeInOutBack"<?php if($element['endeasing'] == 'easeInOutBack') { echo ' selected="selected"'; } ?>>easeInOutBack</option>
															<option value="easeInBounce"<?php if($element['endeasing'] == 'easeInBounce') { echo ' selected="selected"'; } ?>>easeInBounce</option>
															<option value="easeOutBounce"<?php if($element['endeasing'] == 'easeOutBounce') { echo ' selected="selected"'; } ?>>easeOutBounce</option>
															<option value="easeInOutBounce"<?php if($element['endeasing'] == 'easeInOutBounce') { echo ' selected="selected"'; } ?>>easeInOutBounce</option>
															<?php } else { ?>
															<option value="easeOutBack">easeOutBack</option>
															<option value="easeInQuad">easeInQuad</option>
															<option value="easeOutQuad">easeOutQuad</option>
															<option value="easeInOutQuad">easeInOutQuad</option>
															<option value="easeInCubic">easeInCubic</option>
															<option value="easeOutCubic">easeOutCubic</option>
															<option value="easeInOutCubic">easeInOutCubic</option>
															<option value="easeInQuart">easeInQuart</option>
															<option value="easeOutQuart">easeOutQuart</option>
															<option value="easeInOutQuart">easeInOutQuart</option>
															<option value="easeInQuint">easeInQuint</option>
															<option value="easeOutQuint">easeOutQuint</option>
															<option value="easeInOutQuint">easeInOutQuint</option>
															<option value="easeInSine">easeInSine</option>
															<option value="easeOutSine">easeOutSine</option>
															<option value="easeInOutSine">easeInOutSine</option>
															<option value="easeInExpo">easeInExpo</option>
															<option value="easeOutExpo">easeOutExpo</option>
															<option value="easeInOutExpo">easeInOutExpo</option>
															<option value="easeInCirc">easeInCirc</option>
															<option value="easeOutCirc">easeOutCirc</option>
															<option value="easeInOutCirc">easeInOutCirc</option>
															<option value="easeInElastic">easeInElastic</option>
															<option value="easeOutElastic">easeOutElastic</option>
															<option value="easeInOutElastic">easeInOutElastic</option>
															<option value="easeInBack">easeInBack</option>
															<option value="easeOutBack">easeOutBack</option>
															<option value="easeInOutBack">easeInOutBack</option>
															<option value="easeInBounce">easeInBounce</option>
															<option value="easeOutBounce">easeOutBounce</option>
															<option value="easeInOutBounce">easeInOutBounce</option>
															<?php } ?>
														</select>
												</div>											
												<div class="input clearfix">
													<p>Animation speed</p>
													<input type="text" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][speed]" value="<?php echo $element['speed']; ?>" style="float:right;margin-right:0px;width:332px" />
												</div>
											
												<div class="input clearfix">
													<p>Animation delay</p>
													<input type="text" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][start]" value="<?php echo $element['start']; ?>" style="float:right;margin-right:0px;width:332px" />
												</div>
											
												<div class="input clearfix">
													<p>X</p>
													<input type="text" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][x]" value="<?php echo $element['x']; ?>" style="float:right;margin-right:0px;width:332px" />
												</div>
											
												<div class="input clearfix">
													<p>Y</p>
													<input type="text" name="slider[<?php echo $module_row; ?>][<?php echo $language_id; ?>][elements][<?php echo $i; ?>][y]" value="<?php echo $element['y']; ?>" style="float:right;margin-right:0px;width:332px" />
												</div>
											
											</div>
											<?php $i++; ?>
											<?php } ?>
										<?php } ?>
										
										<div id="slider_<?php echo $module_row; ?>_<?php echo $language_id; ?>_elements_add"></div>
										
										<script type="text/javascript">
										$('#slider_<?php echo $module_row; ?>_<?php echo $language_id; ?>_elements a').tabs();
										</script>	
										
							</div>
							<?php } ?>
							
							<script type="text/javascript"><!--
							
							$('#tab-slider-<?php echo $module_row; ?>-language a').tabs();
							
							//--></script> 
							
						</div>
						<?php $module_row++; ?>
						<?php } ?>
					</div>
					
					<div>
						<?php if(isset($slider_id)) { ?>
						<!-- Buttons -->
						<div class="buttons"><input type="submit" name="button-save" class="button-save" value=""></div>
						<?php } else { ?>
						<div class="buttons"><input type="submit" name="button-add" class="button-save" value=""></div>
						<?php } ?>
					</div>
				</div>
			</div>	
		</form>	
	</div>
</div>

<script type="text/javascript"><!--
$('#tabs_slider a').tabs();
//--></script> 

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addSlide() {
	html  = '<div id="tab-slide-' + module_row + '" class="tab-content">';
	html += '	<div id="tab-slider-'+ module_row +'-language" class="tab-slider-language">';
	<?php foreach ($languages as $language) { ?>
	html += '		<a href="#tab_slider_'+ module_row +'_language_<?php echo $language['language_id']; ?>"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" width="16px" height="11px" /><span><?php echo $language['name']; ?></span></a>';
	<?php } ?>
	html += '	</div>';
	<?php foreach ($languages as $language) { ?>
	html += '	<div id="tab_slider_'+ module_row +'_language_<?php echo $language['language_id']; ?>" class="tab-content3">';
	html += '		<div class="status status-off" title="0" rel="slider_' + module_row + '_<?php echo $language['language_id']; ?>_status"></div><input name="slider[' + module_row + '][<?php echo $language['language_id']; ?>][status]" value="0" id="slider_' + module_row + '_<?php echo $language['language_id']; ?>_status" type="hidden" />';
	
	html += '		<div class="input clearfix">';
	html += '			<p>Image:</p>';
	html += '			<div class="image">';
	html += '				<a href="" id="thumb-'+ module_row +'-<?php echo $language['language_id']; ?>" class="img-thumbnail img-edit" data-toggle="image"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>';
	html += '				<input type="hidden" name="slider['+ module_row +'][<?php echo $language['language_id']; ?>][slider]" value="" id="input-'+ module_row +'-<?php echo $language['language_id']; ?>" />';
	html += '			</div>';
	html += '		</div>';
	
	html += '		<div class="input clearfix">';
	html += '			<p>Transition slider effect:</p>';
	html += '			<select name="slider['+ module_row +'][<?php echo $language['language_id']; ?>][transition_effect]" style="float:right;margin-right:0px;width:362px">';
	html += '				<option value="boxslide">boxslide</option>';
	html += '				<option value="boxfade">boxfade</option>';
	html += '				<option value="slotzoom-horizontal">slotzoom-horizontal</option>';
	html += '				<option value="slotslide-horizontal">slotslide-horizontal</option>';
	html += '				<option value="slotfade-horizontal">slotfade-horizontal</option>';
	html += '				<option value="slotzoom-vertical">slotzoom-vertical</option>';
	html += '				<option value="slotslide-vertical">slotslide-vertical</option>';
	html += '				<option value="slotfade-vertical">slotfade-vertical</option>';
	html += '				<option value="curtain-1">curtain-1</option>';
	html += '				<option value="curtain-2">curtain-2</option>';
	html += '				<option value="curtain-3">curtain-3</option>';
	html += '				<option value="slideleft">slideleft</option>';
	html += '				<option value="slideright">slideright</option>';
	html += '				<option value="slideup">slideup</option>';
	html += '				<option value="slidedown">slidedown</option>';
	html += '				<option value="fade">fade</option>';
	html += '				<option value="random">random</option>';
	html += '				<option value="slidehorizontal">slidehorizontal</option>';
	html += '				<option value="slidevertical">slidevertical</option>';
	html += '				<option value="papercut">papercut</option>';
	html += '				<option value="flyin">flyin</option>';
	html += '				<option value="turnoff">turnoff</option>';
	html += '				<option value="cube">cube</option>';
	html += '				<option value="3dcurtain-vertical">3dcurtain-vertical</option>';
	html += '				<option value="3dcurtain-horizontal">3dcurtain-horizontal</option>';
	html += '			</select>';
	html += '		</div>';
	
	html += '		<div class="input clearfix">';
	html += '			<p>Link:</p>';
	html += '			<input type="text" name="slider['+ module_row +'][<?php echo $language['language_id']; ?>][link]" value="" style="float:right;margin-right:0px;width:362px">';
	html += '		</div>';
	
	html += '		<h4 style="margin-top:20px">Add elements to the slider</h4>';
	
	html += '		<div id="slider_'+module_row+'_<?php echo $language['language_id']; ?>_elements" class="tabs_add_element clearfix">';
	html += '			<img src="view/image/module_template/add2.png" alt="" onclick="addElement('+module_row+', <?php echo $language['language_id']; ?>);">';
	html += '		</div>';
	
	html += '		<div id="slider_'+module_row+'_<?php echo $language['language_id']; ?>_elements_add"></div>';
	
	html += '	</div>';
	<?php } ?>
	html += '</div>';
	
	$('.bg-tabs').append(html);
	
	$('#tab-slider-'+ module_row +'-language a').tabs();
	
	$('#slide-add').before('<a href="#tab-slide-' + module_row + '" id="slide-' + module_row + '">Slide ' + module_row + ' &nbsp;<img src="view/image/module_template/delete2.png" alt="" onclick="$(\'#tabs_slider a:first\').trigger(\'click\'); $(\'#slide-' + module_row + '\').remove(); $(\'#tab-slide-' + module_row + '\').remove(); return false;" /></a>');
	
	$('#tabs_slider a').tabs();
	
	$('#slide-' + module_row).trigger('click');
	
	module_row++;
}
//--></script> 

<script type="text/javascript">
jQuery(document).ready(function($) {

	$('#revolution-slider').on('click', '.status', function () {
		
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
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#revolution-slider').on('change', 'select.element_type', function () {
		var modules = $(this).attr("title");
		$('.element_' + modules + '_html').hide();
		$('.element_' + modules + '_image').hide();
		if($(this).find("option:selected").val() == 'html') {
			$('.element_' + modules + '_html').show();
		} else {
			$('.element_' + modules + '_image').show();
		}
	});
});

var elements = <?php echo $elements; ?>;
function addElement(slider_row, language) {
	html = '<div id="slider-' + slider_row + '-' + language + '-element-' + elements + '" style="padding-top:20px">';
	html += '	<div class="status status-off" title="0" rel="slider_' + slider_row + '_' + language + '_element_' + elements + '_status"></div><input name="slider[' + slider_row + '][' + language + '][elements][' + elements + '][status]" value="0" id="slider_' + slider_row + '_' + language + '_element_' + elements + '_status" type="hidden" />';
	
	html += '	<div class="input clearfix">';
	html += '		<p>Element type</p>';
	html += '		<select name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][element_type]" class="element_type" title="'+ slider_row +'_' + language + '_' + elements + '" style="float:right;margin-right:0px;width:444px;margin-left: -30px;position:relative">';
	html += '			<option value="html">Text / html</option>';
	html += '			<option value="image">Image</option>';
	html += '		</select>';
	html += '	</div>';
	
	html += '	<div class="input clearfix element_'+ slider_row +'_' + language + '_' + elements + '_image" style="display: none">';
	html += '		<p>Image</p>';
	html += '		<div class="image" style="width: 424px">';
	html += '			<a href="" id="thumb-'+ slider_row +'-' + language + '-' + elements + '" class="img-thumbnail img-edit" data-toggle="image"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>';
	html += '			<input type="hidden" name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][image]" value="" id="input-'+ slider_row +'-' + language + '-' + elements + '" />';
	html += '		</div>';
	html += '	</div>';
	
	html += '	<div class="input clearfix element_'+ slider_row +'_' + language + '_' + elements + '_image" style="display: none">';
	html += '		<p>Image url</p>';
	html += '		<input type="text" name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][image_url]" value="" style="float:right;margin-right:0px;width:424px;margin-left: -30px;position:relative" />';
	html += '	</div>';
	
	html += '	<div class="input clearfix element_'+ slider_row +'_' + language + '_' + elements + '_image" style="display: none">';
	html += '		<p>Image url new tab</p>';
	html += '		<div class="status status-off" title="0" rel="slider_' + slider_row + '_' + language + '_element_' + elements + '_image_url_new_tab" style="float: left;position: relative"></div><input name="slider[' + slider_row + '][' + language + '][elements][' + elements + '][image_url_new_tab]" value="0" id="slider_' + slider_row + '_' + language + '_element_' + elements + '_image_url_new_tab" type="hidden" />';
	html += '	</div>';
	
	html += '	<div class="input clearfix element_'+ slider_row +'_' + language + '_' + elements + '_html">';
	html += '		<p>Text / html</p>';
	html += '		<textarea rows="0" cols="0" name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][text]"></textarea>';
	html += '	</div>';
	
	html += '	<div class="input clearfix">';
	html += '		<p>Element class</p>';
	html += '		<input type="text" name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][element_class]" value="new_element_'+ slider_row +'_' + elements + '" style="float:right;margin-right:0px;width:424px;margin-left: -30px;position:relative" />';
	html += '	</div>';
	
	html += '	<div class="input clearfix">';
	html += '		<p>Element style (css)</p>';
	html += '		<textarea rows="0" cols="0" name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][style]">.new_element_'+ slider_row +'_' + elements + ' {\n width: auto;\n background: none;\n font-size: 100%;\n line-height: 1.3;\n font-family: Open Sans;\n}</textarea>';
	html += '	</div>';
	
	html += '	<div class="input clearfix">';
	html += '		<p>Animation class</p>';
	html += '		<select name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][animation_class]" style="float:right;margin-right:0px;width:350px">';
	html += '			<option value="lfl">lfl</option>';
	html += '			<option value="lft">lft</option>';
	html += '			<option value="lfr">lfr</option>';
	html += '			<option value="lfb">lfb</option>';
	html += '			<option value="fade">fade</option>';
	html += '			<option value="sft">sft</option>';
	html += '			<option value="sfr">sfr</option>';
	html += '			<option value="sfb">sfb</option>';
	html += '			<option value="sfl">sfl</option>';
	html += '		</select>';
	html += '	</div>';
	
	html += '	<div class="input clearfix">';
	html += '		<p>Animation easing</p>';
	html += '		<select name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][easing]" style="float:right;margin-right:0px;width:350px">';
	html += '			<option value="easeOutBack">easeOutBack</option>';
	html += '			<option value="easeInQuad">easeInQuad</option>';
	html += '			<option value="easeOutQuad">easeOutQuad</option>';
	html += '			<option value="easeInOutQuad">easeInOutQuad</option>';
	html += '			<option value="easeInCubic">easeInCubic</option>';
	html += '			<option value="easeOutCubic">easeOutCubic</option>';
	html += '			<option value="easeInOutCubic">easeInOutCubic</option>';
	html += '			<option value="easeInQuart">easeInQuart</option>';
	html += '			<option value="easeOutQuart">easeOutQuart</option>';
	html += '			<option value="easeInOutQuart">easeInOutQuart</option>';
	html += '			<option value="easeInQuint">easeInQuint</option>';
	html += '			<option value="easeOutQuint">easeOutQuint</option>';
	html += '			<option value="easeInOutQuint">easeInOutQuint</option>';
	html += '			<option value="easeInSine">easeInSine</option>';
	html += '			<option value="easeOutSine">easeOutSine</option>';
	html += '			<option value="easeInOutSine">easeInOutSine</option>';
	html += '			<option value="easeInExpo">easeInExpo</option>';
	html += '			<option value="easeOutExpo">easeOutExpo</option>';
	html += '			<option value="easeInOutExpo">easeInOutExpo</option>';
	html += '			<option value="easeInCirc">easeInCirc</option>';
	html += '			<option value="easeOutCirc">easeOutCirc</option>';
	html += '			<option value="easeInOutCirc">easeInOutCirc</option>';
	html += '			<option value="easeInElastic">easeInElastic</option>';
	html += '			<option value="easeOutElastic">easeOutElastic</option>';
	html += '			<option value="easeInOutElastic">easeInOutElastic</option>';
	html += '			<option value="easeInBack">easeInBack</option>';
	html += '			<option value="easeOutBack">easeOutBack</option>';
	html += '			<option value="easeInOutBack">easeInOutBack</option>';
	html += '			<option value="easeInBounce">easeInBounce</option>';
	html += '			<option value="easeOutBounce">easeOutBounce</option>';
	html += '			<option value="easeInOutBounce">easeInOutBounce</option>';
	html += '		</select>';
	html += '	</div>';
	
	html += '	<div class="input clearfix">';
	html += '		<p>Animation endeasing</p>';
	html += '		<select name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][endeasing]" style="float:right;margin-right:0px;width:350px">';
	html += '			<option value="easeOutBack">easeOutBack</option>';
	html += '			<option value="easeInQuad">easeInQuad</option>';
	html += '			<option value="easeOutQuad">easeOutQuad</option>';
	html += '			<option value="easeInOutQuad">easeInOutQuad</option>';
	html += '			<option value="easeInCubic">easeInCubic</option>';
	html += '			<option value="easeOutCubic">easeOutCubic</option>';
	html += '			<option value="easeInOutCubic">easeInOutCubic</option>';
	html += '			<option value="easeInQuart">easeInQuart</option>';
	html += '			<option value="easeOutQuart">easeOutQuart</option>';
	html += '			<option value="easeInOutQuart">easeInOutQuart</option>';
	html += '			<option value="easeInQuint">easeInQuint</option>';
	html += '			<option value="easeOutQuint">easeOutQuint</option>';
	html += '			<option value="easeInOutQuint">easeInOutQuint</option>';
	html += '			<option value="easeInSine">easeInSine</option>';
	html += '			<option value="easeOutSine">easeOutSine</option>';
	html += '			<option value="easeInOutSine">easeInOutSine</option>';
	html += '			<option value="easeInExpo">easeInExpo</option>';
	html += '			<option value="easeOutExpo">easeOutExpo</option>';
	html += '			<option value="easeInOutExpo">easeInOutExpo</option>';
	html += '			<option value="easeInCirc">easeInCirc</option>';
	html += '			<option value="easeOutCirc">easeOutCirc</option>';
	html += '			<option value="easeInOutCirc">easeInOutCirc</option>';
	html += '			<option value="easeInElastic">easeInElastic</option>';
	html += '			<option value="easeOutElastic">easeOutElastic</option>';
	html += '			<option value="easeInOutElastic">easeInOutElastic</option>';
	html += '			<option value="easeInBack">easeInBack</option>';
	html += '			<option value="easeOutBack">easeOutBack</option>';
	html += '			<option value="easeInOutBack">easeInOutBack</option>';
	html += '			<option value="easeInBounce">easeInBounce</option>';
	html += '			<option value="easeOutBounce">easeOutBounce</option>';
	html += '			<option value="easeInOutBounce">easeInOutBounce</option>';
	html += '		</select>';
	html += '	</div>';
	
	html += '	<div class="input clearfix">';
	html += '		<p>Animation speed</p>';
	html += '		<input type="text" name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][speed]" value="300" style="float:right;margin-right:0px;width:332px" />';
	html += '	</div>';
	
	html += '	<div class="input clearfix">';
	html += '		<p>Animation delay</p>';
	html += '		<input type="text" name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][start]" value="300" style="float:right;margin-right:0px;width:332px" />';
	html += '	</div>';
	
	html += '	<div class="input clearfix">';
	html += '		<p>X</p>';
	html += '		<input type="text" name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][x]" value="100" style="float:right;margin-right:0px;width:332px" />';
	html += '	</div>';
	
	html += '	<div class="input clearfix">';
	html += '		<p>Y</p>';
	html += '		<input type="text" name="slider['+ slider_row +'][' + language + '][elements][' + elements + '][y]" value="100" style="float:right;margin-right:0px;width:332px" />';
	html += '	</div>';
	
	html += '</div>';
	
	$('#slider_'+ slider_row +'_'+ language +'_elements > img').before('<a href="#slider-' + slider_row + '-' + language + '-element-' + elements + '" id="element-' + elements + '">' + elements + ' &nbsp;<img src="view/image/module_template/delete2.png" alt="" onclick="$(\'#slider_'+ slider_row +'_'+ language +'_elements a:first\').trigger(\'click\'); $(\'#element-' + elements+ '\').remove(); $(\'#slider-' + slider_row + '-' + language + '-element-' + elements + '\').remove(); return false;" /></a>');
	
	$('#slider_'+ slider_row +'_'+ language +'_elements_add').before(html);
	$('#slider_'+ slider_row +'_'+ language +'_elements a').tabs();	
	$('#element-' + elements).trigger('click');
	
	elements++;
}
</script>
<?php echo $footer; ?>