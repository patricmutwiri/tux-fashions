<?php $custom_css = false; ?>
<div class="<?php if($slider['settings']['layout_type'] == 1) { echo 'container'; } else { echo 'fullwidth'; } ?>">
	<div class="fullwidthbanner-container slider-container-<?php echo $slider['id']; ?>">
		<div class="fullwidthbanner slider-<?php echo $slider['id']; ?>">
			<ul>
				<?php foreach($slider['content'] as $sliders) {
					if($sliders[$language_id]['status'] == 1) {
						$description = false; 
						$link = false;
						$image = $sliders[$language_id]['slider'];

						if($sliders[$language_id]['link'] != '') {
							$link = ' data-link="'.$sliders[$language_id]['link'].'"';
						}
						
						if(isset($sliders[$language_id]['elements'])) {
							if(is_array($sliders[$language_id]['elements'])) {
								foreach($sliders[$language_id]['elements'] as $element) {
									if($element['status'] == 1) {
										$content_element = html_entity_decode($element['text']);
										$element_class = $element['element_class'];
										$element_class .= ' '.$element['animation_class'];
										$custom_css .= $element['style']."\n";
										
										if($element['element_type'] == 'image') {
											$content_element = '';
											
											if($element['image_url'] != '') {
												$target = false;
												if($element['image_url_new_tab'] == '1') {
													$target = 'target="_blank"';
												}
												$content_element .= '<a href="'.$element['image_url'].'" '.$target.'>';
											}
																						
											$content_element .= '<img src="image/'.$element['image'].'" alt="">';
											
											if($element['image_url'] != '') {
												$content_element .= '</a>';
											}
										}
										
										$description .= '<div class="caption '.$element_class.'" data-x="'.$element['x'].'" data-y="'.$element['y'].'" data-speed="'.$element['speed'].'" data-start="'.$element['start'].'" data-easing="'.$element['easing'].'" data-endspeed="'.$element['speed'].'" data-endeasing="'.$element['endeasing'].'">'.$content_element.'</div>';
									}
								}
							}
						}
						
						echo '<li data-transition="'.$sliders[$language_id]['transition_effect'].'" data-slotamount="10" data-masterspeed="300"'.$link.'><img src="image/'.$image.'" data-fullwidthcentering="on">'.$description.'</li>';
					}
				} ?>
			</ul>
		</div>
	</div>
</div>

<style type="text/css">
	
	<?php echo $custom_css; ?>
	
	.slider-container-<?php echo $slider['id']; ?>{ max-height:<?php echo $slider['settings']['slider_height']; ?>px !important; }

</style>

			<!--
			##############################
			 - ACTIVATE THE BANNER HERE -
			##############################
			-->
			<script type="text/javascript">
			
				var api;
				jQuery(document).ready(function() {
					 api =  jQuery('.slider-<?php echo $slider['id']; ?>').revolution(
									{
										delay:<?php echo $slider['settings']['slider_speed']*1000; ?>,
										startheight:<?php echo $slider['settings']['slider_height']; ?>,
										startwidth:<?php echo $slider['settings']['slider_width']; ?>,
										onHoverStop:"on",						// Stop Banner Timet at Hover on Slide on/off
			
										thumbWidth:100,							// Thumb With and Height and Amount (only if navigation Tyope set to thumb !)
										thumbHeight:50,
										thumbAmount:3,
			
										hideThumbs:1,
										navigationType:"bullet",					//bullet, thumb, none, both	 (No Shadow in Fullwidth Version !)
										navigationArrows:"verticalcentered",		//nexttobullets, verticalcentered, none
										navigationStyle:"round",				//round,square,navbar
			
										touchenabled:"on",						// Enable Swipe Function : on/off
			
										navOffsetHorizontal:0,
										navOffsetVertical:20,
			
										stopAtSlide:-1,							// Stop Timer if Slide "x" has been Reached. If stopAfterLoops set to 0, then it stops already in the first Loop at slide X which defined. -1 means do not stop at any slide. stopAfterLoops has no sinn in this case.
										stopAfterLoops:-1,						// Stop Timer if All slides has been played "x" times. IT will stop at THe slide which is defined via stopAtSlide:x, if set to -1 slide never stop automatic
			
										hideCaptionAtLimit:0,					// It Defines if a caption should be shown under a Screen Resolution ( Basod on The Width of Browser)
										hideAllCaptionAtLilmit:0,				// Hide all The Captions if Width of Browser is less then this value
										hideSliderAtLimit:0,					// Hide the whole slider, and stop also functions if Width of Browser is less than this value
			
			
										fullWidth:"on",
			
										shadow:0								//0 = no Shadow, 1,2,3 = 3 Different Art of Shadows -  (No Shadow in Fullwidth Version !)
									});
				});

			</script>