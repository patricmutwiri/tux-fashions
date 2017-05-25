<?php echo $header; ?><?php echo $column_left; ?>
<div id="content"><div class="container-fluid">
	<div class="page-header">
	     <h1>TG KingStore Pro Revolution Slider</h1>
	    <ul class="breadcrumb">
		     <?php foreach ($breadcrumbs as $breadcrumb) { ?>
		      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		      <?php } ?>
	    </ul>
	  </div>
    
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:600,500,400' rel='stylesheet' type='text/css'>
	
	<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } elseif ($success) {  ?>
		<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	<?php } ?>
	
	<!-- Revolution slider -->
	<div class="set-size" id="revolution-slider">
		
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<!-- Content -->
			<div class="content">
				<div>
					<div class="bg-tabs clearfix">
						<div id="tabs">
							<a href="<?php echo $placement; ?>" id="placement" class="active"><span>Module placement</span></a>
							<a href="<?php echo $existing; ?>" id="existing"><span>Existing modules</span></a>
						</div>

						<div class="tab-content2">
							<table id="module-placement">
								<thead>
									<tr>
										<td class="first">Slider</td>
										<td>Layout</td>
										<td>Position</td>
										<td>Sort Order</td>
										<td>Status</td>
										<td>Delete</td>
									</tr>
								</thead>
								<?php $module_row = 0; if($modules != '') { ?>
									<?php foreach($modules as $module) { ?>
									<tbody id="module<?php echo $module_row; ?>">
										<tr>
											<td class="first">
												<select name="tg_kspro_revolution_slider_module[<?php echo $module_row; ?>][slider_id]">
													<?php foreach($sliders as $slider) { ?>
													<option value="<?php echo $slider['id']; ?>" <?php if($module['slider_id'] == $slider['id']) { echo 'selected="selected"'; } ?>><?php echo $slider['name']; ?></option>
													<?php } ?>
												</select>
											</td>
											<td>
												<select name="tg_kspro_revolution_slider_module[<?php echo $module_row; ?>][layout_id]">
													<?php if (99999 == $module['layout_id']) { ?>
													<option value="99999" selected="selected">All pages</option>
													<?php } else { ?>
													<option value="99999">All pages</option>
													<?php } ?>
													<?php foreach ($layouts as $layout) { ?>
													<?php if ($layout['layout_id'] == $module['layout_id']) { ?>
													<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
													<?php } ?>
													<?php } ?>
												</select>
											</td>
											<td>
												<select name="tg_kspro_revolution_slider_module[<?php echo $module_row; ?>][position]">
													<?php if ($module['position'] == 'header_top') { ?>
													<option value="header_top" selected="selected">Header Top</option>
													<?php } else { ?>
													<option value="header_top">Header Top</option>
													<?php } ?>
												
													<?php if ($module['position'] == 'slideshow') { ?>
													<option value="slideshow" selected="selected">Slideshow</option>
													<?php } else { ?>
													<option value="slideshow">Slideshow</option>
													<?php } ?>

												</select>
											</td>
											<td>
												<input type="text" class="sort" name="tg_kspro_revolution_slider_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>">
											</td>
											<td>
												<?php if(isset($module['status'])) { ?>
													<?php if($module['status'] == 0 && $module['status'] != '') { echo '<div class="status status-off" title="0" rel="module_'.$module_row.'_status"></div>'; } else { echo '<div class="status status-on" title="1" rel="module_'.$module_row.'_status"></div>'; } ?>
												<?php } else { echo '<div class="status status-off" title="0" rel="module_'.$module_row.'_status"></div>'; } ?>
												<input name="tg_kspro_revolution_slider_module[<?php echo $module_row; ?>][status]" value="<?php if(isset($module['status'])) { echo $module['status']; } else { echo '0'; } ?>" id="module_<?php echo $module_row; ?>_status" type="hidden" />
											</td>
											<td>
												<a onclick="$('#module<?php echo $module_row; ?>').remove();">Remove</a>
											</td>
										</tr>
									</tbody>
									<?php $module_row++; } ?>
								<?php } ?>
								<tfoot></tfoot>
							</table>
							
							<a onclick="addModule();" class="add-module">Add item</a>
							
							<script type="text/javascript"><!--
							var module_row = <?php echo $module_row; ?>;
							
							function addModule() {
								html  = '<tbody id="module' + module_row + '">';
								html += '  <tr>';
								html += '    <td class="first">';
								html += '		<select name="tg_kspro_revolution_slider_module[' + module_row + '][slider_id]">';
								<?php foreach($sliders as $slider) { ?>
								html += '			<option value="<?php echo $slider['id']; ?>"><?php echo $slider['name']; ?></option>';
								<?php } ?>
								html += '		</select>';
								html += '    </td>';
								html += '    <td>';
								html += '		<select name="tg_kspro_revolution_slider_module[' + module_row + '][layout_id]">';
								html += '			<option value="99999">All pages</option>';
								<?php foreach ($layouts as $layout) { ?>
								html += '           <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
								<?php } ?>
								html += '		</select>';
								html += '    </td>';
								html += '    <td>';
								html += '		<select name="tg_kspro_revolution_slider_module[' + module_row + '][position]">';
								html += '				<option value="header_top">Header Top</option>';
								html += '				<option value="slideshow">Slideshow</option>';
								html += '		</select>';
								html += '    </td>';
								html += '    <td>';
								html += '		<input type="text" class="sort" name="tg_kspro_revolution_slider_module[' + module_row + '][sort_order]">';
								html += '    </td>';
								html += '    <td>';
								html += '		<div class="status status-off" title="0" rel="module_' + module_row + '_status"></div><input name="tg_kspro_revolution_slider_module[' + module_row + '][status]" value="0" id="module_' + module_row + '_status" type="hidden" />';
								html += '    </td>';
								html += '    <td><a onclick="$(\'#module' + module_row + '\').remove();">Remove</a></td>';
								html += '  </tr>';
								html += '</tbody>';
								
								$('#module-placement tfoot').before(html);
								
								module_row++;
							}
							//--></script> 
						</div>
					</div>
					
					<div>
						<!-- Buttons -->
						<div class="buttons"><input type="submit" name="button-save" class="button-save" value=""></div>
					</div>
				</div>
			</div>		
		</form>
	</div>
</div>

<script type="text/javascript">
jQuery(document).ready(function($) {
	
	$('#revolution-slider').on('click', '.status', function () {
		
		var styl = $(this).attr("rel");
		var co = $(this).attr("title");
		
		if(co == 1) {
		
			$(this).removeClass('status-on');
			$(this).addClass('status-off');
			$(this).attr("title", "0");

			$("#"+styl+"").val(0);
		
		}
		
		if(co == 0) {
		
			$(this).addClass('status-on');
			$(this).removeClass('status-off');
			$(this).attr("title", "1");

			$("#"+styl+"").val(1);
		
		}
		
	});

});	
</script>
<?php echo $footer; ?>