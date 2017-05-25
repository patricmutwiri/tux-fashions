<?php

class ControllerModuleTGKSProMegamenu extends Controller {
	
	private $error = array(); 
	
	public function index() {  
	
		
		$this->language->load('module/tg_kspro_megamenu');
		$this->document->setTitle('TG KingStore Pro Megamenu'); 
		
		$this->load->model('setting/setting');
		
		$this->document->addStyle('view/stylesheet/tg_kspro_megamenu.css');
		$this->document->addScript('view/javascript/jquery/jquery.nestable.js');
		
		$this->load->model('menu/tg_kspro_megamenu');
		
		$this->model_menu_tg_kspro_megamenu->install();
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['language_id'] = 0;
		foreach($data['languages'] as $value) {
			if($value['code'] == $this->config->get('config_language')) {
				$data['language_id'] = $value['language_id'];
			}
		}
		
		if(isset($_GET['delete'])) {
			if($this->validate()){
				if($this->model_menu_tg_kspro_megamenu->deleteMenu(intval($_GET['delete']))) {
					$this->session->data['success'] = 'This menu has been properly removed from the database.';
				} else {
					$this->session->data['error_warning'] = $this->model_menu_tg_kspro_megamenu->displayError();
				}
			} else {
				$this->session->data['error_warning'] = $this->language->get('error_permission');
			}
			$this->response->redirect($this->url->link('module/tg_kspro_megamenu', 'token=' . $this->session->data['token'], true));
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			if(isset($_POST['button-create'])) {
				if($this->validate()) {
					$error = false;
					$lang_id = $data['language_id'];
					if($this->request->post['name'][$lang_id] == '') $error = true;
					if($error == true) {
						$this->session->data['error_warning'] = $this->language->get('text_warning');
					} else {
						$this->model_menu_tg_kspro_megamenu->addMenu($this->request->post);
						$this->session->data['success'] = $this->language->get('text_success');
					}
				} else {
					$this->session->data['error_warning'] = $this->language->get('error_permission');
				}
				$this->response->redirect($this->url->link('module/tg_kspro_megamenu', 'token=' . $this->session->data['token'], true));
			}
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			if(isset($_POST['button-edit'])) {
				if($this->validate()) {
					$error = false;
					$lang_id = $data['language_id'];
					if($this->request->post['name'][$lang_id] == '') $error = true;
					if($error == true) {
						$this->session->data['error_warning'] = $this->language->get('text_warning');
					} else {
						$this->model_menu_tg_kspro_megamenu->saveMenu($this->request->post);
						$this->session->data['success'] = $this->language->get('text_success');
					}
				} else {
					$this->session->data['error_warning'] = $this->language->get('error_permission');
				}
				$this->response->redirect($this->url->link('module/tg_kspro_megamenu', 'token=' . $this->session->data['token'], true));
			}
		}
		
		$data['nestable_list'] = $this->model_menu_tg_kspro_megamenu->generate_nestable_list($data['language_id']);
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if(isset($_POST['button-save'])){
				$tg_kspro_megamenu = array();
				if(isset($this->request->post['search_bar'])) {
					$search_bar = 1;
				} else {
					$search_bar = 0;
				}
				if(!isset($this->request->post['layout_id'])) $this->request->post['layout_id'] = 100;
				if(!isset($this->request->post['position'])) $this->request->post['position'] = 'menu';
				if(!isset($this->request->post['status'])) $this->request->post['status'] = 1;
				if(!isset($this->request->post['sort_order'])) $this->request->post['layout_id'] = 0;
				if(!isset($this->request->post['animation'])) $this->request->post['animation'] = 'slide';
				if(!isset($this->request->post['animation_time'])) $this->request->post['animation_time'] = 500;
				$tg_kspro_megamenu['tg_kspro_megamenu_module'] = array(
					array(
						'layout_id'  => $this->request->post['layout_id'],
						'position'   => $this->request->post['position'],
						'status'     => $this->request->post['status'],
						'sort_order' => intval($this->request->post['sort_order']),
						'animation'  => $this->request->post['animation'],
						'animation_time'  => intval($this->request->post['animation_time'])
					)
				);
				$this->model_setting_setting->editSetting('tg_kspro_megamenu', $tg_kspro_megamenu);
				$this->session->data['success'] = $this->language->get('text_success');
				$this->response->redirect($this->url->link('module/tg_kspro_megamenu', 'token=' . $this->session->data['token'], true));	
			}
		}

