<?php
$theme_options = $registry->get('theme_options');
$config = $registry->get('config');
?>

<!-- Product -->
<div class="product clearfix">
	<div class="left">
		<?php if ($product['thumb']) { ?>
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
			
			<div class="image">
				
				

			<div class="flybar">
				
				<?php if($theme_options->get( 'category_page_display_add_to_compare' ) != '0') { ?>
					<div class="compare">			
						<a onclick="compare.add('<?php echo $product['product_id']; ?>');" title="<?php if($theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_compare_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to compare'; } ?>" class="fa  fa-external-link product-icon"></a></a>	
					</div>
				<?php } ?>
				
				<?php if($theme_options->get( 'category_page_display_quickview' ) != '0') { ?>
					<div class="quickview">
						<a rel="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" class="fa fa-search"></a>
					</div>
				<?php } ?>

				<?php if($theme_options->get( 'category_page_display_add_to_wishlist' ) != '0') { ?>
					<div class="wishlist">
						<a onclick="wishlist.add('<?php echo $product['product_id']; ?>');" title="<?php if($theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_wishlist_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to wishlist'; } ?>" class="fa fa-heart-o product-icon"></a></a>	
					</div>
				<?php } ?>
				
				<?php if($theme_options->get( 'category_page_display_add_to_cart' ) != '0') { ?>
					<div class="addtocart">
					<a onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button"><span><?php if($theme_options->get( 'add_to_cart_text', $config->get( 'config_language_id' ) ) != '') { echo $theme_options->get( 'add_to_cart_text', $config->get( 'config_language_id' ) ); } else { echo 'Add to cart'; } ?></span></a>
					</div>
				<?php } ?>
			</div>

				
				<a href="<?php echo $product['href']; ?>">
					<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"/>
				</a>
			</div>
		<?php } else { ?>
			<div class="image">
				<?php if($theme_options->get( 'quick_view' ) != '0') { ?>
				<div class="quickview">
					<a rel="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" class="fa  fa-eye"></a>
				</div>
				<?php } ?>
				
				<a href="<?php echo $product['href']; ?>"><img src="image/no_image.jpg" alt="<?php echo $product['name']; ?>" /></a>
			</div>
		<?php } ?>
	</div>
	<div class="right">
		<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		<div class="price">
			<?php if (!$product['special']) { ?>
			<?php echo $product['price']; ?>
			<?php } else { ?>
			<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
			<?php } ?>
		</div>
		<?php if ($theme_options->get( 'category_page_display_rating' ) != '0') { ?>
		<div class="rating"><i class="fa fa-star<?php if($product['rating'] >= 1) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 2) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 3) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 4) { echo ' active'; } ?>"></i><i class="fa fa-star<?php if($product['rating'] >= 5) { echo ' active'; } ?>"></i></div>
		<?php } ?>
		
	</div>
</div>