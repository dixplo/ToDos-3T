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

use \Ajax\php\ubiquity\JsUtils;
use component\ListAll;

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
		$tab =ListAll::home();		
		$this->jquery->getOnClick('tbody tr', "Home/checkedlist", "#response", ['attr' => 'data-ajax']);
		$this->jquery->postHref('.ui.card.link.todo', "body");
		$this->jquery->renderDefaultView(compact('tab'));
	}

	/**
	 * checkedlist
	 *
	 * @param  int $id
	 *
	 * @return void
	 */
	public function checkedlist($id)
	{
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
			$this->jquery->execAtLast("$(\"tr[data-ajax='{$id}'] .ui.checkbox\").checkbox('set {$ck}');");
			$percent = $nbchecked / count($items) * 100;
			$this->jquery->execAtLast("$(\".ui.progress\").progress({percent: {$percent}});");
			echo $this->jquery->compile();
		}
	}
}
