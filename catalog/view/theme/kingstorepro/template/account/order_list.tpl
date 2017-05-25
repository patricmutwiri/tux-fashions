<?php echo $header; 
$theme_options = $registry->get('theme_options');
$config = $registry->get('config'); 
include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_top.tpl'); ?>

<?php if ($orders) { ?>
<div class="table-responsive">
  <table class="table table-bordered">
    <thead>
      <tr>
        <td class="text-right"><?php echo $column_order_id; ?></td>
        <td class="text-left"><?php echo $column_status; ?></td>
        <td class="text-left"><?php echo $column_date_added; ?></td>
        <td class="text-right"><?php echo $column_product; ?></td>
        <td class="text-left"><?php echo $column_customer; ?></td>
        <td class="text-right"><?php echo $column_total; ?></td>
        <td></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($orders as $order) { ?>
      <tr>
        <td class="text-right">#<?php echo $order['order_id']; ?></td>
        <td class="text-left"><?php echo $order['status']; ?></td>
        <td class="text-left"><?php echo $order['date_added']; ?></td>
        <td class="text-right"><?php echo $order['products']; ?></td>
        <td class="text-left"><?php echo $order['name']; ?></td>
        <td class="text-right"><?php echo $order['total']; ?></td>
        <td class="text-right"><a href="<?php echo $order['href']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="button"><i class="fa fa-eye"></i></a></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
</div>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_empty; ?></p>
<?php } ?>
<div class="buttons clearfix">
  <div class="pull-right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
</div>
  
<?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_bottom.tpl'); ?>
<?php echo $footer; ?>