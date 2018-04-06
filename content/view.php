<?php
namespace content;

class view
{
	public static function config()
	{
		\dash\data::site_title(T_("Iran Presidents"));
		\dash\data::site_desc(T_("Live and complete result of iran elections after revolution until now."));
		\dash\data::site_slogan(T_("Know more about iranian presidents"));
	}
}
?>