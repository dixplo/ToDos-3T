<?php
namespace controllers\auth\files;

use Ubiquity\controllers\auth\AuthFiles;
 /**
 * Class AtcCtrlFiles
 **/
class AtcCtrlFiles extends AuthFiles{
	public function getViewIndex(){
		return "AtcCtrl/index.html";
	}

	public function getViewInfo(){
		return "AtcCtrl/info.html";
	}

	public function getViewNoAccess(){
		return "AtcCtrl/noAccess.html";
	}

	public function getViewDisconnected(){
		return "AtcCtrl/disconnected.html";
	}

	public function getViewMessage(){
		return "AtcCtrl/message.html";
	}

	public function getViewBaseTemplate(){
		return "AtcCtrl/baseTemplate.html";
	}


}