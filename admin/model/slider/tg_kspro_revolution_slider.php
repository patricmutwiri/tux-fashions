<?php
class ModelSliderTGKSproRevolutionSlider extends Model {	
	private $errors = array();
	
	public function getSliders() {
		$output = array();
		$query = $this->db->query("SELECT * from ".DB_PREFIX."tg_kspro_revolution_slider");
		if (count($query->rows) > 0) {
			foreach ($query->rows as $row) {
				$output[] = array(
					'id' => $row['id'],
					'name' => $row['name']
				);
			}
		}
		return $output;
	}
	
	public function deleteSlider($id) {
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."tg_kspro_revolution_slider WHERE id='".$id."'");
		if(count($query->rows) > 0) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "tg_kspro_revolution_slider WHERE id = '" . $id . "'");
			return true;
		} else {
			$this->errors[] = 'This slider does not exist!';
		}
		return false;
	}
	
	public function getData($id) {
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."tg_kspro_revolution_slider WHERE id='".$id."'");
		if(count($query->rows) > 0) {
			foreach ($query->rows as $row) {
				$data = array();
				$data['name'] = $row['name'];
				$data['settings'] = unserialize($row['settings']);
				$data['content'] = unserialize($row['content']);
				return $data;
			}
		}
		return false;
	}
	
	public function saveSlider($data) {
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."tg_kspro_revolution_slider WHERE id='".$data['slider_id']."'");
		if(count($query->rows) > 0) {
			$settings = array(
				'slider_width' => $data['slider_width'],
				'slider_height' => $data['slider_height'],
				'slider_speed' => $data['slider_speed'],
				'layout_type' => $data['layout_type']
			);
			if(!isset($data['slider'])) { $data['slider'] = false; }
			$this->db->query("UPDATE " . DB_PREFIX . "tg_kspro_revolution_slider SET name = '" . $data['slider_name'] . "', settings = '" . $this->db->escape(serialize($settings)) . "', content = '" . $this->db->escape(serialize($data['slider'])) . "' WHERE id = '" . $data['slider_id'] . "'");
			return true;
		}
		$this->errors[] = 'This slider does not exist!';
		return false;
	}
	
	public function addSlider($data) {
		$settings = array(
			'slider_width' => $data['slider_width'],
			'slider_height' => $data['slider_height'],
			'slider_speed' => $data['slider_speed'],
			'layout_type' => $data['layout_type']
		);
		
		if(!isset($data['slider'])) { 
			$data['slider'] = false; 
		}

		$this->db->query("INSERT INTO " . DB_PREFIX . "tg_kspro_revolution_slider SET name = '" . $data['slider_name'] . "', settings = '" . $this->db->escape(serialize($settings)) . "', content = '" . $this->db->escape(serialize($data['slider'])) . "'");
		
		return true;
	}

	public function install() {
		if($this->is_table_exist(DB_PREFIX . "tg_kspro_revolution_slider")) {
			$query = $this->db->query("
				CREATE TABLE IF NOT EXISTS `".DB_PREFIX."tg_kspro_revolution_slider` (
					`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
					`name` text,
					`settings` text,
					`content` text,
					PRIMARY KEY (`id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1
			");
		}
		return false;
	}
	
	public function displayError() {
		$errors = '';
		foreach ($this->errors as $error) {
			$errors .= '<div>'.$error.'</div>';
		}
		return $errors;
	}

	public function is_table_exist($table){
		$query = $this->db->query("SHOW TABLES LIKE '".$table."'");
		if( count($query->rows) <= 0 ) { 
			return true;
		}
	  	return false;
	}
}
?>