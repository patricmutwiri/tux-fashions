<?php echo $header; 
$theme_options = $registry->get('theme_options');
$config = $registry->get('config'); 
include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_top.tpl'); ?>

<table class="list table  ">
  <thead>
    <tr>
      <td class="text-left" colspan="2"><?php echo $text_return_detail; ?></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="text-left" style="width: 50%;"><b><?php echo $text_return_id; ?></b> #<?php echo $return_id; ?><br />
        <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
      <td class="text-left" style="width: 50%;"><b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
        <b><?php echo $text_date_ordered; ?></b> <?php echo $date_ordered; ?></td>
    </tr>
  </tbody>
</table>
<h2><?php echo $text_product; ?></h2>
<table class="list table  ">
  <thead>
    <tr>
      <td class="text-left" style="width: 33.3%;"><?php echo $column_product; ?></td>
      <td class="text-left" style="width: 33.3%;"><?php echo $column_model; ?></td>
      <td class="text-right" style="width: 33.3%;"><?php echo $column_quantity; ?></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="text-left"><?php echo $product; ?></td>
      <td class="text-left"><?php echo $model; ?></td>
      <td class="text-right"><?php echo $quantity; ?></td>
    </tr>
  </tbody>
</table>
<table class="list table  ">
  <thead>
    <tr>
      <td class="text-left" style="width: 33.3%;"><?php echo $column_reason; ?></td>
      <td class="text-left" style="width: 33.3%;"><?php echo $column_opened; ?></td>
      <td class="text-left" style="width: 33.3%;"><?php echo $column_action; ?></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="text-left"><?php echo $reason; ?></td>
      <td class="text-left"><?php echo $opened; ?></td>
      <td class="text-left"><?php echo $action; ?></td>
    </tr>
  </tbody>
</table>
<?php if ($comment) { ?>
<table class="list table  ">
  <thead>
    <tr>
      <td class="text-left"><?php echo $text_comment; ?></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="text-left"><?php echo $comment; ?></td>
    </tr>
  </tbody>
</table>
<?php } ?>
<?php if ($histories) { ?>
<h2><?php echo $text_history; ?></h2>
<table class="list table  ">
  <thead>
    <tr>
      <td class="text-left" style="width: 33.3%;"><?php echo $column_date_added; ?></td>
      <td class="text-left" style="width: 33.3%;"><?php echo $column_status; ?></td>
      <td class="text-left" style="width: 33.3%;"><?php echo $column_comment; ?></td>
    </tr>
  </thead>
  <tbody>
    <?php foreach ($histories as $history) { ?>
    <tr>
      <td class="text-left"><?php echo $history['date_added']; ?></td>
      <td class="text-left"><?php echo $history['status']; ?></td>
      <td class="text-left"><?php echo $history['comment']; ?></td>
    </tr>
    <?php } ?>
  </tbody>
</table>
<?php } ?>
<div class="buttons clearfix">
  <div class="pull-right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
</div>
  
<?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_bottom.tpl'); ?>
<?php echo $footer; ?>