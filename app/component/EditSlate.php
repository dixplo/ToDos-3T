<?php

namespace component;

use Ajax\php\ubiquity\JsUtils;
use Ajax\semantic\html\base\constants\Color;
use Ajax\semantic\html\base\constants\TextAlignment;
use models\Item;
use models\Slate;
use models\Template;
use Ubiquity\orm\DAO;
use Ubiquity\utils\http\USession;
use Ajax\semantic\widgets\datatable\PositionInTable;

class EditSlate
{

    public static $semantic;

    public static function home($slate)
    {
        return '<div>' . self::leftMenu($slate) . '</div>'.'<div class="ui container slate"><div class="liste">' . self::formAddItem() .'<div id="dataTableItems">'. self::dataTable($slate) . '</div>' . '</div>' . '</div>';
    }

    private static function leftMenu($slate)
    {
        $menu = self::$semantic->htmlMenu("vertcalMenu");
        $menu->addMenuAsItem([$slate->getUser()->getEmail()], "<h1>" . $slate->getTitle() . "</h1>");
        $usersEmail = [];
        if (!empty($slate->getUsers())) {
            foreach ($slate->getUsers() as $user) {
                $usersEmail[] = $user->getEmail();
            }
        }
        $menu->addMenuAsItem($usersEmail, "Users list");
        $menu->setVertical();
        return $menu;
    }
    public static function formAddItem()
    {

        $form = self::$semantic->htmlForm("frm1");
        $form->addErrorMessage();
        $form->addInput("itemLabel", "Label", "text", "", "ToDo...")->addRule("empty");
        $form->addButton("btSubmit1", "Submit")->asSubmit();
        $form->submitOn("click", "btSubmit1", "todo/addItem", "#response", ['hasLoader' => false]);
        return $form;
    }
    public static function dataTable($slate)
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
        $list->setUrls(["sTest/search", "sTest/edit", "todo/delete"]); // modifier
        $list->setTargetSelector("#dataTableSlate-update");
        $list->setIdentifierFunction('getId');
        $list->setEdition(true);
        $list->setToolbarPosition(PositionInTable::BEFORETABLE);
        $list->onPreCompile(function ($list) {
            $list->setColAlignment(1, TextAlignment::RIGHT);
        });
        return $list;
    }
}
