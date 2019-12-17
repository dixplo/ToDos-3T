<?php

namespace controllers;

use Ajax\php\ubiquity\JsUtils;
use Ajax\semantic\html\base\constants\TextAlignment;
use models\Item;
use models\Slate;
use Ubiquity\controllers\Startup;
use Ubiquity\orm\DAO;
use Ubiquity\utils\http\URequest;
use Ubiquity\utils\http\UResponse;
use Ubiquity\utils\http\USession;

/**
 * Controller EditTodo
 * @route("todo", "automated"=>'true') 
 * @property JsUtils $jquery
 **/
class EditTodo extends ControllerBase
{


	public function index()
	{
	}
	/*
	* @route("editSlate/{id}");
	*/
	public function editSlate($id)
	{
		$slate = DAO::getById(Slate::class, $id); // recup la slate depuis l'id

		if (!is_null($slate)) { // Slate valide ( on affiche la slate)
			USession::set("currentSlate", $slate);

			$title = $slate->getTitle(); // titre de la liste
			$items = $slate->getItems(); // toutes les items de la liste
			$semantic = $this->jquery->semantic();
			$nameItems = [];
			foreach ($items as $item) {
				array_push($nameItems, $item->getLabel());
			}
			$list = $semantic->dataTable("dataTableSlate", Item::class, $items);
			$fields = ["label"];
			$captions = ["Label"];
			if ($slate->getTemplate()->getId() == 2) {//changer par les proprieter
				$fields[] = "checked";
				$captions[] = "Checked";
			}
			$captions[] = "Actions";
			$list->setFields($fields);
			$list->setCaptions($captions);
			$list->fieldAsCheckbox("checked")->setIdentifierFunction('getId');
			$list->addEditDeleteButtons(true, ["ajaxTransition" => "random"]);
			$list->setUrls(["sTest/search", "sTest/edit", "sTest/delete"]); // modifier
			$list->setTargetSelector("#dataTableSlate-update");
			$list->setIdentifierFunction('getId');
			$list->setEdition(true);
			$list->onPreCompile(function ($list) {
				$list->setColAlignment(1, TextAlignment::RIGHT);

				// button addItem
				$this->jquery->getOnClick('ui.icon.button.addItem', "todo/editSlate/ajoutItem", "body", ['attr' => 'data-field']);
			});
			
			$this->jquery->getOnClick("tbody tr td[data-field=\"checked\"] label", "todo/checkedlist/","",['attr'=>'data-value']);
			$this->jquery->renderDefaultView(compact('slate', 'list'));
		} else { // slate invalide return la page Home
			UResponse::header("Location", "/Home");
		}
	}
	
	/**
	 * checkedlist 
	 * recupere les liste checked avec leur %
	 * @return void on affiche directement sur la page la liste
	 */
	public function checkedlist($id)
	{
		echo $id;
		$item = DAO::getById(Item::class, $id, ['slate.items']);
		if (isset($item)) {
			$newck = !$item->getChecked();
			$item->setChecked($newck);
			DAO::save($item);
			$items = $item->getSlate()->getItems();

			$nbchecked = 0;
			foreach ($items as $mitem) {
				if ($mitem->getChecked() == 1) {
					$nbchecked++;
				}
			}
			$this->jquery->semantic()->toast('body', ['message' => 'Change saved']);
			$newck ? $nbchecked++ : $nbchecked--;
			$ck = $newck ? 'checked' : 'unchecked';
			echo $ck;
			$this->jquery->execAtLast("$(\"tr[data-ajax=\"{$id}\"] .ui.checkbox\").checkbox('set {$ck}');");
			/*$percent = $nbchecked / count($items) * 100;
			$this->jquery->execAtLast("$(\".ui.progress\").progress({percent: {$percent}});");*/
			echo $this->jquery->compile();
		}
	}

	public function ajoutItem()
	{
		$slate = DAO::getOne(Slate::class, 1);
		$id = $slate->getId();
		echo $id;
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

	/**
	 * update user
	 *
	 * @return void
	 */
	public function update()
	{
		if (URequest::isPost()) {
			$user = DAO::getOne("models\User", URequest::post("id"));
			URequest::setPostValuesToObject($user);
			DAO::update($user);
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
