<?php 
$query = $this->db->query("
	DROP TABLE IF EXISTS `".DB_PREFIX ."tg_kspro_revolution_slider`
");

$query = $this->db->query("
		CREATE TABLE IF NOT EXISTS `".DB_PREFIX."tg_kspro_revolution_slider` (
			`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
			`name` text,
			`settings` text,
			`content` text,
			PRIMARY KEY (`id`)
		) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1
");

$query = $this->db->query("
		INSERT INTO `".DB_PREFIX."tg_kspro_revolution_slider` (`id`, `name`, `settings`, `content`) VALUES
		(1, 'New slider', 'a:4:{s:12:\"slider_width\";s:3:\"620\";s:13:\"slider_height\";s:3:\"516\";s:12:\"slider_speed\";s:1:\"9\";s:11:\"layout_type\";s:1:\"0\";}', 'a:2:{i:1;a:1:{i:1;a:4:{s:6:\"status\";s:1:\"1\";s:6:\"slider\";s:31:\"catalog/kingstorepro/slide1.jpg\";s:17:\"transition_effect\";s:6:\"random\";s:4:\"link\";s:0:\"\";}}i:2;a:1:{i:1;a:4:{s:6:\"status\";s:1:\"1\";s:6:\"slider\";s:31:\"catalog/kingstorepro/slide2.jpg\";s:17:\"transition_effect\";s:6:\"random\";s:4:\"link\";s:0:\"\";}}}')
		");?>