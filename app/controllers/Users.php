<?php
namespace controllers;
use controllers\crud\datas\UsersDatas;
use Ubiquity\controllers\crud\CRUDDatas;
use controllers\crud\viewers\UsersViewer;
use Ubiquity\controllers\crud\viewers\ModelViewer;
use controllers\crud\events\UsersEvents;
use Ubiquity\controllers\crud\CRUDEvents;
use controllers\crud\files\UsersFiles;
use Ubiquity\controllers\crud\CRUDFiles;
use Ubiquity\controllers\auth\WithAuthTrait;
use Ubiquity\utils\http\URequest;
use Ubiquity\controllers\auth\AuthController;
use Ubiquity\controllers\auth\AuthControllerCoreTrait,
        Ubiquity\controllers\auth\AuthControllerVariablesTrait,
        Ubiquity\controllers\auth\AuthControllerOverrideTrait,
        Ubiquity\controllers\semantic\InsertJqueryTrait;

/**
 * CRUD Controller Users
 **/
class Users extends \Ubiquity\controllers\crud\CRUDController{

	use WithAuthTrait{
        initialize as _initializeAuth;
	}
	
	public function initialize(){
        $this->_initializeAuth();
        if(!URequest::isAjax()){
            $this->loadView("main/vHeader.html");
        }
    }

	public function __construct(){
		parent::__construct();
		\Ubiquity\orm\DAO::start();
		$this->model="models\\User";
	}

	public function _getBaseRoute() {
		return 'Users';
	}
	
	protected function getAdminData(): CRUDDatas{
		return new UsersDatas($this);
	}

	protected function getModelViewer(): ModelViewer{
		return new UsersViewer($this);
	}

	protected function getEvents(): CRUDEvents{
		return new UsersEvents($this);
	}

	protected function getFiles(): CRUDFiles{
		return new UsersFiles();
	}

	protected function getAuthController(): AuthController {
        return new AuthExt();
    }


}
