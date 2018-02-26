<?php
namespace content\home;

class controller extends \mvc\controller
{
	public function ready()
	{
		$url = \lib\router::get_url();

		if($id = $this->model()->check_url($url))
		{
			$this->get("load", "load")->ALL("/.*/");
		}
		else
		{
			$this->get('home', 'home')->ALL();
			$this->display_name = 'content\home\home.html';
		}
	}
}
?>