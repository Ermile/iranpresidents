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
		$report['date']        = \dash\request::post('date');
		$report['level']       = \dash\request::post('level');
		$report['number']      = \dash\request::post('number');
		$report['cash']        = \dash\request::post('cash');
		$report['voted']       = \dash\request::post('voted');
		$report['invalid']     = \dash\request::post('invalid');

		$candida_total    = [];

		foreach (\dash\request::post() as $key => $value)
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
				\dash\notif::ok(T_("Result added"));
			}
			else
			{
				\dash\notif::error(T_("Error in adding result"));
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
			'election_id' => \dash\request::post('election_id'),
			'date'        => \dash\request::post('date'),
			'status'      => \dash\request::post('status'),
			'desc'        => \dash\request::post('desc'),
			'level'       => \dash\request::post('level'),
			'number'      => \dash\request::post('number'),
			'cash'        => \dash\request::post('cash'),
			'voted'       => \dash\request::post('voted'),
			'invalid'     => \dash\request::post('invalid'),
		];

		$result = \lib\reports::update($update, $id);
		if($result)
		{
			\dash\notif::ok(T_("Report updated"));
		}
		else
		{
			\dash\notif::error(T_("Error in update report"));
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
			'election_id' => \dash\request::post('election_id'),
			'date'        => \dash\request::post('date'),
			'status'      => \dash\request::post('status'),
			'desc'        => \dash\request::post('desc'),
			'level'       => \dash\request::post('level'),
			'number'      => \dash\request::post('number'),
			'cash'        => \dash\request::post('cash'),
			'voted'       => \dash\request::post('voted'),
			'invalid'     => \dash\request::post('invalid'),
		];
		if(!is_numeric($args['election_id']) || !$args['election_id'])
		{
			\dash\notif::error(T_("Please select one items of election"));
			return false;
		}
		$result = \lib\reports::insert($args);
		if($result)
		{
			\dash\notif::ok(T_("report added"));
		}
		else
		{
			\dash\notif::error(T_("Error in adding report"));
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
		$id                = \dash\request::post('id') ? \dash\request::post('id') : null;
		$update            = [];
		$update['date']    = \dash\request::post('date') ? \dash\request::post('date') : null;
		$update['level']   = \dash\request::post('level') ? \dash\request::post('level') : null;
		$update['number']  = \dash\request::post('number') ? \dash\request::post('number') : null;
		$update['cash']    = \dash\request::post('cash') ? \dash\request::post('cash') : null;
		$update['voted']   = \dash\request::post('voted') ? \dash\request::post('voted') : null;
		$update['invalid'] = \dash\request::post('invalid') ? \dash\request::post('invalid') : null;
		$update['status']  = \dash\request::post('status') ? \dash\request::post('status') : null;

		$update = array_filter($update);
		if(!empty($update))
		{
			\lib\reports::update($update, $id);
		}
		$post = \dash\request::post();
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

		if(\dash\engine\process::status())
		{
			\dash\notif::ok(T_("Updated"));
		}
		else
		{
			\dash\notif::error(T_("Can not update"));
		}
	}
}
?>