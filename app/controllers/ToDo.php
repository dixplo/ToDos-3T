<?php
namespace controllers;


use Ubiquity\orm\DAO;
use models\Item;
use models\Slate;
 /**
 * Controller ToDo
 * @property \Ajax\php\ubiquity\JsUtils $jquery
 **/
class ToDo extends ControllerBase{

    
	public function index(){
	    $semantic =$this->jquery->semantic();
	    $slate =DAO::getAll(Slate::class);
	    $containers =[];
	    foreach ($slate as $list){
	        $items =$list->getItems();
	        $container =$semantic->htmlSegment($list->getId());
	        $container->addLabel($list->getTitle());
	        
	        $table =$semantic->dataTable("datatable", Item::class, $items);
	        $table->addClass('very basic collapsing');
	        $table->setFields(['checked', 'value', 'label']);
	        $table->setCaptions(["Check","Quantity","Label"]);
	        $table->setIdentifierFunction('getId');
	        $table->fieldAsCheckbox('checked');
	        $pb=$semantic->htmlProgress("progress");
	        
	        $nbCheked =0;
	        foreach ($items as $mitem) {
	            if ($mitem->getChecked()==1) {
	                $nbCheked++;
	            }
	        }
	        $pb->setPercent($nbCheked/count($items)*100);//foreach compte nb checked 
	        $pb->setTotal(count($items));
	        $pb->setTextValues(["active"=>"","success"=>""]);
	        $container->addContent($table);
	        $container->addContent($pb);
	        
	        array_push($containers, $container);
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
