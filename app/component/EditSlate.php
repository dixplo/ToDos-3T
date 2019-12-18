<?php

namespace component;

use Ajax\semantic\html\base\constants\Color;
use Ajax\semantic\html\base\constants\TextAlignment;
use models\Item;
use models\Slate;
use models\Template;
use Ubiquity\orm\DAO;
use Ubiquity\utils\http\USession;

class EditSlate
{

    public static $semantic;

    public static function home($slate)
    {
        $containers=['salut'];
        #array_push($containers,self::menu($slate));
        #array_push($containers,self::dataTable($slate));
        return $containers;
    }

    private static function menu($slate)
    {
        $user = USession::get("currentUser");
        $menu = self::$semantic->htmlMenu("menu8");
        $menu->addMenuAsItem(["Enterprise", "Consumer"], "Products");
        $menu->addMenuAsItem(["Rails", "Python", "PHP"], "CMS solutions");
        $menu->setVertical();
        $containers = ['<div>'];
        array_push($containers, $menu.'</div>');
        return $containers;
    }
    private static function dataTable($slate)
    {
        $items = $slate->getItems(); // toutes les items de la liste
        $nameItems = [];
        $nbchecked = 0;
        foreach ($items as $item) {
            if ($item->getChecked() == 1) {
                $nbchecked++;
            }
            array_push($nameItems, $item->getLabel());
        }
        $list = self::$semantic->dataTable("dataTableSlate", Item::class, $items);
        $fields = ["label"];
        $captions = ["Label"];
        if ($slate->getTemplate()->getId() == 2) { //changer par les proprieter
            $fields[] = "checked";
            $captions[] = "Checked";
            $pb = self::$semantic->htmlProgress("progressBar");
            $nbitems = (count($items) > 0) ? $nbchecked / count($items) * 100 : 0;
            $pb->setPercent($nbitems);
            $pb->setIndicating();
            $pb->setTotal(count($items));
            $list->addItemInToolbar($pb);
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
        });
    }
}
