<?php
namespace controllers;

use controllers\crud\datas\UsersAdminDatas;
use Ubiquity\controllers\crud\CRUDDatas;
use controllers\crud\viewers\UsersAdminViewer;
use Ubiquity\controllers\crud\viewers\ModelViewer;
use controllers\crud\events\UsersAdminEvents;
use Ubiquity\controllers\crud\CRUDEvents;
use controllers\crud\files\UsersAdminFiles;
use Ubiquity\controllers\crud\CRUDFiles;
use models\User;

/**
 * CRUD Controller UsersAdmin
 */
class UsersAdmin extends \Ubiquity\controllers\crud\CRUDController {

	public function __construct() {
		parent::__construct();
		\Ubiquity\orm\DAO::start();
		$this->model = User::class;
	}

	public function _getBaseRoute() {
		return 'UsersAdmin';
	}

	protected function getAuthController(): AtcCtrl {
		return new AtcCtrl();
	}

	protected function getAdminData(): CRUDDatas {
		return new UsersAdminDatas($this);
	}

	protected function getModelViewer(): ModelViewer {
		return new UsersAdminViewer($this);
	}

	protected function getEvents(): CRUDEvents {
		return new UsersAdminEvents($this);
	}

	protected function getFiles(): CRUDFiles {
		return new UsersAdminFiles();
	}

	public function form() {
		$user = new User();
		$user->_new = true;
		$this->_edit($user);
	}
}
