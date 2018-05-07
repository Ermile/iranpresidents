<?php
namespace content\home;

class view
{


	public static function config()
	{
		$url = \dash\url::directory();

		if($id = \lib\elections::check_url($url))
		{
			self::load_election();
			\dash\data::display_iran('content\\home\\all.html');
		}
		else
		{
			self::view_home();
			\dash\data::display_iran('content\\home\\home.html');
		}

		$running  = [];
		$election = \lib\elections::search();

		\dash\data::page_title(T_('Presidents of Islamic Republic of Iran'));
		\dash\data::page_desc(T_('Live and complete result of iran elections after revolution until now.'));

		\dash\data::electionList($election);

		foreach ($election as $key => $value)
		{
			if(isset($value['status']) && $value['status'] === 'running')
			{
				$running[] = $value;
			}
		}

		\dash\data::running($running);

		if(\dash\permission::check('election:admin:admin'))
		{
			\dash\data::permAdmin(true);
		}

		if(\dash\permission::check('election:data:admin'))
		{
			\dash\data::permData(true);
		}
	}



	public static function load_election()
	{
		$result = \content\home\model::get_load();

		\dash\data::result($result);

		if(\dash\data::lang_current() === 'fa')
		{
			if(\dash\data::result_election())
			{
				$el = \dash\data::result_election();
				$title_of_el = isset($el['title'])? $el['title']: null;
				\dash\data::page_title($title_of_el);
				\dash\data::page_desc('نتایج لحظه‌ای '. $title_of_el. '. آخرین نتایج انتخابات ریاست جمهوری را بررسی کنید');
			}
		}
		else
		{
			if(\dash\data::result_election())
			{
				$el = \dash\data::result_election();
				$title_of_el = isset($el['en_title'])? $el['en_title']: null;
				\dash\data::page_title(T_('Results of'). ' '. $title_of_el);
				\dash\data::page_desc(T_('Live result of '). $title_of_el);
			}
		}

		$el = \dash\data::result_candida();

		if(isset($el['candida'][0]['file_url']))
		{
			$image_of_winner = \dash\url::base(). $el['candida'][0]['file_url'];

			\dash\data::share_twitterCard('summary_large_image');
			\dash\data::share_image($image_of_winner);
		}

	}


	/**
	 * view candida
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public static function view_home()
	{
		$sort  = null;
		$order = null;


		if(\dash\request::get('sort'))
		{
			$sort = \dash\request::get('sort');
		}

		if(\dash\request::get('order') && in_array(\dash\request::get('order'), ['asc', 'desc']))
		{
			$order = \dash\request::get('order');
		}

		$time_line = \lib\results::home_page('president', $sort, $order);
		\dash\data::result($time_line);
	}

}
?>