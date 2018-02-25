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
			$this->post('comment')->ALL();
		}
		else
		{
			$this->get('home', 'home')->ALL();
			$this->get('candida', 'candida')->ALL("/^candida$/");

			if(preg_match("/^candida$/", $url))
			{
				$this->display_name = 'content\home\candida.html';
			}
			elseif(preg_match("/^\/\d+\/comment$/", $url))
			{
				$this->display_name = 'content\home\comment.html';
			}
			else
			{
				$this->display_name = 'content\home\home.html';
			}
		}
	}
}
?>