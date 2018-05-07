<?php
namespace content_cp\admin\candida;

class controller extends \mvc\controller
{
	/**
	 * route candidas page
	 */
	public function ready()
	{
		parent::ready();

		\dash\permission::access('election:admin:admin');

		$this->get("list", "list")->ALL();
		$this->get("candida", "candida")->ALL("/admin\/candida\/edit=(\d+)/");

		$this->post('candida')->ALL();
		$this->post("edit")->ALL("/admin\/candida\/edit=(\d+)/");
	}
}
?>