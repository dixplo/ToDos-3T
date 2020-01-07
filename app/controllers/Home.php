<?php

namespace controllers;

use Ubiquity\orm\DAO;

use models\Item;
use models\Slate;
use models\User;
use Ubiquity\utils\http\URequest;
use Ubiquity\controllers\auth\WithAuthTrait;
use Ajax\semantic\html\elements\HtmlIcon;
use Ajax\semantic\html\base\constants\Color;
use Ubiquity\utils\http\USession;
use \Ajax\php\ubiquity\JsUtils;
use component\ListAll;
use Ubiquity\utils\http\UResponse;

/**
 * Controller ToDo
 * @property JsUtils $jquery
 * @route("Home","automated"=>true)
 **/
class Home extends ControllerBase
{
	use WithAuthTrait;
	protected function getAuthController(): AtcCtrl
	{				//A rajouter dans la page a afficher lors de la connexion
		return new AtcCtrl();
	}

	public function initialize()
	{
		parent::initialize();
		ListAll::$semantic = $this->jquery->semantic();
	}


	/**
	 * index
	 * home page
	 * @return void
	 */
	public function index()
	{
		$tab = ListAll::home();
		//$this->jquery->postHref('.ui.card.link.todo');


		
		$this->jquery->renderDefaultView(compact('tab'));
	}

	public function changeInfos()
	{
		$user = USession::get("currentUser");
		$fname = URequest::post("first-name");
		$name = URequest::post("last-name");
		$password = URequest::post("password");

		$user->setFname($fname);
		$user->setName($name);
		$user->setPassword($password);
		DAO::save($user);

		
	}
}
