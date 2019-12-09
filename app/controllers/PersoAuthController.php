<?php
namespace controllers;
use controllers\auth\files\PersoAuthControllerFiles;
use Ubiquity\controllers\auth\AuthFiles;

 /**
 * Auth Controller PersoAuthController
 **/
class PersoAuthController extends \controllers\AtcCtrl{

	public function _getBaseRoute() {
		return 'PersoAuthController';
	}
	
	protected function getFiles(): AuthFiles{
		return new PersoAuthControllerFiles();
	}

	/**
  * {@inheritDoc}
  * @see \Ubiquity\controllers\auth\AuthController::badLoginMessage()
  */
  protected function badLoginMessage(\Ubiquity\utils\flash\FlashMessage $fMessage) {
	$fMessage->setTitle("Erreur d'authentification");
	$fMessage->setContent("Login ou mot de passe incorrects !");
	$this->_setLoginCaption("Essayer à nouveau");

}



}
