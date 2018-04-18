<?php
namespace content\home;

class controller
{
	public static function routing()
	{
		$url = \dash\url::directory();

		if(\lib\elections::check_url($url))
		{
			\dash\open::get();
		}
	}
}
?>