		if (isset($_GET['jsonstring'])) {
			if($this->validate()){
				$jsonstring = $_GET['jsonstring'];
				$jsonDecoded = json_decode(html_entity_decode($jsonstring));
				
				function parseJsonArray($jsonArray, $parentID = 0) {
					$return = array();
					foreach ($jsonArray as $subArray) {
						$returnSubSubArray = array();
						if (isset($subArray->children)) {
							$returnSubSubArray = parseJsonArray($subArray->children, $subArray->id);
						}
						$return[] = array('id' => $subArray->id, 'parentID' => $parentID);
						$return = array_merge($return, $returnSubSubArray);
					}
				
					return $return;
				}
				
				
				$readbleArray = parseJsonArray($jsonDecoded);
								
				foreach ($readbleArray as $key => $value) {
					if (is_array($value)) {
						$this->model_menu_tg_kspro_megamenu->save_rang($value['parentID'], $value['id'], $key);
					}	
				}

				die("The list was updated ".date("y-m-d H:i:s")."!");
				
			} else {
				die($this->language->get('error_permission'));
			}
		}
		
		if($this->config->get('tg_kspro_megamenu_module') != '') {
			$settings = $this->config->get('tg_kspro_megamenu_module');
			$data['layout_id'] = $settings[0]['layout_id'];
			$data['status'] = $settings[0]['status'];
			$data['position'] = $settings[0]['position'];
			$data['sort_order'] = $settings[0]['sort_order'];
			$data['animation'] = $settings[0]['animation'];
			$data['animation_time'] = $settings[0]['animation_time'];
		} else {
			$data['layout_id'] = 100;
			$data['status'] = 1;
			$data['position'] = 'menu';   
			$data['sort_order'] = 0;
			$data['animation'] = 'slide';
			$data['animation_time'] = '500';
		}
		
		$data['action_type'] = 'basic';
		if(isset($_GET['action'])) {
			if($_GET['action'] == 'create') {
				$data['action_type'] = 'create';
				$data['name'] = '';
				$data['description'] = '';
				$data['icon'] = '';
				$data['link'] = '';
				$data['new_window'] = '';
				$data['status'] = '';
				$data['position'] = '';
				$data['submenu_width'] = '100%';
				$data['display_submenu'] = '';
				$data['content_width'] = '4';
				$data['content_type'] = '0';
				$data['content'] = array(
					'html' => array(
							'text' => array()
						),
					'product' => array(
							'id' => '',
							'name' => ''
						),
					'categories' => array(
							'categories' => array(),
							'columns' => '',
							'submenu' => '',
							'submenu_columns' => ''
						)
				);
				$data['list_categories'] = false;
			}
		}
		
		if(isset($_GET['edit'])) {
			$data['action_type'] = 'edit';
			$dane = $this->model_menu_tg_kspro_megamenu->getMenu(intval($_GET['edit']));
			if($dane) {
				$data['name'] = $dane['name'];
				$data['description'] = $dane['description'];
				$data['icon'] = $dane['icon'];
				$data['link'] = $dane['link'];
				$data['new_window'] = $dane['new_window'];
				$data['status'] = $dane['status'];
				$data['position'] = $dane['position'];
				$data['submenu_width'] = $dane['submenu_width'];
				$data['display_submenu'] = $dane['display_submenu'];
				$data['content_width'] = $dane['content_width'];
				$data['content_type'] = $dane['content_type'];
				$data['content'] = $dane['content'];
				$data['list_categories'] = $this->model_menu_tg_kspro_megamenu->getCategories($dane['content']['categories']['categories']);
			} else {
				$this->session->data['error_warning'] = 'This menu does not exist!';
				$this->response->redirect($this->url->link('module/tg_kspro_megamenu', 'token=' . $this->session->data['token'], true));	
			}
		}
		
		$this->load->model('design/layout');
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
		if (isset($this->session->data['error_warning'])) {
			$data['error_warning'] = $this->session->data['error_warning'];
			unset($this->session->data['error_warning']);
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		    unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$data['action'] = $this->url->link('module/tg_kspro_megamenu', 'token=' . $this->session->data['token'], true);
		
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
			'text' => 'TG KingStore Pro MegaMenu',
			'href' => $this->url->link('module/tg_kspro_megamenu', 'token=' . $this->session->data['token'], true)
		);
		
		$this->load->model('tool/image');
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('module/tg_kspro_megamenu', $data));
	
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/tg_kspro_megamenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
	
}

?>