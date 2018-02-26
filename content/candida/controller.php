<?php
namespace content\candida;

class controller extends \mvc\controller
{
	public function ready()
	{
		$this->get()->ALL();
	}
}
?>