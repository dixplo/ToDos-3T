<?php
namespace controllers;


use Ubiquity\orm\DAO;
use models\Item;
use models\Slate;
use models\User;
use Ubiquity\utils\http\URequest;
use Ubiquity\controllers\auth\WithAuthTrait;
use Ajax\semantic\html\elements\HtmlIcon;
/**
 * Controller ToDo
 * @property \Ajax\php\ubiquity\JsUtils $jquery
 **/
class ToDo extends ControllerBase{
	use WithAuthTrait;
     protected function getAuthController(): AtcCtrl {				//A rajouter dans la page a afficher lors de la connexion
             return new AtcCtrl();
     }

    
	public function index(){
	    $semantic =$this->jquery->semantic();
	    $slate =DAO::getAll(Slate::class);
	    $containers =['<div class="classe">'];
	    foreach ($slate as $list){
	        $items =$list->getItems();
			
			$card=$semantic->htmlCard($list->getId());
			$card->addItemHeaderContent($list->getTitle(),count($items),$list->getDescription());
			
			if ($list->getTemplate()->getId()==2) {
				$nbCheked =0;
				foreach ($items as $item) {
					if ($item->getChecked()==1) {
						$nbCheked++;
					}
				}
				$card->addExtraContent("22 Friends")->addIcon("user");
				$pb=$semantic->htmlProgress($list->getId()."progressBar");
				$nbitems = (count($items) > 0) ? $nbCheked/count($items)*100 : 0 ;
				$pb->setPercent($nbitems);
				$pb->setTotal(count($items));
				$pb->setTextValues(["active"=>"","success"=>""]);
				$card->addExtraContent($pb);
			}
	        
	        array_push($containers, $card);
		}
		array_push($containers, '</div>');
		
	    $tab=$semantic->htmlTab("tabMenu",[["Todos",$containers],["Templates","Contenu de tab2"],["Account","account"]]);
		$tab->setPointing()->setSecondary();
	    $this->jquery->getOnClick('tbody tr',"ToDo/checkedlist" ,"#response", ['attr'=>'data-ajax']);
		$this->jquery->renderDefaultView(compact('tab'));
	}
	
	public function checkedlist($id) {
	    $item =DAO::getById(Item::class, $id,['slate.items']);
	    if (isset($item)) {
	        $newck =!$item->getChecked();
	        $item->setChecked($newck);
	        DAO::save($item);
			$items =$item->getSlate()->getItems();
			
	        $nbchecked =0;
	        foreach ($items as $mitem) {
	            if ($mitem->getChecked()==1) {
	                $nbchecked++;
	            }
			}
			$this->jquery->semantic()->toast('body',['message'=>'Change saved']);
			$newck ? $nbchecked++ : $nbchecked--; 
	        $ck =$newck ? 'checked':'unchecked';
	        $this->jquery->execAtLast("$(\"tr[data-ajax='{$id}'] .ui.checkbox\").checkbox('set {$ck}');");
	        $percent =$nbchecked/count($items)*100;
	        $this->jquery->execAtLast("$(\".ui.progress\").progress({percent: {$percent}});");
	        echo $this->jquery->compile();
	    }
	}

	
}
