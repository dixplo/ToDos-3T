<?php
namespace controllers;
use Ubiquity\controllers\admin\UbiquityMyAdminBaseController;
use Ubiquity\controllers\auth\WithAuthTrait;
use Ubiquity\controllers\auth\AuthController;

class Admin extends UbiquityMyAdminBaseController{
    
     protected function getAuthController(): AuthController {
             return new PersoAuthController();
     }

}
