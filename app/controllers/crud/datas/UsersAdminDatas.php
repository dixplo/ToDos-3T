<?php
namespace controllers\crud\datas;

use Ubiquity\controllers\crud\CRUDDatas;

/**
 * Class UsersAdminDatas
 */
class UsersAdminDatas extends CRUDDatas {

	/**
	 *
	 * {@inheritdoc}
	 * @see \Ubiquity\controllers\crud\CRUDDatas::getFormFieldNames()
	 */
	public function getFormFieldNames($model, $instance) {
		return [
			'fname',
			'name',
			'password',
			'password_conf',
			'email'
		];
	}
}
