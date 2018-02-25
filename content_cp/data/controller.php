<?php
namespace content\data;

class controller extends \mvc\controller
{
	public function ready()
	{
		parent::ready();

		\lib\permission::access('election:data:admin', 'block');
		$this->get()->ALL();
	}
}
?>