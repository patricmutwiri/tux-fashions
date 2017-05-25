<?php echo $header; 
$theme_options = $registry->get('theme_options');
$config = $registry->get('config'); 
include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_top.tpl'); ?>

      <p><?php echo $text_description; ?></p>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <h2><?php echo $text_order; ?></h2>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
              <?php if ($error_firstname) { ?>
              <div class="text-danger"><?php echo $error_firstname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
              <?php if ($error_lastname) { ?>
              <div class="text-danger"><?php echo $error_lastname; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
              <?php if ($error_telephone) { ?>
              <div class="text-danger"><?php echo $error_telephone; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-order-id"><?php echo $entry_order_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="order_id" value="<?php echo $order_id; ?>" placeholder="<?php echo $entry_order_id; ?>" id="input-order-id" class="form-control" />
              <?php if ($error_order_id) { ?>
              <div class="text-danger"><?php echo $error_order_id; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-date-ordered"><?php echo $entry_date_ordered; ?></label>
            <div class="col-sm-3">
              <div class="input-group date"><input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" placeholder="<?php echo $entry_date_ordered; ?>" data-format="YYYY-MM-DD" id="input-date-ordered" class="form-control" /><span class="input-group-btn">
                <button type="button" class="button" style="margin-left: 10px;"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
        </fieldset>
        <fieldset>
          <h2><?php echo $text_product; ?></h2>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
            <div class="col-sm-10">
              <input type="text" name="product" value="<?php echo $product; ?>" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
              <?php if ($error_product) { ?>
              <div class="text-danger"><?php echo $error_product; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
            <div class="col-sm-10">
              <input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
              <?php if ($error_model) { ?>
              <div class="text-danger"><?php echo $error_model; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
            <div class="col-sm-10">
              <input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_reason; ?></label>
            <div class="col-sm-10">
              <?php foreach ($return_reasons as $return_reason) { ?>
              <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
              <div class="radio">
                <label>
                  <input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" checked="checked" />
                  <?php echo $return_reason['name']; ?></label>
              </div>
              <?php } else { ?>
              <div class="radio">
                <label>
                  <input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" />
                  <?php echo $return_reason['name']; ?></label>
              </div>
              <?php  } ?>
              <?php  } ?>
              <?php if ($error_reason) { ?>
              <div class="text-danger"><?php echo $error_reason; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_opened; ?></label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <?php if ($opened) { ?>
                <input type="radio" name="opened" value="1" checked="checked" />
                <?php } else { ?>
                <input type="radio" name="opened" value="1" />
                <?php } ?>
                <?php echo $text_yes; ?></label>
              <label class="radio-inline">
                <?php if (!$opened) { ?>
                <input type="radio" name="opened" value="0" checked="checked" />
                <?php } else { ?>
                <input type="radio" name="opened" value="0" />
                <?php } ?>
                <?php echo $text_no; ?></label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_fault_detail; ?></label>
            <div class="col-sm-10">
              <textarea name="comment" rows="10" placeholder="<?php echo $entry_fault_detail; ?>" id="input-comment" class="form-control"><?php echo $comment; ?></textarea>
            </div>
          </div>
          <?php echo $captcha; ?>
        </fieldset>
        <?php if ($text_agree) { ?>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
          <div class="pull-right"><?php echo $text_agree; ?>
            <?php if ($agree) { ?>
            <input type="checkbox" name="agree" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="agree" value="1" />
            <?php } ?>
            <input type="submit" value="<?php echo $button_submit; ?>" class="button" />
          </div>
        </div>
        <?php } else { ?>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_submit; ?>" class="button" />
          </div>
        </div>
        <?php } ?>
      </form>

<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>

<?php include('catalog/view/theme/'.$config->get($config->get('config_theme') . '_directory').'/template/themeglobal/themeglobal_bottom.tpl'); ?>
<?php echo $footer; ?>