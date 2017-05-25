
<?php 
if($registry->has('theme_options') == true) { 
	$theme_options = $registry->get('theme_options');
	$config = $registry->get('config');
	require_once( DIR_TEMPLATE.$config->get($config->get('config_theme') . '_directory')."/lib/module.php" );
	$modules = new Modules($registry);
	
	$language_id = $config->get( 'config_language_id' );
	$customfooter = $theme_options->get( 'customfooter' );
	if(!isset($customfooter[$language_id])) {
		$customfooter[$language_id] = array(
			'facebook_status' => 0,
			'contact_status' => 0
		);
	}


			$grids = 3; $columns = 0;  
			if($customfooter[$language_id]['contact_status'] == '1') { $columns++; } 
			if($theme_options->get( 'custom_footer1_status' ) == '1') { $columns++; }
			if($theme_options->get( 'custom_footer2_status' ) == '1') { $columns++; }
			if($columns == 1) { $grids = 25; }
			if($columns == 2) { $grids = 2; }

	
	?>

	
	
	<!-- FOOTER
		================================================== -->
	<div class="footer full-width">
				<div class="container">
					<?php 
					$footer_top = $modules->getModules('footer_top');
					if( count($footer_top) ) { 
						foreach ($footer_top as $module) {
							echo $module;
						}
					} ?>
					<div class="row">
					
						<?php if($theme_options->get( 'custom_footer1_status' ) == 1) { ?>
							<div class="col-sm-<?php echo $grids; ?> col-xs-6 footer-column">
									<?php $lang_id = $config->get( 'config_language_id' ); ?>
									<?php $custom_content = $theme_options->get( 'custom_footer1_content' ); ?>
									<?php if(isset($custom_content[$lang_id])) echo html_entity_decode($custom_content[$lang_id]); ?>
							</div>
						<?php } ?>
						
						<?php if($theme_options->get( 'custom_footer2_status' ) == 1) { ?>
							<div class="col-sm-<?php echo $grids; ?> col-xs-6 footer-column">
									<?php $lang_id = $config->get( 'config_language_id' ); ?>
									<?php $custom_content = $theme_options->get( 'custom_footer2_content' ); ?>
									<?php if(isset($custom_content[$lang_id])) echo html_entity_decode($custom_content[$lang_id]); ?>
							</div>
						<?php } ?>
						
						
					
						<?php if($customfooter[$language_id]['contact_status'] == '1') { ?>
						<!-- Contact -->
						<div class="col-sm-<?php echo $grids; ?> col-xs-6 footer-column">
							<?php if($customfooter[$language_id]['contact_title'] != '') { ?>
							<h4><?php echo $customfooter[$language_id]['contact_title']; ?></h4>
							<?php } ?>
							<ul class="contact-us clearfix">
								<?php if($customfooter[$language_id]['contact_phone'] != '' || $customfooter[$language_id]['contact_phone2'] != '') { ?>
								<!-- Phone -->
								<li>
									<i class="fa fa-phone" style="font-size: 17px;"></i>
									<p>
										<?php if($customfooter[$language_id]['contact_phone'] != '') { ?>
											<?php echo $customfooter[$language_id]['contact_phone']; ?><br>
										<?php } ?>
										
									</p>
									
									
									<?php if($customfooter[$language_id]['contact_phone2'] != '') { ?>
											<i class="fa fa-mobile"></i>
											<p><?php echo $customfooter[$language_id]['contact_phone2']; ?></p>
										<?php } ?>
								</li>
								<?php } ?>
								<?php if($customfooter[$language_id]['contact_email'] != '') { ?>
								<!-- Email -->
								<li>
									<i class="fa fa-envelope" style="font-size: 14px;"></i>
									<p>
										<?php if($customfooter[$language_id]['contact_email'] != '') { ?>
											<span><?php echo $customfooter[$language_id]['contact_email']; ?></span><br>
										<?php } ?>
									</p>
								</li>
								<?php } ?>
								<?php if($customfooter[$language_id]['contact_skype'] != '') { ?>
								<!-- Skype -->
								<li>
									<i class="fa fa-skype" style="font-size: 16px;"></i>
									<p>
										<?php if($customfooter[$language_id]['contact_skype'] != '') { ?>
											<?php echo $customfooter[$language_id]['contact_skype']; ?><br>
										<?php } ?>
									</p>
								</li>
								<?php } ?>
								<?php if($customfooter[$language_id]['contact_location'] != '') { ?>
								<!-- Location -->
								<li>
									<i class="fa fa-home" style="font-size: 16px;"></i>
									<p>
										<?php if($customfooter[$language_id]['contact_location'] != '') { ?>
											<?php echo $customfooter[$language_id]['contact_location']; ?><br>
										<?php } ?>
									</p>
								</li>
								<?php } ?>
								<?php if($customfooter[$language_id]['contact_hours'] != '') { ?>
								<!-- Location -->
								<li>
									<i class="fa fa-clock-o" style="font-size: 16px;"></i>
									<p>
										<?php if($customfooter[$language_id]['contact_hours'] != '') { ?>
											<?php echo $customfooter[$language_id]['contact_hours']; ?><br>
										<?php } ?>
									</p>
								</li>
								<?php } ?>
							</ul>
						</div>
						<?php } ?>
						
						<!-- Information -->
						<div class="col-sm-<?php echo $grids; ?> col-xs-6 footer-column">
							<h4><?php echo $text_information; ?></h4>
							
							<ul>
								<?php foreach ($informations as $information) { ?>
								<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
								<?php } ?>
							</ul>
						</div>
						
						<!-- Customer Service -->
						<div class="col-sm-<?php echo $grids; ?> col-xs-6 footer-column">
							<h4><?php echo $text_service; ?></h4>
							
							<ul>
								<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
								<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
								<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
							</ul> 
						</div>
						
						<!-- Extras -->
						<div class="col-sm-<?php echo $grids; ?> col-xs-6 footer-column">
							<h4><?php echo $text_extra; ?></h4>
							
							<ul>
								<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
								<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
								<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
								<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
							</ul>
						</div>
						
						<!-- My Account -->
						<div class="col-sm-<?php echo $grids; ?> col-xs-6 footer-column">
							<h4><?php echo $text_account; ?></h4>
							
							<ul>
								<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
								<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
								<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
								<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
							</ul>
						</div>
					
				
					</div>
					
				</div>
	</div>
	
	<!-- COPYRIGHT
		================================================== -->
			<div class="copyright">
					<div class="footerdiv text-left pull-left col-xs-12 col-md-4">&copy; <?php echo $config->get( 'config_name' ); ?></div>
					<div class="footerdiv text-center col-xs-12 col-md-4 xcontainer xpattern">
					<?php if(is_array($theme_options->get( 'payment' ))) { if($theme_options->get( 'payment_status' ) != '0') { ?>
						<ul class="copyright-right">
							<?php foreach($theme_options->get( 'payment' ) as $payment) { 
								echo '<li>';
								if($payment['link'] != '') {
									$new_tab = false;
									if($payment['new_tab'] == 1) {
										$new_tab = ' target="_blank"';
									}
									echo '<a href="' .$payment['link']. '"'.$new_tab.'>';
								}
								echo '<img src="image/' .$payment['img']. '" alt="' .$payment['name']. '">';
								if($payment['link'] != '') {
									echo '</a>';
								}
								echo '</li>'; 
							} ?>
						</ul>
					<?php } } ?>	
					</div>
					
					<div class="footerdiv text-right pull-right col-xs-12 col-md-4">Built by <a target="_blank" href="http://patric.xyz">Patrick / tux</a></div>
			</div>
	<script type="text/javascript" src="catalog/view/theme/<?php echo $config->get($config->get('config_theme') . '_directory'); ?>/js/megamenu.js"></script>
</div>

<a href="#" class="scrollup"><i class="fa fa-caret-up"></i>Top</a>
</div>
<?php } ?>
</body>
</html>