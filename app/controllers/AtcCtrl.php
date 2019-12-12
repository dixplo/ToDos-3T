<?php

namespace controllers;

use Ubiquity\utils\http\USession;
use Ubiquity\utils\http\URequest;
use Ubiquity\orm\DAO;
use models\User;
use Ubiquity\controllers\Startup;
use Ajax\php\symfony\Jquery_;
use \Ajax\php\ubiquity\JsUtils;

/**
 * Auth Controller AtcCtrl
 * @property JsUtils $jquery
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
			Startup::forward("Home");
			//TODO
			//Forwarding to the default controller/action
		}
	}

	public function _connect()
	{
		if (URequest::isPost()) {
			$email = URequest::post($this->_getLoginInputName());
			$password = URequest::post($this->_getPasswordInputName());
			$user=DAO::getOne(User::class, "email='{$email}'");
            if(isset($user) && $user->getPassword()==$password){
				echo $user;
			
			}
			else{
				echo "merde1";
			}
			//TODO
			//Loading from the database the user corresponding to the parameters
			//Checking user creditentials
			//Returning the user
		}
		else {
			echo"merde2";
		}
		return "mon cul";
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
