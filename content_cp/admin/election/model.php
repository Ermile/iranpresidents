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
			'title'                   => \lib\utility::post('title'),
			'en_title'                => \lib\utility::post('en_title'),
			'status'                  => \lib\utility::post('status'),
			'eligible'                => \lib\utility::post('eligible'),
			'voted'                   => \lib\utility::post('voted'),
			'invalid'                 => \lib\utility::post('invalid'),
			'cash'                    => \lib\utility::post('cash'),
			'branchs'                 => \lib\utility::post('branchs'),
			'first_vote_male_count'   => \lib\utility::post('first_vote_male_count'),
			'first_vote_female_count' => \lib\utility::post('first_vote_female_count'),
			'signuped_count'          => \lib\utility::post('signuped_count'),
			'verified_count'          => \lib\utility::post('verified_count'),
			'candida_count'           => \lib\utility::post('candida_count'),
			'start_time'              => date("Y-m-d H:i:s", strtotime(\lib\utility::post('start_time'))),
			'end_time'                => date("Y-m-d H:i:s", strtotime(\lib\utility::post('end_time'))),
			'election_date'           => \lib\utility::post('election_date'),
			'jalali_year'             => \lib\utility::post('jalali_year'),
			'year'                    => \lib\utility::post('year'),
			'en_url'                  => \lib\utility::post('en_url'),
			'fa_url'                  => \lib\utility::post('fa_url'),
			'cat'                     => \lib\utility::post('cat'),
			'win'                     => \lib\utility::post('win'),
			'desc'                    => \lib\utility::post('desc'),
		];

		if(!\lib\utility::post('start_time'))
		{
			unset($args['start_time']);
		}

		if(!\lib\utility::post('end_time'))
		{
			unset($args['end_time']);
		}

		if(!\lib\utility::post('election_date'))
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
			\lib\debug::true(T_("Election updated"));
		}
		else
		{
			\lib\debug::error(T_("Error in update election"));
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
			\lib\debug::true(T_("Election added"));
		}
		else
		{
			\lib\debug::error(T_("Error in adding election"));
		}
	}
}
?>