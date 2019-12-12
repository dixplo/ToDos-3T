<?php

use Ubiquity\log\Logger;

error_reporting ( E_ALL );
if (! defined ( 'DS' )) {
	define ( 'DS', DIRECTORY_SEPARATOR );
	define ( 'ROOT', __DIR__ . \DS .'..'.\DS. 'app' . \DS );
}
$config = include ROOT . 'config/config.php';
$sConfig= include __DIR__.\DS.'config.php';
$config ["siteUrl"] = 'http://'.$sConfig['host'].':'.$sConfig['port'].'/';
$config ['sessionName'] = $sConfig['sessionName'];
$config['debug']=true;
require ROOT . './../vendor/autoload.php';
require ROOT . 'config/services.php';
if(class_exists("\\Monolog\\Logger")){
	$config['logger']=function () use($sConfig){return new \Ubiquity\log\libraries\UMonolog($sConfig['sessionName'],\Monolog\Logger::INFO);};
	Logger::init($config);
}

\Ubiquity\controllers\Startup::run ( $config );