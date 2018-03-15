<?php
namespace content_cp\data\report;


class model extends \mvc\model
{

	/**
	 * Gets the add.
	 *
	 * @param      <type>  $_args  The arguments
	 *
	 * @return     array   The add.
	 */
	public function get_add($_args)
	{
		$id                 = $this->getid($_args);
		$result             = [];
		$result['election'] = \lib\elections::search(null, ['id' => $id, 'limit' => 1]);

		if(isset($result['election'][0]))
		{
			$result['election'] = $result['election'][0];
		}

		$result['candida']  = \lib\candidas::search(null,
			['election_id' => $id, 'pagenation' => false, 'sort' => 'family', 'order' => 'asc']);
		$result['report']   = \lib\reports::search(null,
			['election_id' => $id, 'pagenation' => false, 'sort' => 'id', 'order' => 'asc']);

		return $result;
	}


	/**
	 * Gets the list.
	 *
	 * @return     <type>  The list.
	 */
	public function get_list()
	{
		return \lib\reports::search();
	}


	/**
	 * Posts an add result.
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function post_add_result($_args)
	{
		$id                    = $this->getid($_args);

		if(!$id)
		{
			return false;
		}

		$report                = [];
		$report['election_id'] = $id;
		$report['date']        = \lib\utility::post('date');
		$report['level']       = \lib\utility::post('level');
		$report['number']      = \lib\utility::post('number');
		$report['cash']        = \lib\utility::post('cash');
		$report['voted']       = \lib\utility::post('voted');
		$report['invalid']     = \lib\utility::post('invalid');

		$candida_total    = [];

		foreach (\lib\utility::post() as $key => $value)
		{
			if(preg_match("/^total\_(\d+)$/", $key, $split))
			{
				if(isset($split[1]))
				{
					$candida_total[$split[1]] = $value;
				}
			}
		}

		$report_id = null;
		$temp      = $report;
		$temp      = array_filter($temp);

		if(!empty($temp))
		{
			$report_id = \lib\reports::insert($report);
		}

		$insert = [];
		if(!empty($candida_total))
		{
			foreach ($candida_total as $key => $value)
			{
				$insert[] =
				[
					'election_id' => $id,
					'report_id'   => $report_id,
					'candida_id'  => $key,
					'total'       => $value,
				];
			}
		}

		if(!empty($insert))
		{
			\lib\results::disable_old($id);
			$result = \lib\results::insert_multi($insert);
			if($result)
			{
				// \lib\results::update_cash($id);
				\lib\debug::true(T_("Result added"));
			}
			else
			{
				\lib\debug::error(T_("Error in adding result"));
			}
		}
	}


	/**
	 * Gets the report.
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function get_report($_args)
	{
		$result = \lib\reports::get($this->getid($_args));
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

		$update =
		[
			'election_id' => \lib\utility::post('election_id'),
			'date'        => \lib\utility::post('date'),
			'status'      => \lib\utility::post('status'),
			'desc'        => \lib\utility::post('desc'),
			'level'       => \lib\utility::post('level'),
			'number'      => \lib\utility::post('number'),
			'cash'        => \lib\utility::post('cash'),
			'voted'       => \lib\utility::post('voted'),
			'invalid'     => \lib\utility::post('invalid'),
		];

		$result = \lib\reports::update($update, $id);
		if($result)
		{
			\lib\debug::true(T_("Report updated"));
		}
		else
		{
			\lib\debug::error(T_("Error in update report"));
		}
	}


	/**
	 * Posts an report.
	 * add a alection
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function post_report($_args)
	{

		$args =
		[
			'election_id' => \lib\utility::post('election_id'),
			'date'        => \lib\utility::post('date'),
			'status'      => \lib\utility::post('status'),
			'desc'        => \lib\utility::post('desc'),
			'level'       => \lib\utility::post('level'),
			'number'      => \lib\utility::post('number'),
			'cash'        => \lib\utility::post('cash'),
			'voted'       => \lib\utility::post('voted'),
			'invalid'     => \lib\utility::post('invalid'),
		];
		if(!is_numeric($args['election_id']) || !$args['election_id'])
		{
			\lib\debug::error(T_("Please select one items of election"));
			return false;
		}
		$result = \lib\reports::insert($args);
		if($result)
		{
			\lib\debug::true(T_("report added"));
		}
		else
		{
			\lib\debug::error(T_("Error in adding report"));
		}
	}


	public function get_report_vote($_args)
	{
		$result = [];
		$result['report'] = $this->get_report($_args);
		if(isset($result['report']['id']))
		{
			$result['vote'] = \lib\results::search(null,['report_id' => $result['report']['id']]);
		}
		return $result;
	}


	public function post_report_vote($_args)
	{
		$id                = \lib\utility::post('id') ? \lib\utility::post('id') : null;
		$update            = [];
		$update['date']    = \lib\utility::post('date') ? \lib\utility::post('date') : null;
		$update['level']   = \lib\utility::post('level') ? \lib\utility::post('level') : null;
		$update['number']  = \lib\utility::post('number') ? \lib\utility::post('number') : null;
		$update['cash']    = \lib\utility::post('cash') ? \lib\utility::post('cash') : null;
		$update['voted']   = \lib\utility::post('voted') ? \lib\utility::post('voted') : null;
		$update['invalid'] = \lib\utility::post('invalid') ? \lib\utility::post('invalid') : null;
		$update['status']  = \lib\utility::post('status') ? \lib\utility::post('status') : null;

		$update = array_filter($update);
		if(!empty($update))
		{
			\lib\reports::update($update, $id);
		}
		$post = \lib\utility::post();
		foreach ($post as $key => $value)
		{
			if(preg_match("/^total\_(\d+)$/", $key, $split))
			{
				if(isset($split[1]) && $value)
				{
					\lib\results::update(['total' => $value], $split[1]);
				}
			}
		}

		if(\lib\debug::$status)
		{
			\lib\debug::true(T_("Updated"));
		}
		else
		{
			\lib\debug::error(T_("Can not update"));
		}
	}
}
?>