<?php
class ControllerModuleTGKSproRevolutionSlider extends Controller {
	public function index($setting) {
		
		$this->load->model('slider/tg_kspro_revolution_slider');

		$data['slider'] = $this->model_slider_tg_kspro_revolution_slider->getSlider($setting['slider_id']);
		
		$data['language_id'] = $this->config->get('config_language_id');

		return $this->load->view('module/tg_kspro_revolution_slider', $data);
	}
}
?>