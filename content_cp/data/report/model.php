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
		$report['date']        = \lib\request::post('date');
		$report['level']       = \lib\request::post('level');
		$report['number']      = \lib\request::post('number');
		$report['cash']        = \lib\request::post('cash');
		$report['voted']       = \lib\request::post('voted');
		$report['invalid']     = \lib\request::post('invalid');

		$candida_total    = [];

		foreach (\lib\request::post() as $key => $value)
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
				\lib\notif::true(T_("Result added"));
			}
			else
			{
				\lib\notif::error(T_("Error in adding result"));
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
			'election_id' => \lib\request::post('election_id'),
			'date'        => \lib\request::post('date'),
			'status'      => \lib\request::post('status'),
			'desc'        => \lib\request::post('desc'),
			'level'       => \lib\request::post('level'),
			'number'      => \lib\request::post('number'),
			'cash'        => \lib\request::post('cash'),
			'voted'       => \lib\request::post('voted'),
			'invalid'     => \lib\request::post('invalid'),
		];

		$result = \lib\reports::update($update, $id);
		if($result)
		{
			\lib\notif::true(T_("Report updated"));
		}
		else
		{
			\lib\notif::error(T_("Error in update report"));
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
			'election_id' => \lib\request::post('election_id'),
			'date'        => \lib\request::post('date'),
			'status'      => \lib\request::post('status'),
			'desc'        => \lib\request::post('desc'),
			'level'       => \lib\request::post('level'),
			'number'      => \lib\request::post('number'),
			'cash'        => \lib\request::post('cash'),
			'voted'       => \lib\request::post('voted'),
			'invalid'     => \lib\request::post('invalid'),
		];
		if(!is_numeric($args['election_id']) || !$args['election_id'])
		{
			\lib\notif::error(T_("Please select one items of election"));
			return false;
		}
		$result = \lib\reports::insert($args);
		if($result)
		{
			\lib\notif::true(T_("report added"));
		}
		else
		{
			\lib\notif::error(T_("Error in adding report"));
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
		$id                = \lib\request::post('id') ? \lib\request::post('id') : null;
		$update            = [];
		$update['date']    = \lib\request::post('date') ? \lib\request::post('date') : null;
		$update['level']   = \lib\request::post('level') ? \lib\request::post('level') : null;
		$update['number']  = \lib\request::post('number') ? \lib\request::post('number') : null;
		$update['cash']    = \lib\request::post('cash') ? \lib\request::post('cash') : null;
		$update['voted']   = \lib\request::post('voted') ? \lib\request::post('voted') : null;
		$update['invalid'] = \lib\request::post('invalid') ? \lib\request::post('invalid') : null;
		$update['status']  = \lib\request::post('status') ? \lib\request::post('status') : null;

		$update = array_filter($update);
		if(!empty($update))
		{
			\lib\reports::update($update, $id);
		}
		$post = \lib\request::post();
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

		if(\lib\notif::$status)
		{
			\lib\notif::true(T_("Updated"));
		}
		else
		{
			\lib\notif::error(T_("Can not update"));
		}
	}
}
?>