<?php
namespace controllers\crud\files;

use Ubiquity\controllers\crud\CRUDFiles;
 /**
 * Class UsersAdminFiles
 **/
class UsersAdminFiles extends CRUDFiles{
	public function getViewDisplay(){
		return "UsersAdmin/display.html";
	}

	public function getViewForm(){
		return "UsersAdmin/form.html";
	}

	public function getViewIndex(){
		return "UsersAdmin/index.html";
	}


}
