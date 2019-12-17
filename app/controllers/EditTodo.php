<?php

namespace controllers;

use Ajax\php\ubiquity\JsUtils;
use Ajax\semantic\html\base\constants\TextAlignment;
use models\Item;
use models\Slate;
use Ubiquity\controllers\Startup;
use Ubiquity\orm\DAO;
use Ubiquity\utils\http\UResponse;

/**
 * Controller EditTodo
 * @route("todo") 
 * @property JsUtils $jquery
 **/
class EditTodo extends ControllerBase
{


	public function index()
	{ }
	/*
	* @post("editSlate/{id}");
	*/
	public function editSlate($id)
	{
		$slate = DAO::getById(Slate::class, $id); // recup la slate depuis l'id
		if (!is_null($slate) && is_int(intval($id))) { // Slate valide ( on affiche la slate)

			$title = $slate->getTitle(); // titre de la liste
			$items = $slate->getItems(); // toutes les items de la liste
			$semantic = $this->jquery->semantic();
			$nameItems = [];
			foreach ($items as $item) {
				array_push($nameItems, $item->getLabel());
			}
			$list = $semantic->dataTable("lv2-3", Item::class, $items);
			$fields =["label"];
			$captions =["Label"];
			if ($slate->getTemplate()->getId()==2) {
				$fields[] ="checked";
				$captions[] ="Checked";
			}
			$captions[]="Actions";
			$list->setFields($fields);
			$list->setCaptions($captions);
			$list->fieldAsCheckbox("checked");
			$list->addEditDeleteButtons(true, ["ajaxTransition" => "random"]);
			$list->setUrls(["sTest/search", "sTest/edit", "sTest/delete"]); // modifier
			$list->setTargetSelector("#lv2-3-update");
			$list->onPreCompile(function ($list) {
				$list->setColAlignment(1, TextAlignment::RIGHT);

				// button addItem
				$this->jquery->getOnClick('ui.icon.button.addItem', "todo/editSlate/ajoutItem", "body", ['attr' => 'data-ajax']);
			});
			$this->jquery->renderDefaultView(compact('slate','list'));
			} else { // slate invalide return la page Home
				UResponse::header("Location", "/Home");
			}
		
		
	}
	private function setColumn($list, $fields, $captions)
	{
	}

	public function ajoutItem()
	{
		$slate=DAO::getOne("models\Slate",1);
		$id = $slate->getId();
		echo $slate->getId();
		/*
		$orga = DAO::getOne(Organization::class, 1);
		$user = new User();
		$user->setFirstname('DOE');
		$user->setLastname('John');
		$user->setEmail('doe@bar.net');
		$user->setOrganization($orga);
		if (DAO::save($user)) {
			echo $user . ' added in database in ' . $orga;
		}
		*/
	}



	/*
	public function finalize() {
		parent::finalize();
		$this->jquery->execAtLast("$('.btn-menu').click(function(){
			$('.ui.sidebar')
			.sidebar({
				context: $('body')
			})
			.sidebar('attach events', '.container .menu .item');
		});");
	}
	*/
}
