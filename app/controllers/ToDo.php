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
	    $containers =[];
	    foreach ($slate as $list){
	        $items =$list->getItems();
			
			$card=$semantic->htmlCard("card3");
			$card->addRevealImage("https://semantic-ui.com/images/avatar/large/jenny.jpg","https://semantic-ui.com/images/avatar/large/elliot.jpg","slide");
			$card->addItemHeaderContent("Team Fu & Hess","Create in Sep 2014");
			$card->addExtraContent(HtmlIcon::label("","users","2 members")->asLink("#"));
			echo $card;

	        $pb->setPercent($nbCheked/count($items)*100);//foreach compte nb checked 
	        $pb->setTotal(count($items));
	        $pb->setTextValues(["active"=>"","success"=>""]);
	        
	        array_push($containers, $card);
	    }
	    
	    
	   /* $pb=$semantic->htmlProgress("progress");
	    $pb->setPercent($nbCheked/count($labelitems)*100);
	    $pb->setTotal(count($labelitems));
	    $pb->setTextValues(["active"=>"","success"=>""]);*/
	    
	    $this->jquery->getOnClick('tbody tr',"ToDo/checkedlist" ,"#response", ['attr'=>'data-ajax']);
	    
		$this->jquery->renderDefaultView(compact('containers'));
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
