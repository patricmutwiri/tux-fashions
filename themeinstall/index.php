<?php

$changes = 0;
$writes = 0;

require('ugrsr.class.php');

$path = realpath(dirname(__FILE__) . '/../') . '/';
if(!$path) die('COULD NOT DETERMINE CORRECT FILE PATH');

if(!is_writeable($path.'system/framework.php')) {
	die('system/framework.php not writeable');
}

$theme_install = new UGRSR($path);
$theme_install->file_search = false;

$theme_install->addFile('system/framework.php');
$theme_install->addPattern('~// Url~', '//Unlimited colors theme

require_once(DIR_SYSTEM . \'library/themeoptions.php\');
$theme_options = new ThemeOptions();
$registry->set(\'theme_options\', $theme_options);

');

$result = $theme_install->run();
$writes += $result['writes'];
$changes += $result['changes'];

if(!$changes) die('TEMPLATE ALREADY INSTALLED!');
if($writes != 1) die('ONE OR MORE FILES COULD NOT BE WRITTEN');
die('TEMPLATE HAS BEEN INSTALLED ON YOUR SYSTEM!');