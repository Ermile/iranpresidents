<?php
namespace content_cp\data;

class controller extends \mvc\controller
{
	public function ready()
	{
		parent::ready();

		\dash\permission::access('election:data:admin');
		$this->get()->ALL();
	}
}
?>