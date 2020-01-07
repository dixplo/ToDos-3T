<?php
namespace controllers;

use Ubiquity\controllers\Startup;
use Ubiquity\controllers\crud\CRUDEvents;
use Ubiquity\controllers\crud\CRUDFiles;
use Ubiquity\controllers\crud\viewers\ModelViewer;
use Ubiquity\orm\DAO;
use Ubiquity\utils\http\URequest;
use controllers\crud\events\UsersEvents;
use controllers\crud\files\UsersFiles;
use controllers\crud\viewers\UsersViewer;
use models\User;

/**
 * CRUD Controller Users
 */
class Users extends \Ubiquity\controllers\crud\CRUDController {

	// Provoque une erreur ligne 95 sans probleme
	public function __construct() {
		parent::__construct();
		\Ubiquity\orm\DAO::start();
		$this->model = "models\\User";
	}

	public function _getBaseRoute() {
		return 'Users';
	}

	protected function getModelViewer(): ModelViewer {
		return new UsersViewer($this);
	}

	protected function getEvents(): CRUDEvents {
		return new UsersEvents($this);
	}

	protected function getFiles(): CRUDFiles {
		return new UsersFiles();
	}

	protected function getAuthController(): AtcCtrl {
		return new AtcCtrl();
	}

	public function form() {
		$this->loadView("Users/frmAdd.html");
	}

	public function addUsers() {
		$utilisateur = new User();
		// URequest::setPostValuesToObject("$utilisateur);
		$utilisateur->setId(URequest::post('id'));
		$utilisateur->setFname(URequest::post('fname'));
		$utilisateur->setName(URequest::post('name'));
		$utilisateur->setEmail(URequest::post('email'));
		$utilisateur->setPassword(URequest::post('password'));
		if (DAO::save($utilisateur)) {
			Startup::forward("AtcCtrl");
		} else {
			echo 'Reessayer';
		}
	}
}
