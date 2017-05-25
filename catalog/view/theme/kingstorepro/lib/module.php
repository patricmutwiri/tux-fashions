<?php 
class Modules extends Controller {

	public function __construct($registry) {
		parent::__construct($registry);
	}
	
	public function getModules($module_position) {
		$this->load->model('design/layout');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('catalog/information');
		
		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}
		
		$layout_id = 0;
		
		if ($route == 'product/category' && isset($this->request->get['path'])) {
			$path = explode('_', (string)$this->request->get['path']);
				
			$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));			
		}
		
		if ($route == 'product/product' && isset($this->request->get['product_id'])) {
			$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		}
		
		if ($route == 'information/information' && isset($this->request->get['information_id'])) {
			$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}
		
		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}
				
		if (!$layout_id) {
			$layout_id = $this->config->get('config_layout_id');
		}
		
	
		// Old Opencart 1.5.6 Modules
		
		$module_data = array();
		
		$this->load->model('extension/extension');
		
		$extensions = $this->model_extension_extension->getExtensions('module');		
		
		foreach ($extensions as $extension) {
			$modules = $this->config->get($extension['code'] . '_module');
			
			if ($modules) {
				foreach ($modules as $module) {
					if(isset($module['layout_id'])) {
						if (($module['layout_id'] == $layout_id || $module['layout_id'] == 99999 || $module['layout_id'] == '99999' . $this->config->get( 'config_store_id' )) && $module['position'] == $module_position && $module['status']) {
							$module_data[] = array(
								'code'       => $extension['code'],
								'setting'    => $module,
								'sort_order' => $module['sort_order']
							);				
						}
					}
				}
			}
		}
		
		
		// New OpenCart 2.0 Modules
		
		$module_data2 = $this->model_design_layout->getLayoutModules($layout_id, $module_position);
		
		
		// Combining Modules from OC 2.0 and OC 1.5.6
		
		$module_data = array_merge($module_data, $module_data2);
		
		
		// Sorting Modules By Value Sort Order
		
		$sort_order = array(); 
	
		foreach ($module_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}
		
		array_multisort($sort_order, SORT_ASC, $module_data);
		
		
		// Loading Modules
		
		$data['modules'] = array();
		
		foreach ($module_data as $module) {
			if(!isset($module['code']) || !isset($module['setting'])) {
				$part = explode('.', $module['code']);

				if( $part[0] == 'mega_filter' ) {
					if( ! isset( $part[1] ) ) {
						continue;
					}
				
					$mfp_setting = $this->config->get($part[0] . '_module');
					$mfp_setting['_idx'] = $part[1];
					$mfp_setting['position'] = $module['position'];
				
					$data['modules'][] = $this->load->controller('module/' . $part[0], $mfp_setting);
				} else if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
					$data['modules'][] = $this->load->controller('module/' . $part[0]);
				}
				
				if (isset($part[1])) { 
					$setting_info = $this->model_extension_module->getModule($part[1]);
					
					if ($setting_info && $setting_info['status']) {
						$data['modules'][] = $this->load->controller('module/' . $part[0], $setting_info);
					}		
				}
			} else {
				$module = $this->load->controller('module/' . $module['code'], $module['setting']);
				
				if ($module) {
					$data['modules'][] = $module;
				}
			}
		}
		
		return $data['modules'];
	}	

}
?>