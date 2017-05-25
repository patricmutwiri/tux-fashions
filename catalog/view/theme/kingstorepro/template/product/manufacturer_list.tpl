<?php echo $header; 
$theme_options = $registry->get('theme_options');
$config = $registry->get('config'); 
include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_top.tpl'); ?>

<?php if ($categories) { ?>
<p><b><?php echo $text_index; ?></b>
  <?php foreach ($categories as $category) { ?>
  &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><b><?php echo $category['name']; ?></b></a>
  <?php } ?>
</p>
<?php foreach ($categories as $category) { ?>
<div class="manufacturer-list">
  <div class="manufacturer-heading"><?php echo $category['name']; ?><a id="<?php echo $category['name']; ?>"></a></div>
  <div class="manufacturer-content">
    <?php if ($category['manufacturer']) { ?>
    <?php for ($i = 0; $i < count($category['manufacturer']);) { ?>
    <ul>
      <?php $j = $i + ceil(count($category['manufacturer']) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($category['manufacturer'][$i])) { ?>
      <li><a href="<?php echo $category['manufacturer'][$i]['href']; ?>"><?php echo $category['manufacturer'][$i]['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
</div>
<?php } ?>
<?php } else { ?>
<p><?php echo $text_empty; ?></p>
<div class="buttons clearfix">
  <div class="pull-right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
</div>
<?php } ?>

<?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_bottom.tpl'); ?>
<?php echo $footer; ?>