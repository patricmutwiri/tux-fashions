<?php echo $header; 
$theme_options = $registry->get('theme_options');
$config = $registry->get('config'); 
include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_top.tpl'); ?>

<?php if ($downloads) { ?>
<table class="table table-bordered table-hover">
  <thead>
    <tr>
      <td class="text-right"><?php echo $column_order_id; ?></td>
      <td class="text-left"><?php echo $column_name; ?></td>
      <td class="text-left"><?php echo $column_size; ?></td>
      <td class="text-left"><?php echo $column_date_added; ?></td>
      <td></td>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($downloads as $download) { ?>
    <tr>
      <td class="text-right"><?php echo $download['order_id']; ?></td>
      <td class="text-left"><?php echo $download['name']; ?></td>
      <td class="text-left"><?php echo $download['size']; ?></td>
      <td class="text-left"><?php echo $download['date_added']; ?></td>
      <td><a href="<?php echo $download['href']; ?>" data-toggle="tooltip" title="<?php echo $button_download; ?>" class="button"><i class="fa fa-cloud-download"></i></a></td>
    </tr>
    <?php } ?>
  </tbody>
</table>
<div class="row">
  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
<?php } else { ?>
<p><?php echo $text_empty; ?></p>
<?php } ?>
<div class="buttons clearfix">
  <div class="pull-right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
</div>
  
	<?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_bottom.tpl'); ?>
<?php echo $footer; ?>