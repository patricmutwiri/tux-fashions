<?php

class ControllerModuleTGKSProRevolutionSlider extends Controller {
	private $error = array(); 
	
	public function slider() {
		$this->language->load('module/tg_kspro_revolution_slider');
		
		$this->document->setTitle('TG KingStore Pro Revolution Slider');
		
		$this->document->addStyle('view/stylesheet/tg_kspro_revolution_slider.css');
		
		$this->load->model('slider/tg_kspro_revolution_slider');
		
		if(isset($_GET['slider_id'])) {
			$data = $this->model_slider_tg_kspro_revolution_slider->getData(intval($_GET['slider_id']));
			if($data == false) { 
				$this->response->redirect($this->url->link('module/tg_kspro_revolution_slider/sliders', 'token=' . $this->session->data['token'], true));
			}
			$data['slider_width'] = $data['settings']['slider_width'];
			$data['slider_height'] = $data['settings']['slider_height'];
			$data['layout_type'] = $data['settings']['layout_type'];
			$data['slider_speed'] = $data['settings']['slider_speed'];
			$data['slider_name'] = $data['name'];
			if(is_array($data['content'])) {
				$data['sliders'] = $data['content'];
			} else {
				$data['sliders'] = array();
			}
			$data['slider_id'] = $_GET['slider_id'];
		} else {
			$data['slider_width'] = 620;
			$data['slider_height'] = 516;
			$data['layout_type'] = false;
			$data['slider_speed'] = 9;
			$data['slider_name'] = 'New slider';
			$data['sliders'] = array();
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if(isset($_POST['button-add'])) {
				if($this->model_slider_tg_kspro_revolution_slider->addSlider($this->request->post)) {
					$this->session->data['success'] = $this->language->get('text_success');
				} else {
					$this->session->data['error_warning'] = $this->model_slider_tg_kspro_revolution_slider->displayError();
				}
				$this->response->redirect($this->url->link('module/tg_kspro_revolution_slider/sliders', 'token=' . $this->session->data['token'], true));
			}
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if(isset($_POST['button-save'])) {
				if($this->model_slider_tg_kspro_revolution_slider->saveSlider($this->request->post)) {
					$this->session->data['success'] = $this->language->get('text_success');
				} else {
					$this->session->data['error_warning'] = $this->model_slider_tg_kspro_revolution_slider->displayError();
				}
				$this->response->redirect($this->url->link('module/tg_kspro_revolution_slider/sliders', 'token=' . $this->session->data['token'], true));
			}
		}
		
		if(isset($_GET['slider_id']) && isset($_GET['delete'])) {
			if($this->validate()){
				if($this->model_slider_tg_kspro_revolution_slider->deleteSlider(intval($_GET['slider_id']))) {
					$this->session->data['success'] = 'This slider has been properly removed from the database.';
				} else {
					$this->session->data['error_warning'] = $this->model_slider_tg_kspro_revolution_slider->displayError();
				}
			} else {
				$this->session->data['error_warning'] = $this->language->get('error_permission');
			}
			$this->response->redirect($this->url->link('module/tg_kspro_revolution_slider/sliders', 'token=' . $this->session->data['token'], true));
		}
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['error_warning'])) {
			$data['error_warning'] = $this->session->data['error_warning'];
		    unset($this->session->data['error_warning']);
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		    unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$data['action'] = $this->url->link('module/tg_kspro_revolution_slider/slider', 'token=' . $this->session->data['token'], true);
		$data['token'] = $this->session->data['token'];
		
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
			'text' => 'Revolution slider',
			'href' => $this->url->link('module/tg_kspro_revolution_slider', 'token=' . $this->session->data['token'], true)
		);
		
		// No image
		$this->load->model('tool/image');
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
				
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
				
		$this->response->setOutput($this->load->view('module/tg_kspro_revolution_slider/slider', $data));
	}
	
	public function sliders() {
		$this->language->load('module/tg_kspro_revolution_slider');

		$this->document->setTitle('ThemeGlobal tgpro Revolution Sliderr');
		
		$this->load->model('setting/setting');
		
		$this->document->addStyle('view/stylesheet/tg_kspro_revolution_slider.css');
		
		$this->load->model('slider/tg_kspro_revolution_slider');

		$data['sliders'] = $this->model_slider_tg_kspro_revolution_slider->getSliders();
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['error_warning'])) {
			$data['error_warning'] = $this->session->data['error_warning'];
		    unset($this->session->data['error_warning']);
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		    unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$data['action'] = $this->url->link('module/tg_kspro_revolution_slider/sliders', 'token=' . $this->session->data['token'], true);
		$data['placement'] = $this->url->link('module/tg_kspro_revolution_slider', 'token=' . $this->session->data['token'], true);		
		$data['existing'] = $this->url->link('module/tg_kspro_revolution_slider/sliders', 'token=' . $this->session->data['token'], true);	
		$data['link_slider'] = $this->url->link('module/tg_kspro_revolution_slider/slider', 'token=' . $this->session->data['token'], true);	
		$data['token'] = $this->session->data['token'];
		
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
			'text' => 'Revolution slider',
			'href' => $this->url->link('module/tg_kspro_revolution_slider', 'token=' . $this->session->data['token'], true)
		);
				
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
				
		$this->response->setOutput($this->load->view('module/tg_kspro_revolution_slider/sliders', $data));
	}
	 
	public function index() {   
		$this->language->load('module/tg_kspro_revolution_slider');

		$this->document->setTitle('ThemeGlobal tgpro Revolution Slider');
		
		$this->load->model('setting/setting');
		

		$this->document->addStyle('view/stylesheet/tg_kspro_revolution_slider.css');
		

		$this->load->model('slider/tg_kspro_revolution_slider');
		

		$this->model_slider_tg_kspro_revolution_slider->install();
		

		$data['sliders'] = $this->model_slider_tg_kspro_revolution_slider->getSliders();
		

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('tg_kspro_revolution_slider', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('module/tg_kspro_revolution_slider', 'token=' . $this->session->data['token'], true));
		}

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['error_warning'])) {
			$data['error_warning'] = $this->session->data['error_warning'];
		    unset($this->session->data['error_warning']);
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		    unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$data['action'] = $this->url->link('module/tg_kspro_revolution_slider', 'token=' . $this->session->data['token'], true);
		$data['placement'] = $this->url->link('module/tg_kspro_revolution_slider', 'token=' . $this->session->data['token'], true);		
		$data['existing'] = $this->url->link('module/tg_kspro_revolution_slider/sliders', 'token=' . $this->session->data['token'], true);		
		$data['token'] = $this->session->data['token'];

		$data['modules'] = array();
		
		if (isset($this->request->post['tg_kspro_revolution_slider_module'])) {
			$data['modules'] = $this->request->post['tg_kspro_revolution_slider_module'];
		} elseif ($this->config->get('tg_kspro_revolution_slider_module')) { 
			$data['modules'] = $this->config->get('tg_kspro_revolution_slider_module');
		}	
		
		// Load model layout		
		$this->load->model('design/layout');
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
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
			'text' => 'TG KingStore Pro Revolution Slider',
			'href' => $this->url->link('module/tg_kspro_revolution_slider', 'token=' . $this->session->data['token'], true)
		);
				
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
				
		$this->response->setOutput($this->load->view('module/tg_kspro_revolution_slider/placement', $data));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/tg_kspro_revolution_slider')) {
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