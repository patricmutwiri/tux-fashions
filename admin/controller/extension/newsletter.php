<?php
class ControllerExtensionNewsletter extends Controller {
	private $error = array();
	
	public function index() {
		$this->language->load('extension/newsletter');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}
		
		$url = '';
		
		if (isset($this->request->post['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		if (isset($this->request->post['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}
		
		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/newsletter', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->session->data['warning'])) {
			$data['error_warning'] = $this->session->data['warning'];
		
			unset($this->session->data['warning']);
		} else {
			$data['error_warning'] = '';
		}
		
		$filter_data = array(
			'page' => $page,
			'limit' => $this->config->get('config_limit_admin'),
			'start' => $this->config->get('config_limit_admin') * ($page - 1),
		);
		
		$url = '';
		
		if (isset($this->request->post['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}
		
		$total = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "newsletter WHERE email is not null");
		
		$pagination = new Pagination();
		$pagination->total = $total->row['total'];
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('extension/newsletter', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
		
		$data['pagination'] = $pagination->render();
		
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['column_email'] = $this->language->get('column_email');
		
		$data['text_empty'] = $this->language->get('text_empty');
		
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		
		if (isset($this->request->get['filter_email'])) {
			$data['filter_email'] = $this->request->get['filter_email'];
		} else {
			$data['filter_email'] = '';
		}
		
		$data['token'] = $this->session->data['token'];
		
		$data['delete'] = $this->url->link('extension/newsletter/delete', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['newsletters'] = array();
		
		$sql = "SELECT * FROM " . DB_PREFIX . "newsletter";
		
		if (isset($this->request->get['filter_email'])) {
			$sql .= " WHERE email = '" . $this->db->escape($this->request->get['filter_email']) . "'";
		}
		
		$sql .= " ORDER BY email ASC";
		
		if (!empty($filter_data['limit'])) {
			if ($filter_data['limit'] < 0) {
				$limit = 20;
			} else {
				$limit = $filter_data['limit'];
			}
		} else {
			$limit = 20;
		}
		
		if (!empty($filter_data['start'])) {
			if ($filter_data['start'] < 0) {
				$start = 0;
			} else {
				$start = $filter_data['start'];
			}
		} else {
			$start = 0;
		}
		
		$sql .= " LIMIT " . $start . ", " . $limit;
		
		$newsletters = $this->db->query($sql);
		
		foreach ($newsletters->rows as $newsletter) {
			$data['newsletters'][] = array (
				'email' => $newsletter['email'],
				'selected' => isset($this->request->post['selected']) && in_array($newsletter['email'], $this->request->post['selected']),
			);
		}
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/newsletter', $data));
	}
	
	public function delete() {
    	$this->language->load('extension/newsletter');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $email) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter WHERE email = '" . $this->db->escape($email) . "'");
	  		}

			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('extension/newsletter', 'token=' . $this->session->data['token'], 'SSL'));
		} else {
			$this->session->data['warning'] = $this->language->get('error_warning');
			
			$this->response->redirect($this->url->link('extension/newsletter', 'token=' . $this->session->data['token'], 'SSL'));
		}
  	}
	
	protected function validateDelete() {
    	if (!$this->user->hasPermission('modify', 'extension/newsletter')) {
      		$this->error['warning'] = $this->language->get('error_warning');  
    	}
		
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}
}