<?php echo $header;
$theme_options = $registry->get('theme_options');
$config = $registry->get('config'); ?>
<?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_top.tpl'); ?>

  <?php if ($thumb || $description) { ?>
		<div class="category-info clearfix">
			<?php if ($thumb) { ?>
			<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
			<?php } ?>
			<?php if ($description) { ?>
			<?php echo $description; ?>
			<?php } ?>
		</div>
  <?php } ?>
  <?php if ($categories && $theme_options->get('refine_search_style') != '2') { ?>
			<h2 class="refine_search"><?php echo $text_refine; ?></h2>
			<div class="category-list<?php if ($theme_options->get('refine_search_style') == '1') { echo ' category-list-text-only'; } ?>">
				<div class="row">
				  <?php 
				  $class = 3; 
				  $row = 4; 
				  
				  if($theme_options->get( 'refine_search_number' ) == 2) { $class = 62; }
				  if($theme_options->get( 'refine_search_number' ) == 5) { $class = 25; }
				  if($theme_options->get( 'refine_search_number' ) == 3) { $class = 4; }
				  if($theme_options->get( 'refine_search_number' ) == 6) { $class = 2; }
				  
				  if($theme_options->get( 'refine_search_number' ) > 1) { $row = $theme_options->get( 'refine_search_number' ); } 
				  ?>
				  <?php $row_fluid = 0; foreach ($theme_options->refineSearch() as $category) { $row_fluid++; ?>
					<?php 
					if ($theme_options->get('refine_search_style') != '1') {
						$width = 250;
						$height = 250;
						if($theme_options->get( 'refine_image_width' ) > 20) { $width = $theme_options->get( 'refine_image_width' ); }
						if($theme_options->get( 'refine_image_height' ) > 20) { $height = $theme_options->get( 'refine_image_height' ); }
						$model_tool_image = $registry->get('model_tool_image');
						if($category['thumb'] != '') { 
							$image = $model_tool_image->resize($category['thumb'], $width, $height); 
						} else { 
							$image = $model_tool_image->resize('no_image.jpg', $width, $height); 
						} 
					}
					?>
					<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
					<div class="col-sm-<?php echo $class; ?> hidden-xs">
						<?php if ($theme_options->get('refine_search_style') != '1') { ?>
						<a href="<?php echo $category['href']; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $category['name']; ?>" /></a>
						<?php } ?>
						<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
					</div>
					
					<?php $row = 4; ?>
					<div class="col-xs-6 visible-xs">
						<?php if ($theme_options->get('refine_search_style') != '1') { ?>
						<a href="<?php echo $category['href']; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $category['name']; ?>" /></a>
						<?php } ?>
						<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
					</div>
				  <?php } ?>
				</div>
			</div>
	<?php } ?>  
	
	<?php if ($products) { ?>
  <!-- Filter -->
  <div class="product-filter clearfix">
  	<div class="options">
  		<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
  		
  		<div class="button-group display" data-toggle="buttons-radio">
			<button id="list" <?php if($theme_options->get('default_list_grid') != '1') { echo 'class="active"'; } ?> rel="tooltip" title="List" onclick="display('list');"><i class="fa fa-th-list"></i></button>
  			<button id="grid" <?php if($theme_options->get('default_list_grid') == '1') { echo 'class="active"'; } ?> rel="tooltip" title="Grid" onclick="display('grid');"><i class="fa fa-th"></i></button>
  			
  		</div>
  	</div>
  	
  	<div class="list-options">
  		<div class="sort">
  			<?php echo $text_sort; ?>
  			<select onchange="location = this.value;">
  			  <?php foreach ($sorts as $sorts) { ?>
  			  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
  			  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
  			  <?php } else { ?>
  			  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
  			  <?php } ?>
  			  <?php } ?>
  			</select>
  		</div>
  		
  		<div class="limit">
  			<?php echo $text_limit; ?>
  			<select onchange="location = this.value;">
  			  <?php foreach ($limits as $limits) { ?>
  			  <?php if ($limits['value'] == $limit) { ?>
  			  <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
  			  <?php } else { ?>
  			  <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
  			  <?php } ?>
  			  <?php } ?>
  			</select>
  		</div>
  	</div>
  </div>
  
  <?php 
  $class = 3; 
  $class_right = 9; 
  $row = 4; 
  
  if($theme_options->get( 'product_per_pow2' ) == 6) { $class = 2;  $class_right = 10;  }
  if($theme_options->get( 'product_per_pow2' ) == 5) { $class = 25;  $class_right = 9; }
  if($theme_options->get( 'product_per_pow2' ) == 3) { $class = 4;  $class_right = 8; }
  
  if($theme_options->get( 'product_per_pow2' ) > 1) { $row = $theme_options->get( 'product_per_pow2' ); } 
  ?>
  
  <!-- Products list -->
  <?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/product_list.tpl'); ?>
  
  <!-- Products grid -->
  <?php 
  $class = 3; 
  $row = 4; 
  
  if($theme_options->get( 'product_per_pow2' ) == 6) { $class = 2; }
  if($theme_options->get( 'product_per_pow2' ) == 5) { $class = 25; }
  if($theme_options->get( 'product_per_pow2' ) == 3) { $class = 4; }
  
  if($theme_options->get( 'product_per_pow2' ) > 1) { $row = $theme_options->get( 'product_per_pow2' ); } 
  ?>
  <!-- For Desktops view -->
  <div class="hidden-xs">
  <div class="product-grid"<?php if(!($theme_options->get('default_list_grid') == '1')) { echo ' style="display:none;"'; } ?>>
  	<div class="row">
	  	<?php $row_fluid = 0; foreach ($products as $product) { $row_fluid++; ?>
		  	<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
		  	<div class="col-sm-<?php echo $class; ?>">
		  	    <?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/product_grid.tpl'); ?>
		  	</div>
	    <?php } ?>
    </div>
  </div>
   </div>
  <!-- For Mobiles view -->
  <?php $all = 4;$row = 4;  ?>
  <div class="visible-xs">
  <div class="product-grid "<?php if(!($theme_options->get('default_list_grid') == '1')) { echo ' style="display:none;"'; } ?>>
  	<div class="row">
	  	<?php $row_fluid = 0; foreach ($products as $product) { $row_fluid++; ?>
		  	<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
		  	<div class="col-xs-6">
		  	    <?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/product_grid.tpl'); ?>
		  	</div>
	    <?php } ?>
    </div>
  </div>
  </div>
    <div class="row pagination-results">
		<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
		<div class="col-sm-6 text-right"><?php echo $results; ?></div>
	</div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
<script type="text/javascript"><!--
function display(view) {

	if (view == 'list') {
		$('.product-grid').css("display", "none");
		$('.product-list').css("display", "block");

		$('.display').html('<button class="active" id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="fa fa-th-list"></i></button> <button id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="fa fa-th"></i></button> ');
		
		$.cookie('display', 'list'); 
	} else {
	
		$('.product-grid').css("display", "block");
		$('.product-list').css("display", "none");
					
		$('.display').html('<button id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="fa fa-th-list"></i></button> <button class="active" id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="fa fa-th"></i></button>');
		
		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');

if (view) {
	display(view);
}
//--></script> 
  
<?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_bottom.tpl'); ?>
<?php echo $footer; ?>