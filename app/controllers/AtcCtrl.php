<?php

namespace controllers;

use Ubiquity\utils\http\USession;
use Ubiquity\utils\http\URequest;
use Ubiquity\orm\DAO;
use models\User;
use Ubiquity\controllers\Startup;

/**
 * Auth Controller AtcCtrl
 **/
class AtcCtrl extends \Ubiquity\controllers\auth\AuthController
{

	protected function onConnect($connected)
	{
		$urlParts = $this->getOriginalURL();
		USession::set($this->_getUserSessionKey(), $connected);
		if (isset($urlParts)) {
			$this->_forward(implode("/", $urlParts));
		} else {
			Startup::forward("ToDo");
			//TODO
			//Forwarding to the default controller/action
		}
	}

	protected function _connect()
	{
		if (URequest::isPost()) {
			$email = URequest::post($this->_getLoginInputName());
			$password = URequest::post($this->_getPasswordInputName());
			$user=DAO::getOne(User::class, "email='{$email}'");
            if(isset($user) && $user->getPassword()==$password){
                return $user;
            }
			//TODO
			//Loading from the database the user corresponding to the parameters
			//Checking user creditentials
			//Returning the user
		}
		return;
	}

	public function _displayInfoAsString() {
		return true;
}


	/**
	 * {@inheritDoc}
	 * @see \Ubiquity\controllers\auth\AuthController::isValidUser()
	 */
	public function _isValidUser($action = null)
	{
		return USession::exists($this->_getUserSessionKey());
	}

	public function _getBaseRoute()
	{
		return 'AtcCtrl';
	}
	/**
      * {@inheritDoc}
      * @see \Ubiquity\controllers\auth\AuthController::_getLoginInputName()
      */
	  public function _getLoginInputName() {
		return "email";
}
}
