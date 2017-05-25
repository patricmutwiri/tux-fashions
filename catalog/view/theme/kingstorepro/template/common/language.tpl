<?php if (count($languages) > 1) { ?>
<!-- Language -->
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language_form">
	<div id="language">
		<?php foreach ($languages as $language) { ?>
		<?php if ($language['code'] == $code) { ?>
		<a href="#" class="dropdown-toggle" data-hover="dropdown" data-toggle="dropdown"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a>
		<?php } ?>
		<?php } ?>
		<ul class="dropdown-menu">
		  <?php foreach ($languages as $language) { ?>
		  <li><a href="javascript:;" onclick="$('input[name=\'code\']').attr('value', '<?php echo $language['code']; ?>'); $('#language_form').submit();"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" width="16px" height="11px" /> <?php echo $language['name']; ?></a></li>
		  <?php } ?>
		</ul>
	</div>
	
	<input type="hidden" name="code" value="" />
	<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
