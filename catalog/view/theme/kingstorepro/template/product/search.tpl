<?php echo $header; 
$theme_options = $registry->get('theme_options');
$config = $registry->get('config'); 
include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_top.tpl'); ?>

<div id="content">
	<label class="control-label" for="input-search"><b><?php echo $entry_search; ?></b></label>
	<div class="row" id="content-search" style="margin-bottom: 20px;">
	  <div class="col-sm-4">
	    <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
	  </div>
	  <div class="col-sm-3">
	    <select name="category_id" class="form-control">
	      <option value="0"><?php echo $text_category; ?></option>
	      <?php foreach ($categories as $category_1) { ?>
	      <?php if ($category_1['category_id'] == $category_id) { ?>
	      <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
	      <?php } else { ?>
	      <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
	      <?php } ?>
	      <?php foreach ($category_1['children'] as $category_2) { ?>
	      <?php if ($category_2['category_id'] == $category_id) { ?>
	      <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
	      <?php } else { ?>
	      <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
	      <?php } ?>
	      <?php foreach ($category_2['children'] as $category_3) { ?>
	      <?php if ($category_3['category_id'] == $category_id) { ?>
	      <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
	      <?php } else { ?>
	      <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
	      <?php } ?>
	      <?php } ?>
	      <?php } ?>
	      <?php } ?>
	    </select>
	  </div>
	  <div class="col-sm-3" style="padding-top: 7px">
	    <label class="checkbox-inline">
	      <?php if ($sub_category) { ?>
	      <input type="checkbox" name="sub_category" value="1" checked="checked" />
	      <?php } else { ?>
	      <input type="checkbox" name="sub_category" value="1" />
	      <?php } ?>
	      <?php echo $text_sub_category; ?></label>
	  </div>
	</div>
	<p>
	  <label class="checkbox-inline">
	    <?php if ($description) { ?>
	    <input type="checkbox" name="description" value="1" id="description" checked="checked" />
	    <?php } else { ?>
	    <input type="checkbox" name="description" value="1" id="description" />
	    <?php } ?>
	    <?php echo $entry_description; ?></label>
	</p>
	<input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" style="margin-top: 10px" />
	<h2 style="padding-top: 40px"><?php echo $text_search; ?></h2>
  
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
  <?php } else { ?>
  <p style="padding-bottom: 10px"><?php echo $text_empty; ?></p>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#content-search input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content-search input[name=\'search\']').attr('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').attr('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

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