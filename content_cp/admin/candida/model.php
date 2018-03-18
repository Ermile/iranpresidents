<?php
namespace content_cp\admin\candida;


class model extends \mvc\model
{

	/**
	 * Gets the list.
	 *
	 * @return     <type>  The list.
	 */
	public function get_list()
	{
		return \lib\candidas::search();
	}


	/**
	 * get data in posts
	 *
	 * @return     array  The post.
	 */
	public function getPost()
	{
		$args =
		[
			'name'         => \lib\request::post('name'),
			'en_name'      => \lib\request::post('en_name'),
			'family'       => \lib\request::post('family'),
			'en_family'    => \lib\request::post('en_family'),
			'father'       => \lib\request::post('father'),
			'en_father'    => \lib\request::post('en_father'),
			'fame'         => \lib\request::post('fame'),
			'en_fame'      => \lib\request::post('en_fame'),
			'birthdate'    => \lib\request::post('birthdate'),
			'nationalcode' => \lib\request::post('nationalcode'),
			'electioncode' => \lib\request::post('electioncode'),
			'election_id'  => \lib\request::post('election_id'),
			'status'       => \lib\request::post('status'),
			'desc'         => \lib\request::post('desc'),
		];

		if(!\lib\request::post('birthdate'))
		{
			unset($args['birthdate']);
		}

		$file_url = $this->find_updload('file_url');
		if($file_url)
		{
			$args['file_url'] = $file_url;
		}

		$file_url_2 = $this->find_updload('file_url_2');
		if($file_url_2)
		{
			$args['file_url_2'] = $file_url_2;
		}

		$win_url = $this->find_updload('win_url');
		if($win_url)
		{
			$args['win_url'] = $win_url;
		}

		return $args;
	}


	/**
	 * Gets the candida.
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function get_candida($_args)
	{
		$result = \lib\candidas::get($this->getid($_args));
		return $result;
	}


	/**
	 * add a candida
	 *
	 * @param      <type>   $_args  The arguments
	 *
	 * @return     boolean  ( description_of_the_return_value )
	 */
	public function post_edit($_args)
	{
		$id = $this->getid($_args);
		if(!$id)
		{
			return false;
		}

		$result = \lib\candidas::update($this->getPost(), $id);

		if($result)
		{
			\lib\notif::true(T_("Candida updated"));
		}
		else
		{
			\lib\notif::error(T_("Error in update candida"));
		}

	}


	/**
	 * find file uploaded or no
	 *
	 * @param      <type>  $_name  The name
	 *
	 * @return     string  ( description_of_the_return_value )
	 */
	public function find_updload($_name)
	{
		if(\lib\request::files($_name))
		{
			$target_dir = root. "public_html/static/images/election/";
			if(!\lib\utility\file::exists($target_dir))
			{
				\lib\utility\file::makeDir($target_dir);
			}

			$basename = basename(\lib\request::files($_name)["name"]);

			$target_file = $target_dir . $basename;

			if (move_uploaded_file(\lib\request::files($_name)["tmp_name"], $target_file))
			{
				return 'images/election/'. $basename;
			}
		}
		return false;
	}


	/**
	 * Posts an candida.
	 * add a alection
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function post_candida($_args)
	{
		$args = $this->getPost();

		if(!is_numeric($args['election_id']) || !$args['election_id'])
		{
			\lib\notif::error(T_("Please select one items of election"));
			return false;
		}

		$result = \lib\candidas::insert($args);

		if($result)
		{
			\lib\notif::true(T_("Candida added"));
		}
		else
		{
			\lib\notif::error(T_("Error in adding candida"));
		}
	}
}
?>