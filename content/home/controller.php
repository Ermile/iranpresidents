<?php
namespace content\home;

class controller extends \content\main\controller
{
	public function ready()
	{
		$url = \lib\router::get_url();

		if($id = $this->model()->check_url($url))
		{
			$this->get("load", "load")->ALL("/.*/");
			$this->post('comment')->ALL("/^iran\/president\/\d+$/");
		}
		else
		{
			switch ($url)
			{
				case 'election':
				case 'انتخابات':
				case 'انتخاب':
				case 'e':
				case '':
					$this->redirector($this->url('base'). '/iran')->redirect();
					return;
					# code...
					break;
				case 'iran':
					$this->redirector($this->url('base'). '/iran/president')->redirect();
					return;
					break;
				default:
					# code...
					break;
			}
			
			$this->get('home', 'home')->ALL("/^iran\/president$/");
			$this->get('candida', 'candida')->ALL("/^iran\/president\/candida$/");

			// $this->get('comment', 'comment')->ALL("/^iran\/president\/\d+\/comment$/");

			if(preg_match("/^iran\/president\/candida$/", $url))
			{
				$this->display_name = 'content\home\candida.html';
			}
			elseif(preg_match("/^iran\/president\/\d+\/comment$/", $url))
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