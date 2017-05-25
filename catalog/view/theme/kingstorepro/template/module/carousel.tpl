<?php 
$theme_options = $registry->get('theme_options');
$config = $registry->get('config');
?>
<div class="box" style="margin-bottom: 20px;">
<div class="box-heading"><?php if($theme_options->get( 'brand_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'brand_text', $config->get( 'config_language_id' ) )); } else { echo 'Our Brands'; } ?></div>
			
<div id="carousel<?php echo $module; ?>" class="owl-carousel">
  <?php foreach ($banners as $banner) { ?>
  <div class="item text-center">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
</div>
<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?>').owlCarousel({
	items: 5,
	autoPlay: 3000,
	navigation: true,
	navigationText: ['<i class="prev-button2"><span></span></i>', '<i class="next-button2"><span></span></i>']
});
--></script>