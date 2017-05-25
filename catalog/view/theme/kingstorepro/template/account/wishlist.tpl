<?php echo $header; 
$theme_options = $registry->get('theme_options');
$config = $registry->get('config'); 
include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_top.tpl'); ?>

<?php if ($products) { ?>
<div class="table-responsive">
<table class="table table-bordered">
  <thead>
    <tr>
      <td class="text-center"><?php echo $column_image; ?></td>
      <td class="text-left"><?php echo $column_name; ?></td>
      <td class="text-left"><?php echo $column_model; ?></td>
      <td class="text-right"><?php echo $column_stock; ?></td>
      <td class="text-right"><?php echo $column_price; ?></td>
      <td class="text-right"><?php echo $column_action; ?></td>
    </tr>
  </thead>
  <?php foreach ($products as $product) { ?>
  <tbody id="wishlist-row<?php echo $product['product_id']; ?>">
    <tr>
      <td class="text-center"><?php if ($product['thumb']) { ?>
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
        <?php } ?></td>
      <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
      <td class="text-left"><?php echo $product['model']; ?></td>
      <td class="text-right"><?php echo $product['stock']; ?></td>
      <td class="text-right"><?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
          <?php } ?>
        </div>
        <?php } ?></td>
      <td class="text-right"><button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="button"><i class="fa fa-shopping-cart"></i></button>
        <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="button"><i class="fa fa-times"></i></a></td>
    </tr>
  </tbody>
  <?php } ?>
</table>
</div>
<?php } else { ?>
<p><?php echo $text_empty; ?></p>
<?php } ?>
<div class="buttons clearfix">
  <div class="pull-right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
</div>
  
<?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_bottom.tpl'); ?>
<?php echo $footer; ?>