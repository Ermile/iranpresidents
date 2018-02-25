<?php
namespace content_cp\admin\election;

class controller extends \mvc\controller
{
	/**
	 * route election
	 */
	public function ready()
	{

		\lib\permission::access('election:admin:admin', 'block');

		$this->get("election", "election")->ALL("/admin\/election\/edit=(\d+)/");
		$this->get("list", "list")->ALL();

		$this->post("edit")->ALL("/admin\/election\/edit=(\d+)/");
		$this->post('election')->ALL();
	}
}
?>