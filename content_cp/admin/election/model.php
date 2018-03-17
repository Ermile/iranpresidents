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
			'title'                   => \lib\request::post('title'),
			'en_title'                => \lib\request::post('en_title'),
			'status'                  => \lib\request::post('status'),
			'eligible'                => \lib\request::post('eligible'),
			'voted'                   => \lib\request::post('voted'),
			'invalid'                 => \lib\request::post('invalid'),
			'cash'                    => \lib\request::post('cash'),
			'branchs'                 => \lib\request::post('branchs'),
			'first_vote_male_count'   => \lib\request::post('first_vote_male_count'),
			'first_vote_female_count' => \lib\request::post('first_vote_female_count'),
			'signuped_count'          => \lib\request::post('signuped_count'),
			'verified_count'          => \lib\request::post('verified_count'),
			'candida_count'           => \lib\request::post('candida_count'),
			'start_time'              => date("Y-m-d H:i:s", strtotime(\lib\request::post('start_time'))),
			'end_time'                => date("Y-m-d H:i:s", strtotime(\lib\request::post('end_time'))),
			'election_date'           => \lib\request::post('election_date'),
			'jalali_year'             => \lib\request::post('jalali_year'),
			'year'                    => \lib\request::post('year'),
			'en_url'                  => \lib\request::post('en_url'),
			'fa_url'                  => \lib\request::post('fa_url'),
			'cat'                     => \lib\request::post('cat'),
			'win'                     => \lib\request::post('win'),
			'desc'                    => \lib\request::post('desc'),
		];

		if(!\lib\request::post('start_time'))
		{
			unset($args['start_time']);
		}

		if(!\lib\request::post('end_time'))
		{
			unset($args['end_time']);
		}

		if(!\lib\request::post('election_date'))
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
			\lib\notif::true(T_("Election updated"));
		}
		else
		{
			\lib\notif::error(T_("Error in update election"));
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
			\lib\notif::true(T_("Election added"));
		}
		else
		{
			\lib\notif::error(T_("Error in adding election"));
		}
	}
}
?>