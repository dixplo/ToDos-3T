<?php
namespace controllers\crud\files;

use Ubiquity\controllers\crud\CRUDFiles;
 /**
 * Class UsersFiles
 **/
class UsersFiles extends CRUDFiles{
	public function getViewIndex(){
		return "Users/index.html";
	}

	public function getViewForm(){
		return "Users/form.html";
	}

	public function getViewDisplay(){
		return "Users/display.html";
	}

	/**
     * {@inheritDoc}
     * @see \Ubiquity\controllers\crud\CRUDFiles::getBaseTemplate()
     */
	public function getBaseTemplate() {
        return "ToDo/index.html";
    }


}
