<?php 
if($registry->has('theme_options') == true) { 
	$theme_options = $registry->get('theme_options');
	$config = $registry->get('config');
	$language_id = $config->get( 'config_language_id' );
	$customfooter = $theme_options->get( 'customfooter' );
	if(!isset($customfooter[$language_id])) {
		$customfooter[$language_id] = array(
			'facebook_status' => 0,
			'contact_status' => 0
		);
	}
$class = 3; 
$id = rand(0, 5000)*rand(0, 5000); 
$all = 4; 
$row = 4; 

if($theme_options->get( 'gallery_per_pow' ) == 6) { $class = 2; }
if($theme_options->get( 'gallery_per_pow' ) == 5) { $class = 25; }
if($theme_options->get( 'gallery_per_pow' ) == 3) { $class = 4; }

if($theme_options->get( 'gallery_per_pow' ) > 1) { $row = $theme_options->get( 'gallery_per_pow' ); $all = $theme_options->get( 'gallery_per_pow' ); } 
?>
<?php } ?>

<?php echo $header;
$theme_options = $registry->get('theme_options');
$config = $registry->get('config'); ?>
<?php 
$grid_center = 12; 
if($column_left != '') { 
	$grid_center = $grid_center-3; 
}

if($column_right != '') { 
	$grid_center = $grid_center-3; 
} 

require_once( DIR_TEMPLATE.$config->get($config->get('config_theme') . '_directory')."/lib/module.php" );
$modules_old_opencart = new Modules($registry); ?>

<!-- MAIN CONTENT
	================================================== -->
