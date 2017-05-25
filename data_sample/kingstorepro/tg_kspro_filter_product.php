<?php 
$query = $this->db->query("
		INSERT INTO `".DB_PREFIX."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
		(NULL, 0, 'tg_kspro_filter_product', 'tg_kspro_filter_product_module', '{\"1\":{\"tabs\":{\"1\":{\"heading\":{\"1\":\"Women Clothes\"},\"title\":\"category\",\"product\":\"\",\"products\":\"\",\"category\":\"\",\"categories\":\"20\"},\"2\":{\"heading\":{\"1\":\"Men Clothes\"},\"title\":\"products\",\"product\":\"\",\"products\":\"42,30,47,28,41,40,48,36,34\",\"category\":\"\",\"categories\":\"\"},\"3\":{\"heading\":{\"1\":\"Children\"},\"title\":\"products\",\"product\":\"\",\"products\":\"49,33,46,30,42,43,44,45\",\"category\":\"\",\"categories\":\"\"}},\"carousel\":\"1\",\"width\":\"170\",\"height\":\"170\",\"itemsperpage\":\"6\",\"cols\":\"1\",\"limit\":\"12\",\"layout_id\":\"1\",\"position\":\"top_content\",\"status\":\"1\",\"sort_order\":\"0\"},\"2\":{\"tabs\":{\"4\":{\"heading\":{\"1\":\"Daily Deals\"},\"title\":\"products\",\"product\":\"\",\"products\":\"42,30,41,40,48,36,34,46\",\"category\":\"\",\"categories\":\"\"}},\"carousel\":\"1\",\"width\":\"170\",\"height\":\"170\",\"itemsperpage\":\"4\",\"cols\":\"1\",\"limit\":\"8\",\"layout_id\":\"1\",\"position\":\"top_content\",\"status\":\"1\",\"sort_order\":\"1\"},\"3\":{\"tabs\":{\"5\":{\"heading\":{\"1\":\"NEW ARRIVALS\"},\"title\":\"latest\",\"product\":\"\",\"products\":\"\",\"category\":\"\",\"categories\":\"\"}},\"carousel\":\"1\",\"width\":\"170\",\"height\":\"170\",\"itemsperpage\":\"3\",\"cols\":\"1\",\"limit\":\"9\",\"layout_id\":\"1\",\"position\":\"content_top\",\"status\":\"1\",\"sort_order\":\"0\"}}', 1)
		");
?>














