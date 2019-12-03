<?php
namespace controllers;
 /**
 * Controller Template
 * @property \Ajax\php\ubiquity\JsUtils $jquery
 **/
class Template extends ControllerBase{

	public function index(){
		$this->jquery->renderDefaultView();
	}
}
