<?php
namespace content\candida;


class view
{
	public static function config()
	{
		\dash\data::page_title(T_('All Candidates of Presidential Elections of Islamic Republic of Iran'));
		\dash\data::page_desc(T_('Review all candidates details'));
		\dash\data::result(\lib\candidas::get_list_all('president'));
	}
}
?>