<?php
namespace content\admin\candida;

class controller extends \mvc\controller
{
	/**
	 * route candidas page
	 */
	public function ready()
	{
		parent::ready();

		\lib\permission::access('election:admin:admin', 'block');

		$this->get("list", "list")->ALL();
		$this->get("candida", "candida")->ALL("/admin\/candida\/edit=(\d+)/");

		$this->post('candida')->ALL();
		$this->post("edit")->ALL("/admin\/candida\/edit=(\d+)/");
	}
}
?>