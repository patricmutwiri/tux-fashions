<?php 
$theme_options = $registry->get('theme_options');
$config = $registry->get('config');
?>
<div class="box box-categories box-with-categories">
  <div class="box-heading"><?php if($theme_options->get( 'category_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'category_text', $config->get( 'config_language_id' ) )); } else { echo 'Categories'; } ?></div>
  <div class="strip-line"></div>
  <div class="box-content box-information" style="min-height: 488px;">
   <div class="box-information">
    <ul class="accordion" id="accordion-category">
      <?php $i = 0; foreach ($categories as $category) { $i++; ?>
      <li>
        <?php if ($category['category_id'] == $category_id) { ?>
        <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
        <?php } else { ?>
        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
        <?php } ?>
        <?php if ($category['children']) { ?>
        <ul>
          <?php foreach ($category['children'] as $child) { ?>
          <li>
            <?php if ($child['category_id'] == $child_id) { ?>
            <a href="<?php echo $child['href']; ?>" class="active"> - <?php echo $child['name']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $child['href']; ?>"> - <?php echo $child['name']; ?></a>
            <?php } ?>
          </li>
          <?php } ?>
        </ul>
        <?php } ?>
      </li>
      <?php } ?>
    </ul>
	</div>
  </div>
</div>
