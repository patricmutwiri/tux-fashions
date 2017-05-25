<?php $grid_center = 12; if($column_left != '') { $grid_center = $grid_center-3; } if($column_right != '') { $grid_center = $grid_center-3; } ?>
<?php 
	require_once( DIR_TEMPLATE.$config->get($config->get('config_theme') . '_directory')."/lib/module.php" );
	$modules_old_opencart = new Modules($registry); ?>

<!-- BREADCRUMB
	================================================== -->
<div class="breadcrumb">
			<div class="container">
				<div class="clearfix">
					<ul>
						<?php foreach ($breadcrumbs as $breadcrumb) { ?>
						<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
						<?php } ?>
					</ul>
				</div>
			</div>
</div>

<!-- MAIN CONTENT
	================================================== -->
<div class="main-content full-width inner-page">
			<div class="container">
				
				<div class="row">
					<?php 
					$columnleft = $modules_old_opencart->getModules('column_left');
					$headerleft = $modules_old_opencart->getModules('header_left');
					if( count($columnleft) or count($headerleft) ) { ?>
					<div class="col-sm-3" id="column_left">
						<?php
						foreach ($headerleft as $module) {
							echo $module;
						}
						?>
					
						<?php
						foreach ($columnleft as $module) {
							echo $module;
						}
						?>
					</div>
					<?php } ?>
					
					<?php $grid_center = 12; if( count($columnleft) or count($headerleft) ) { $grid_center = 9; } ?>
					<div class="col-sm-<?php echo $grid_center; ?>">
						<?php 
						$content_big_column = $modules_old_opencart->getModules('content_big_column');
						if( count($content_big_column) ) { 
							foreach ($content_big_column as $module) {
								echo $module;
							}
						} ?>
						
						<?php 
						$content_top = $modules_old_opencart->getModules('content_top');
						if( count($content_top) ) { 
							foreach ($content_top as $module) {
								echo $module;
							}
						} ?>
						
						<div class="row">
							<?php 
							$grid_content_top = 12; 
							$grid_content_right = 3;
							$column_right = $modules_old_opencart->getModules('column_right'); 
							if( count($column_right) ) {
								if($grid_center == 9) {
									$grid_content_top = 8;
									$grid_content_right = 4;
								} else {
									$grid_content_top = 9;
									$grid_content_right = 3;
								}
							}
							?>
							<div class="col-sm-<?php echo $grid_content_top; ?> center-column">
							
								<h2 id="title-page"><?php echo $heading_title; ?>
									<?php if(isset($weight)) { if ($weight) { ?>
									&nbsp;(<?php echo $weight; ?>)
									<?php } } ?>
								</h2>

								<?php if (isset($error_warning)) { ?>
									<?php if ($error_warning) { ?>
									<div class="warning">
										<?php echo $error_warning; ?>
									</div>
									<?php } ?>
								<?php } ?>
								
								<?php if (isset($success)) { ?>
									<?php if ($success) { ?>
									<div class="success">
										<?php echo $success; ?>
									</div>
									<?php } ?>
								<?php } ?>