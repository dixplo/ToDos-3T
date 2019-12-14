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
	* @route("editSlate/{id}");
	*/
	public function editSlate($id)
	{
		$slate = DAO::getById(Slate::class, $id); // recup la slate depuis l'id
		if(!is_null($slate)) { // Slate valide ( on affiche la slate)
		
			$title = $slate->getTitle(); // titre de la liste
			$items = $slate->getItems(); // toutes les items de la liste
			$semantic = $this->jquery->semantic();
			$nameItems = []; 
			foreach ($items as $item) {
				array_push($nameItems, $item->getLabel());
			}
			$list = $semantic->dataTable("lv2-3", Item::class, $items);
			$list->setFields(["label", "checked"]);
			$list->setCaptions(["Label","Checked", "Actions"]);
			$list->fieldAsCheckbox("checked");
			$list->addEditDeleteButtons(true, ["ajaxTransition" => "random"]);
			$list->setUrls(["sTest/search", "sTest/edit", "sTest/delete"]);
			$list->setTargetSelector("#lv2-3-update");
			$list->onPreCompile(function ($list) {
				$list->setColAlignment(1,TextAlignment::RIGHT);
			});
			$this->jquery->renderDefaultView(compact('title','list'));
			} else { // slate invalide return la page Home
				Startup::forward("/Home"); //la page de return
			}
		
		
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
