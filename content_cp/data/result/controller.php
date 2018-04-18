<?php
namespace content_cp\data\result;

class controller extends \mvc\controller
{
	public function ready()
	{
		parent::ready();

		\dash\permission::access('election:data:admin', 'block');

		$this->get("result", "result")->ALL("/^data\/result\/(\d+)$/");

		$this->get("add_city", "add_city")->ALL("/data\/result\/(\d+)\/place/");
		if(preg_match("/data\/result\/(\d+)\/place/", \dash\url::directory()))
		{
			$this->display_name = 'content\data\result\city_result.html';
		}
		$this->post("save_city")->ALL("/data\/result\/(\d+)\/place/");

		$this->get("electionList", "electionList")->ALL();

	}
}
?>