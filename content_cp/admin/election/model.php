<?php
namespace content_cp\admin\election;


class model extends \mvc\model
{

	/**
	 * Gets the posts data
	 *
	 * @return     array  The posts.
	 */
	public function getPosts()
	{
		$args =
		[
			'title'                   => \dash\request::post('title'),
			'en_title'                => \dash\request::post('en_title'),
			'status'                  => \dash\request::post('status'),
			'eligible'                => \dash\request::post('eligible'),
			'voted'                   => \dash\request::post('voted'),
			'invalid'                 => \dash\request::post('invalid'),
			'cash'                    => \dash\request::post('cash'),
			'branchs'                 => \dash\request::post('branchs'),
			'first_vote_male_count'   => \dash\request::post('first_vote_male_count'),
			'first_vote_female_count' => \dash\request::post('first_vote_female_count'),
			'signuped_count'          => \dash\request::post('signuped_count'),
			'verified_count'          => \dash\request::post('verified_count'),
			'candida_count'           => \dash\request::post('candida_count'),
			'start_time'              => date("Y-m-d H:i:s", strtotime(\dash\request::post('start_time'))),
			'end_time'                => date("Y-m-d H:i:s", strtotime(\dash\request::post('end_time'))),
			'election_date'           => \dash\request::post('election_date'),
			'jalali_year'             => \dash\request::post('jalali_year'),
			'year'                    => \dash\request::post('year'),
			'en_url'                  => \dash\request::post('en_url'),
			'fa_url'                  => \dash\request::post('fa_url'),
			'cat'                     => \dash\request::post('cat'),
			'win'                     => \dash\request::post('win'),
			'desc'                    => \dash\request::post('desc'),
		];

		if(!\dash\request::post('start_time'))
		{
			unset($args['start_time']);
		}

		if(!\dash\request::post('end_time'))
		{
			unset($args['end_time']);
		}

		if(!\dash\request::post('election_date'))
		{
			unset($args['election_date']);
		}
		return $args;
	}


	/**
	 * Gets the list.
	 *
	 * @return     <type>  The list.
	 */
	public function get_list()
	{
		return \lib\elections::search();
	}


	/**
	 * Gets the election.
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function get_election($_args)
	{
		$result = \lib\elections::get($this->getid($_args));
		return $result;
	}


	/**
	 * Posts an edit.
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

		$result = \lib\elections::update($this->getPosts(), $id);
		if($result)
		{
			\dash\notif::ok(T_("Election updated"));
		}
		else
		{
			\dash\notif::error(T_("Error in update election"));
		}

	}


	/**
	 * Posts an election.
	 * add a alection
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function post_election($_args)
	{
		$result = \lib\elections::insert($this->getPosts());
		if($result)
		{
			\dash\notif::ok(T_("Election added"));
		}
		else
		{
			\dash\notif::error(T_("Error in adding election"));
		}
	}
}
?>