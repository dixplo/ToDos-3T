<?php
namespace controllers;

use component\EditSlate;
use models\Item;
use models\Slate;
use Ubiquity\orm\DAO;
use Ubiquity\utils\http\URequest;
use Ubiquity\utils\http\UResponse;
use Ubiquity\utils\http\USession;

/**
 * Controller EditTodo
 *
 * @route("todo", "automated"=>'true')
 * @property \Ajax\php\ubiquity\JsUtils $jquery
 */
class EditTodo extends ControllerBase {

	public function index() {}

	private function addDataTableBehavior() {
		$this->jquery->getOn("click", "tbody tr td[data-field=\"checked\"] label", "todo/checkedlist/", "#response", [
			'attr' => 'data-value',
			'hasLoader' => false
		]);
	}

	public function initialize() {
		parent::initialize();
		EditSlate::$semantic = $this->jquery->semantic();
	}

	/*
	 * @route("editSlate/{id}");
	 */
	public function editSlate($id) {
		$slate = DAO::getById(Slate::class, $id); // recup la slate depuis l'id
		$user = USession::get("currentUser");

		if (! is_null($slate)) { // Slate valide ( on affiche la slate)
			if (in_array($user->getEmail(), $slate->getUsers()) || $user->getEmail() == $slate->getUser()->getEmail()) {
				USession::set("idSlate", $id);

				$form = $this->jquery->semantic()->htmlForm("frm1");
				$form->addErrorMessage();
				$form->addInput("itemLabel", "Label", "text", "", "ToDo...")->addRule("empty");
				$form->addButton("btSubmit1", "Submit")->asSubmit();
				$form->submitOn("click", "btSubmit1", "todo/addItem", "#response", [
					'hasLoader' => false
				]);
				// echo $form;
				$containers = EditSlate::home($slate);
				// $this->jquery->getOnClick('ui.icon.button.addItem', "todo/editSlate/ajoutItem", "body", ['attr' => 'data-field']);
				$this->addDataTableBehavior();
				// $this->jquery->getOnClick("#div-inputAddItem button", "todo/addItem", ".liste", ['attr' => 'class', 'hasLoader' => false]);
				$this->jquery->renderDefaultView(compact('containers'));
			} else { // user invalide return la page Home
				UResponse::header("Location", "/Home");
			}
		} else { // slate invalide return la page Home
			UResponse::header("Location", "/Home");
		}
	}

	/**
	 * checkedlist
	 * recupere les liste checked avec leur %
	 *
	 * @return void on affiche directement sur la page la liste
	 */
	public function checkedlist($id) {
		$item = DAO::getById(Item::class, $id, [
			'slate.items'
		]);
		if (isset($item)) {
			$newck = ! $item->getChecked();
			$item->setChecked($newck);
			$date = date('Y-m-d H:i:s');
			$item->setDateM($date);
			DAO::save($item);
			$items = $item->getSlate()->getItems();

			$nbchecked = 0;
			foreach ($items as $mitem) {
				if ($mitem->getChecked() == 1) {
					$nbchecked ++;
				}
			}
			$this->jquery->semantic()->toast('body', [
				'message' => 'Change saved'
			]);
			$newck ? $nbchecked ++ : $nbchecked --;
			$ck = $newck ? 'checked' : 'unchecked';
			$this->jquery->execAtLast("$('tr[data-ajax=\"{$id}\"] .ui.checkbox').checkbox('set {$ck}');");
			$percent = $nbchecked / count($items) * 100;
			$this->jquery->execAtLast("$(\".ui.progress\").progress({percent: {$percent}});");
			echo $this->jquery->compile();
		}
	}

	public function addItem() {
		$label = URequest::post("itemLabel", "faut");
		$idSlate = USession::get("idSlate");
		$item = new Item();
		$item->setLabel($label);
		$item->setSlate(DAO::getById(Slate::class, $idSlate));

		$date = date('Y-m-d H:i:s');
		$item->setDateC($date);
		$item->setDateM($date);

		DAO::save($item);
		$this->jquery->execAtLast("$('#frm1').form('clear')");
		$this->jquery->get('todo/refreshItems', '#dataTableItems', [
			'jqueryDone' => 'replaceWith',
			'hasLoader' => false
		]);
		echo $this->jquery->compile();
	}

	public function refreshItems() {
		// creation normale du dataTable
		$dt = EditSlate::dataTable(DAO::getById(Slate::class, USession::get("idSlate")));
		$dt->setLibraryId('_compo_');
		$this->addDataTableBehavior();
		$this->jquery->renderView("@framework/main/component.html"); // plus pratique que le compile
	}

	/**
	 * update user
	 *
	 * @return void
	 */
	public function updateUser() {
		if (URequest::isPost()) {
			$user = DAO::getOne("models\User", URequest::post("id"));
			URequest::setPostValuesToObject($user);
			DAO::update($user);
		}
	}

	public function delete($id) {
		DAO::delete(Item::class, $id);
	}

	/*
	 * public function finalize() {
	 * parent::finalize();
	 * $this->jquery->execAtLast("$('.btn-menu').click(function(){
	 * $('.ui.sidebar')
	 * .sidebar({
	 * context: $('body')
	 * })
	 * .sidebar('attach events', '.container .menu .item');
	 * });");
	 * }
	 */
}
