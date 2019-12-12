<?php
namespace component;

use Ajax\semantic\html\base\constants\Color;
use models\Slate;
use models\Template;
use Ubiquity\orm\DAO;



class ListAll{

	public static $semantic;

    public static function listToDo()
    {
        $slate =DAO::getAll(Slate::class);
		$containers =['<div class="classe">'];

	    foreach ($slate as $list){
	        $items =$list->getItems();
			
			$card=self::$semantic->htmlCard($list->getId());
			$card->addItemHeaderContent($list->getTitle(),count($items),$list->getDescription());
			$card->asLink("todo/editSlate/".$list->getId());
			$card->addClass("todo");
			$card->setTagName('a');
			
			if ($list->getTemplate()->getId()==2) {
				$nbCheked =0;
				foreach ($items as $item) {
					if ($item->getChecked()==1) {
						$nbCheked++;
					}
				}
				$pb=self::$semantic->htmlProgress($list->getId()."progressBar");
				$nbitems = (count($items) > 0) ? $nbCheked/count($items)*100 : 0 ;
				$pb->setPercent($nbitems);
				$pb->setIndicating();
				$pb->setTotal(count($items));
				$pb->setTextValues(["active"=>"","success"=>""]);
				$card->addExtraContent($pb);
			}
	        
	        array_push($containers, $card);
		}
		array_push($containers, '</div>');
        return $containers;
	}
	
	public static function listTemplate()
	{
		
        $slate =DAO::getAll(Template::class);
        
		$containers =['<div class="classe">'];

	    foreach ($slate as $list){
	        $items =$list->getItems();
			
			$card=self::$semantic->htmlCard($list->getId());
			$card->addItemHeaderContent($list->getTitle(),count($items),$list->getDescription());
			$card->asLink("todo/editSlate/".$list->getId());
			$card->addClass("todo");
			$card->setTagName('a');
			
			if ($list->getTemplate()->getId()==2) {
				$nbCheked =0;
				foreach ($items as $item) {
					if ($item->getChecked()==1) {
						$nbCheked++;
					}
				}
				$pb=self::$semantic->htmlProgress($list->getId()."progressBar");
				$nbitems = (count($items) > 0) ? $nbCheked/count($items)*100 : 0 ;
				$pb->setPercent($nbitems);
				$pb->setIndicating();
				$pb->setTotal(count($items));
				$pb->setTextValues(["active"=>"","success"=>""]);
				$card->addExtraContent($pb);
			}
	        
	        array_push($containers, $card);
		}
		array_push($containers, '</div>');
        return $containers;
	}

}