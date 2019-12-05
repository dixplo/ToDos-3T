<?php
namespace controllers;
 /**
 * Controller EditTodo
 **/
class EditTodo extends ControllerBase{

	public function index(){
		$this->loadView("EditTodo/index.html");
	}
}
