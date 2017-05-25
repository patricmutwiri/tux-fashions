<?php
class ControllerModuleNewsletter extends Controller{
private $version='2.5.0';
private $code='newsletter';
private $extension='Newsletter Module';
private $purchase_url='newsletter-module';
private $error=array();
		
		public function index() {
		$this->load->language('module/newsletter');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('newsletter', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['tab_general' ]= $this->language->get('tab_general');

		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/newsletter', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('module/newsletter', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->post['newsletter_status'])) {
			$data['newsletter_status'] = $this->request->post['newsletter_status'];
		} else {
			$data['newsletter_status'] = $this->config->get('newsletter_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/newsletter', $data));
	}
		
		public function install(){
			$this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX."newsletter");
			$this->db->query("CREATE TABLE ".DB_PREFIX."newsletter (
			email varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '', 
			PRIMARY KEY (`email`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
			");
			$this->load->model('user/user_group');
			$this->model_user_user_group->addPermission($this->user->getId(),'access','extension/newsletter');
			$this->model_user_user_group->addPermission($this->user->getId(),'modify','extension/newsletter');
		}
		
		public function uninstall(){
			$this->db->query("DROP TABLE IF EXISTS ".DB_PREFIX."newsletter");
		}
		
		protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/newsletter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}