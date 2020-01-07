<?php
namespace controllers\crud\viewers;

use Ubiquity\controllers\crud\viewers\ModelViewer;
use Ajax\semantic\components\validation\Rule;

/**
 * Class UsersAdminViewer
 */
class UsersAdminViewer extends ModelViewer {

	public function getFormCaptions($captions, $className, $instance) {
		return [
			'',
			'Prénom',
			'Nom',
			'Mot de passe',
			'Confirmation de mot de passe',
			'Email'
		];
	}

	public function getForm($identifier, $instance) {
		$form = parent::getForm($identifier, $instance);
		$form->fieldAsInput('password_conf', [
			'inputType' => 'password',
			'rules' => [
				'empty',
				Rule::match('password', 'Les deux mots de passe saisis ne correspondent pas')
			]
		]);
		return $form;
	}
}
