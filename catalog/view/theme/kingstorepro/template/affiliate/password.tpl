<?php echo $header; 
$theme_options = $registry->get('theme_options');
$config = $registry->get('config'); 
include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_top.tpl'); ?>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
  <fieldset>
    <h2><?php echo $text_password; ?></h2>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
      <div class="col-sm-10">
        <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
        <?php if ($error_password) { ?>
        <div class="text-danger"><?php echo $error_password; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
      <div class="col-sm-10">
        <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
        <?php if ($error_confirm) { ?>
        <div class="text-danger"><?php echo $error_confirm; ?></div>
        <?php } ?>
      </div>
    </div>
  </fieldset>
  <div class="buttons clearfix">
    <div class="pull-left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
    <div class="pull-right">
      <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
    </div>
  </div>
</form>
  
<?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_bottom.tpl'); ?>
<?php echo $footer; ?>