<div class="main-content full-width home">
			<div class="container">
				
					<div class="row" style="margin-bottom: 20px;">				
						<?php 
						$headerleft = $modules_old_opencart->getModules('header_left');
						if( count($headerleft) ) { ?>
						<div class="col-sm-3" id="header_left">
							<?php
							foreach ($headerleft as $module) {
								echo $module;
							}
							?>
						</div>
						<?php } ?>
					
						<?php $grid_center = 12; if( count($headerleft) ) { $grid_center = 9; } ?>
						<div class="col-sm-<?php echo $grid_center; ?>">
							
							<div class="row">
								<?php 
								$grid_header_top = 12; 
								$grid_content_right = 3;
								$header_right = $modules_old_opencart->getModules('header_right'); 
								if( count($header_right) ) {
									if($grid_center == 9) {
										$grid_header_top = 8;
										$grid_content_right = 4;
									} else {
										$grid_header_top = 9;
										$grid_content_right = 3;
									}
								}
								?>
								<div class="col-sm-<?php echo $grid_header_top; ?> tg-padding">
									<?php 
									$header_top = $modules_old_opencart->getModules('header_top');
									if( count($header_top) ) { 
										foreach ($header_top as $module) {
											echo $module;
										}
									} ?>
								</div>
								
								<?php if( count($header_right) ) { ?> 
								<div class="col-sm-<?php echo $grid_content_right; ?>" id="header_right">
									<?php foreach ($header_right as $module) {
										echo $module;
									} ?>
								</div>
								<?php } ?>
							</div>
						</div>
					</div>
				
				<div class="row" style="margin-bottom: 10px;">						
								<div class="col-sm-12">
									<?php 
									$top_content = $modules_old_opencart->getModules('top_content');
									if( count($top_content) ) { 
										foreach ($top_content as $module) {
											echo $module;
										}
									} ?>
								</div>				
				</div>
				
				<div class="row">				
						<?php 
						$columnleft = $modules_old_opencart->getModules('column_left');
						if( count($columnleft) ) { ?>
						<div class="col-sm-3" id="column_left">
							<?php
							foreach ($columnleft as $module) {
								echo $module;
							}
							?>
						</div>
						<?php $grid_center = 12; if( count($columnleft) ) { $grid_center = 9; } ?>
						<div class="col-sm-<?php echo $grid_center; ?>">
							
							<div class="row">
								<?php 
								$grid_content_top = 12; 
								$grid_content_right = 3;
								$column_right = $modules_old_opencart->getModules('column_right'); 
								if( count($column_right) ) {
									if($grid_center == 9) {
										$grid_content_top = 8;
										$grid_content_right = 4;
									} else {
										$grid_content_top = 9;
										$grid_content_right = 3;
									}
								}
								?>
								<div class="col-sm-<?php echo $grid_content_top; ?>">
									<?php 
									$content_top = $modules_old_opencart->getModules('content_top');
									if( count($content_top) ) { 
										foreach ($content_top as $module) {
											echo $module;
										}
									} ?>
								</div>
								
								<?php if( count($column_right) ) { ?> 
								<div class="col-sm-<?php echo $grid_content_right; ?>" id="column_right">
									<?php foreach ($column_right as $module) {
										echo $module;
									} ?>
								</div>
								<?php } ?>
							</div>
						</div>
						<?php } ?>
					
						
				</div>
					
					
				
					
					
					
				
			</div>
		
					<!-- Middle Left Slider ->
					<?php $tg_middle_left = $modules_old_opencart->getModules('tg_middle_left'); ?>
						<?php  if(count($tg_middle_left)) { ?>
						<!-- Slider -->
						<div class="col-sm-6 slider-middle-bottom" style="padding-left: 0px; padding-right: 0px;">
									<?php foreach($tg_middle_left as $module) { ?>
									<?php echo $module; ?>
									<?php } ?>
						</div>
					<?php } ?>
					
					<!-- Middle Right Slider ->
					<?php $tg_middle_right = $modules_old_opencart->getModules('tg_middle_right'); ?>
						<?php  if(count($tg_middle_right)) { ?>
						<!-- Slider -->
						<div class="col-sm-6 slider-middle-bottom" style="padding-left: 0px; padding-right: 0px;">
									<?php foreach($tg_middle_right as $module) { ?>
									<?php echo $module; ?>
									<?php } ?>
						</div>
					<?php } ?>
		
		<!--Social -->
									
									<?php if($customfooter[$language_id]['facebook_status'] == '1') { ?>
									<div class="container social-holder" style="clear:both;">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 aboutus-holder" style="text-align: center;">
											
												<?php if($customfooter[$language_id]['aboutus_title'] != '') { ?>
												<span class="aboutus-title"><?php echo $customfooter[$language_id]['aboutus_title']; ?></span>
												<?php } ?>
												<p class="aboutus-text"><?php echo html_entity_decode($customfooter[$language_id]['aboutus_text']); ?></p>
						
											</div>
											
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 social-holder">
											
													<?php if($customfooter[$language_id]['social_title'] != '') { ?>
														<span class="aboutus-title"><?php echo $customfooter[$language_id]['social_title']; ?></span>
													<?php } ?>
												
													<!-- Facebook -->
																<?php if($customfooter[$language_id]['facebook_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['facebook_link']; ?>" class="fa fa-facebook facebook" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>
																
																<?php if($customfooter[$language_id]['twitter_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['twitter_link']; ?>" class="fa fa-twitter twitter" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['instagram_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['instagram_link']; ?>" class="fa fa-instagram instagram" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																	
																<?php if($customfooter[$language_id]['googleplus_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['googleplus_link']; ?>" class="fa fa-google-plus googleplus" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['pinterest_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['pinterest_link']; ?>" class="fa fa- fa-pinterest pinterest" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['youtube_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['youtube_link']; ?>" class="fa fa- fa-youtube youtube" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['flickr_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['flickr_link']; ?>" class="fa fa- fa-flickr flickr" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['vimeo_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['vimeo_link']; ?>" class="fa fa-  fa-vimeo-square vimeo" target="_blank" style="font-size: 18px; "></a>
																
																<?php } ?>	
																
																<?php if($customfooter[$language_id]['tumblr_link'] != '') { ?>
																	
																		<a href="<?php echo $customfooter[$language_id]['tumblr_link']; ?>" class="fa fa- fa-tumblr tumblr" target="_blank" style="font-size: 18px; "></a>
																	
																<?php } ?>	

											</div>
											
										</div>	
									</div>		
									<?php } ?>
		
					<!-- Content Bottom -->
					<?php 
						$contentbottom = $modules_old_opencart->getModules('content_bottom');
						if( count($contentbottom) ) { ?>
							<div class="bottom-holder" style="clear: both;">	
								<div class="container">
									<div class="row">	
										<div class="col-sm-12">	
											
												<?php
												foreach ($contentbottom as $module) {
													echo $module;
												}
												?>
											
										</div>
									</div>
								</div>
							</div>
					<?php } ?>
					
					<!-- Bottom Slider Position -->

						<?php $slideshow_bottom = $modules_old_opencart->getModules('slideshow_bottom'); ?>
						<?php  if(count($slideshow_bottom)) { ?>
						<!-- Slider -->
						<div id="slider" class="full-width" style="margin-bottom: 0px!important;">
									<?php foreach($slideshow_bottom as $module) { ?>
									<?php echo $module; ?>
									<?php } ?>
						</div>
						<?php } ?>
			

<?php echo $footer; ?>