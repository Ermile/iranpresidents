<?php
namespace content\data;

class controller extends \content\main\controller
{
	public function _route()
	{
		parent::_route();

		$this->access('election:data:admin', 'block');
		$this->get()->ALL();
	}
}
?>