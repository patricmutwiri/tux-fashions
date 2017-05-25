<?php


class ModelMenuTGksproMegamenu extends Model {
	private $errors = array();
	
	public function generate_nestable_list($lang_id) {
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."mega_menu WHERE parent_id='0' ORDER BY rang");
		$action = $this->url->link('module/tg_kspro_megamenu', 'token=' . $this->session->data['token'], 'SSL');
		$output = '<div class="cf nestable-lists">';
			$output .= '<div class="dd" id="nestable">';
				$output .= '<ol class="dd-list">';
					foreach ($query->rows as $row) {
						$json = unserialize($row['name']);
						if(isset($json[$lang_id])) {
							$name = $this->skrut($json[$lang_id], 10);
						} else {
							$name = 'Set name';
						}
						$output .= '<li class="dd-item" data-id="'.$row['id'].'">';
							$output .= '<a href="'.$action.'&delete='.$row['id'].'" onclick="return confirm(\'Are you sure you want to delete?\')" class="icon-delete"></a><a href="'.$action.'&edit='.$row['id'].'" class="icon-edit"></a>';
							$output .= '<div class="dd-handle">'.$name.' (ID: '.$row['id'].')</div>';
							$output .= $this->menu_showNested($row['id'], $lang_id);
						$output .= '</li>';
					}
				$output .= '</ol>';
			$output .= '</div>';
		$output .= '</div>';
		return $output;
	}
	
	public function menu_showNested($parentID, $lang_id) {	
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."mega_menu WHERE parent_id='".$parentID."' ORDER BY rang");
		$action = $this->url->link('module/tg_kspro_megamenu', 'token=' . $this->session->data['token'], 'SSL');
		$output = false;		
		if (count($query->rows) > 0) {
			$output .= "<ol class='dd-list'>\n";
				foreach ($query->rows as $row) {
					$output .= "\n";
					$json = unserialize($row['name']);
					if(isset($json[$lang_id])) {
						$name = $this->skrut($json[$lang_id], 10);
					} else {
						$name = 'Set name';
					}
					$output .= "<li class='dd-item' data-id='{$row['id']}'>\n";
						$output .= '<a href="'.$action.'&delete='.$row['id'].'" onclick="return confirm(\'Are you sure you want to delete?\')" class="icon-delete"></a><a href="'.$action.'&edit='.$row['id'].'" class="icon-edit"></a>';
						$output .= "<a href='".$action."&edit=".$row['id']."' class='icon-edit'></a><div class='dd-handle'>{$name} (ID: {$row['id']})</div>\n";
					
						$output .= $this->menu_showNested($row['id'], $lang_id);
					
					$output .= "</li>\n";
				}
			$output .= "</ol>\n";
		}
		return $output;
	}
	
	public function save_rang($parent_id, $id, $rang) {
		$this->db->query("UPDATE " . DB_PREFIX . "mega_menu SET parent_id = '" . $parent_id . "', rang = '" . $rang . "' WHERE id = '" . $id . "'");
	}
	
	public function addMenu($data) {
		$data['content']['categories']['categories'] = json_decode(html_entity_decode($data['content']['categories']['categories']), true);
		$this->db->query("INSERT INTO " . DB_PREFIX . "mega_menu SET name = '" . $this->db->escape(serialize($data['name'])) . "', description = '" . $this->db->escape(serialize($data['description'])) . "', icon = '" . $data['icon'] . "', link = '" . $data['link'] . "', new_window = '" . $data['new_window'] . "', status = '" . $data['status'] . "', position = '" . $data['position'] . "', submenu_width = '" . $data['submenu_width'] . "', submenu_type = '" . $data['display_submenu'] . "', rang='1000', content_width='" . $data['content_width'] . "', content_type='" . $data['content_type'] . "', content='" . $this->db->escape(serialize($data['content'])) . "'");
	}
	
	public function saveMenu($data) {
		$data['content']['categories']['categories'] = json_decode(html_entity_decode($data['content']['categories']['categories']), true);
		$this->db->query("UPDATE " . DB_PREFIX . "mega_menu SET name = '" . $this->db->escape(serialize($data['name'])) . "', description = '" . $this->db->escape(serialize($data['description'])) . "', icon = '" . $data['icon'] ."', link = '" . $data['link'] ."', new_window = '" . $data['new_window'] ."', status = '" . $data['status'] ."', position = '" . $data['position'] ."', submenu_width = '" . $data['submenu_width'] ."', submenu_type = '" . $data['display_submenu'] ."', content_width = '" . $data['content_width'] ."', content_type = '" . $data['content_type'] ."', content = '" . $this->db->escape(serialize($data['content'])) . "' WHERE id = '" . $data['id'] . "'");
	}
	
	public function deleteMenu($id) {
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."mega_menu WHERE id='".$id."'");
		if(count($query->rows) > 0) {
			$query = $this->db->query("SELECT * FROM ".DB_PREFIX."mega_menu WHERE parent_id='".$id."'");
			if(count($query->rows) > 0) {
				$this->errors[] = "Menu wasn't removed because contains submenu.";
			} else {
				$this->db->query("DELETE FROM " . DB_PREFIX . "mega_menu WHERE id = '" . $id . "'");
				return true;
			}
		} else {
			$this->errors[] = 'This menu does not exist!';
		}
		return false;
	}
	
	public function getMenu($id) {
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."mega_menu WHERE id='".$id."'");
		if(count($query->rows) > 0) { 
			$data = array();
			foreach ($query->rows as $result) {
				$data = array(
					'name' => unserialize($result['name']),
					'description' => unserialize($result['description']),
					'icon' => $result['icon'],
					'link' => $result['link'],
					'new_window' => $result['new_window'],
					'status' => $result['status'],
					'position' => $result['position'],
					'submenu_width' => $result['submenu_width'],
					'display_submenu' => $result['submenu_type'],
					'content_width' => $result['content_width'],
					'content_type' => $result['content_type'],
					'content' => unserialize($result['content'])
				);
			}
			return $data;
		}
		return false;
	}
	
	public function getCategories($array = array()) {
		$output = '';
		if(!empty($array)) {
			foreach($array as $row) {
				$output .= '<li class="dd-item" data-id="'.$row['id'].'" data-name="'.$row['name'].'">';
					$output .= '<a class="icon-delete"></a>';
					$output .= '<div class="dd-handle">'.$row['name'].'</div>';
					if(isset($row['children'])) {
						if(!empty($row['children'])) {
							$output .= $this->getCategoriesChildren($row['children']);
						}
					}
				$output .= '</li>';
			}
		}
		return $output;
	}
	
	public function getCategoriesChildren($array = array()) {
		$output = '';
		$output .= '<ol class="dd-list">';
			foreach($array as $row) {
				$output .= '<li class="dd-item" data-id="'.$row['id'].'" data-name="'.$row['name'].'">';
					$output .= '<a class="icon-delete"></a>';
					$output .= '<div class="dd-handle">'.$row['name'].'</div>';
					if(isset($row['children'])) {
						if(!empty($row['children'])) {
							$output .= $this->getCategoriesChildren($row['children']);
						}
					}
				$output .= '</li>';
			}
		$output .= '</ol>';
		return $output;
	}
	
	public function displayError() {
		$errors = '';
		foreach ($this->errors as $error) {
			$errors .= '<div>'.$error.'</div>';
		}
		return $errors;
	}

	public function install() {
		if($this->is_table_exist(DB_PREFIX . "mega_menu")) {
			$query = $this->db->query("
				CREATE TABLE IF NOT EXISTS `".DB_PREFIX."mega_menu` (
					`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
					`parent_id` int(11) NOT NULL,
					`rang` int(11) NOT NULL,
					`icon` varchar(255) NOT NULL DEFAULT '',
					`name` text,
					`link` text,
					`description` text,
					`new_window` int(11) NOT NULL DEFAULT '0',
					`status` int(11) NOT NULL DEFAULT '0',
					`position` int(11) NOT NULL DEFAULT '0',
					`submenu_width` text,
					`submenu_type` int(11) NOT NULL DEFAULT '0',
					`content_width` int(11) NOT NULL DEFAULT '12',
					`content_type` int(11) NOT NULL DEFAULT '0',
					`content` text,
					PRIMARY KEY (`id`)
				) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1
			");
		}
		return false;
	}
	
	public function skrut($c,$d) {
		if(strlen($c) > $d) {
			$ciag = substr($c,0,$d);
			$ciag .="...";               
			return $ciag; 
		} else {
			return $c;	 
		}
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