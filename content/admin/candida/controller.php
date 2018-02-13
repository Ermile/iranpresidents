<?php
namespace content\admin\candida;

class controller extends \content\main\controller
{
	/**
	 * route candidas page
	 */
	public function _route()
	{
		parent::_route();

		$this->access('election:admin:admin', 'block');

		$this->get("list", "list")->ALL();
		$this->get("candida", "candida")->ALL("/admin\/candida\/edit=(\d+)/");

		$this->post('candida')->ALL();
		$this->post("edit")->ALL("/admin\/candida\/edit=(\d+)/");
	}
}
?>