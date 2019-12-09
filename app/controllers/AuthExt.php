<?php
namespace controllers;
use controllers\auth\files\AuthExtFiles;
use Ubiquity\controllers\auth\AuthFiles;

 /**
 * Auth Controller AuthExt
 **/
class AuthExt extends \controllers\AtcCtrl{

	public function _getBaseRoute() {
		return 'AuthExt';
	}
	
	protected function getFiles(): AuthFiles{
		return new AuthExtFiles();
	}

	/**
     * {@inheritDoc}
     * @see \Ubiquity\controllers\auth\AuthController::_displayInfoAsString()
     */
	public function _displayInfoAsString() {
        return true;
    }



}
