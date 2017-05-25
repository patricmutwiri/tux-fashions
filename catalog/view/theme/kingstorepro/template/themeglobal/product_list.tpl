<div class="product-list"<?php if($theme_options->get('default_list_grid') == '1') { echo ' style="display:none;"'; } ?>>
  	<?php foreach ($products as $product) { ?>
  	<!-- Product -->
  	<div>
  		<div class="row">
  			<div class="image col-sm-3">
  				<?php if($product['special'] && $theme_options->get( 'display_text_sale' ) != '0') { ?>
  					<?php $text_sale = 'Sale';
  					if($theme_options->get( 'sale_text', $config->get( 'config_language_id' ) ) != '') {
  						$text_sale = $theme_options->get( 'sale_text', $config->get( 'config_language_id' ) );
  					} ?>
  					<?php if($theme_options->get( 'type_sale' ) == '1') { ?>
  					<?php $product_detail = $theme_options->getDataProduct( $product['product_id'] );
  					$roznica_ceny = $product_detail['price']-$product_detail['special'];
  					$procent = ($roznica_ceny*100)/$product_detail['price']; ?>
  					<div class="sale">-<?php echo round($procent); ?>%</div>
  					<?php } else { ?>
  					<div class="sale"><?php echo $text_sale; ?></div>
  					<?php } ?>
  				<?php } ?>
  				<?php if($product['thumb']) { ?>
  				<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
  				<?php } else { ?>
  				<a href="<?php echo $product['href']; ?>"><img src="image/no_image.jpg" alt="<?php echo $product['name']; ?>" /></a>
  				<?php } ?>
  			</div>
  			
  			<div class="name-desc col-sm-6">
  				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
  				<div class="description"><?php echo $product['description']; ?></div>
				<?php if ($theme_options->get( 'category_page_display_rating' ) != '0') { ?>
						<div class="rating-reviews clearfix">
							<div class="rating"><i class="fa fa-star<?php if($product['rating'] >= 1) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 2) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 3) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 4) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 5) { echo ' active'; } ?>"></i></div>
						</div>
					<?php } ?>
  				
  			</div>
  			
  			<div class="actions col-sm-3">
  				<div>
  					<div class="price">
  						<?php if (!$product['special']) { ?>
  						<?php echo $product['price']; ?>
  						<?php } else { ?>
  						<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
  						<?php } ?>
  					</div>
  					
  	
					<?php if($theme_options->get( 'category_page_display_add_to_compare' ) != '0' || $theme_options->get( 'category_page_display_add_to_wishlist' ) != '0') { ?>
						<div class="flybar">
							<?php if($theme_options->get( 'category_page_display_add_to_compare' ) != '0') { ?>
								<div class="compare">			
									<a onclick="compare.add('<?php echo $product['product_id']; ?>');" title="<?php if($theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to compare'; } ?>" class="fa  fa-external-link product-icon"></a></a>	
								</div>
							<?php } ?>
						
							<?php if($theme_options->get( 'category_page_display_add_to_wishlist' ) != '0') { ?>
								<div class="wishlist">
									<a onclick="wishlist.add('<?php echo $product['product_id']; ?>');" title="<?php if($theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to wishlist'; } ?>" class="fa fa-heart-o product-icon"></a></a>	
								</div>
							<?php } ?>

						</div>
					<?php } ?>
					
					<?php if($theme_options->get( 'category_page_display_add_to_cart' ) != '0') { ?>
						<div class="add-to-cart"><a onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button"><span><?php if($theme_options->get( 'add_to_cart_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_cart_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to cart'; } ?></span></a></div>
					<?php } ?>

					
  				</div>
  			</div>
  		</div>
  	</div>
  	<?php } ?>
  </div>