<?php
namespace controllers;
 use Ajax\php\ubiquity\JsUtils;

 /**
 * Controller EditTodo
  * @property JsUtils $jquery
 **/
class EditTodo extends ControllerBase{

	public function index(){

       

		$this->jquery->renderView("EditTodo/index.html");
	}
}
