<?php
namespace controllers\auth\files;

use Ubiquity\controllers\auth\AuthFiles;
 /**
 * Class BidonFiles
 **/
class BidonFiles extends AuthFiles{
	public function getViewIndex(){
		return "Bidon/index.html";
	}

	public function getViewInfo(){
		return "Bidon/info.html";
	}

	public function getViewNoAccess(){
		return "Bidon/noAccess.html";
	}

	public function getViewDisconnected(){
		return "Bidon/disconnected.html";
	}

	public function getViewMessage(){
		return "Bidon/message.html";
	}

	public function getViewBaseTemplate(){
		return "Bidon/baseTemplate.html";
	}


}
