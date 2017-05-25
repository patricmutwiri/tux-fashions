<?php
class ControllerModuleTGKSproFilterProduct extends Controller {
	private $error = array(); 
	 
	public function index() {   
		$this->language->load('module/tg_kspro_filter_product');

		$this->document->setTitle('TG KingStore Pro Filter Product');
		
		$this->load->model('setting/setting');
		$this->load->model('catalog/product');
		$this->load->model('catalog/category');

		$this->document->addStyle('view/stylesheet/tg_kspro_filter_product.css');
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('tg_kspro_filter_product', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('module/tg_kspro_filter_product', 'token=' . $this->session->data['token'], true));			
		}

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		    unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$data['action'] = $this->url->link('module/tg_kspro_filter_product', 'token=' . $this->session->data['token'], true);
				
		$data['token'] = $this->session->data['token'];
	
		$data['modules'] = array();
		
		if (isset($this->request->post['tg_kspro_filter_product_module'])) {
			$data['modules'] = $this->request->post['tg_kspro_filter_product_module'];
		} elseif ($this->config->get('tg_kspro_filter_product_module')) { 
			$data['modules'] = $this->config->get('tg_kspro_filter_product_module');
		}	
				
		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);
		
		$data['breadcrumbs'][] = array(
			'text' => 'Modules',
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
		);
				
		$data['breadcrumbs'][] = array(
			'text' => 'TG KingStore Pro Filter Product',
			'href' => $this->url->link('module/filter_product', 'token=' . $this->session->data['token'], true)
		);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('module/tg_kspro_filter_product', $data));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/tg_kspro_filter_product')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>