<?php
namespace content\home;

class controller
{
	public static function routing()
	{
		if(\dash\url::domain() === 'iranpresidents.com')
		{
			\dash\redirect::to('https://mrelected.ir/');
		}

		$url = \dash\url::directory();

		if(\lib\elections::check_url($url))
		{
			\dash\open::get();
		}
	}
}
?>