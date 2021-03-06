<?php
namespace lib;

class results
{

	/**
	 * add new election
	 *
	 * @param      <type>  $_args  The arguments
	 *
	 * @return     <type>  ( description_of_the_return_value )
	 */
	public static function insert($_args)
	{
		$set = \dash\db\config::make_set($_args);
		if($set)
		{
			\dash\db::query("INSERT INTO results SET $set", 'election');
			return \dash\db::insert_id(\dash\db::$link_open['election']);
		}
	}


	/**
	 * insert multi record in results
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public static function insert_multi($_args)
	{
		$_args = \dash\db\config::make_multi_insert($_args);
		if($_args)
		{
			return \dash\db::query("INSERT INTO results $_args", 'election');
		}
	}

	/**
	 * get election record
	 *
	 * @param      <type>  $_id    The identifier
	 *
	 * @return     <type>  ( description_of_the_return_value )
	 */
	public static function get($_id)
	{
		if($_id && is_numeric($_id))
		{
			$query = "SELECT * FROM results WHERE id = $_id LIMIT 1";
			$result = \dash\db::get($query, null, true, 'election');
			return $result;
		}
		return false;
	}


	/**
	 * update election
	 *
	 * @param      <type>  $_args  The arguments
	 * @param      <type>  $_id    The identifier
	 */
	public static function update($_args, $_id)
	{
		$set = \dash\db\config::make_set($_args);
		if(!$set || !$_id || !is_numeric($_id))
		{
			return false;
		}

		$query = "UPDATE results SET $set WHERE id = $_id LIMIT 1";
		return \dash\db::query($query, 'election');
	}


	/**
	 * Searches for the first match.
	 *
	 * @param      <type>  $_string   The string
	 * @param      array   $_options  The options
	 */
	public static function search($_string = null, $_options = [])
	{
		$where = []; // conditions

		if(!$_string && empty($_options))
		{
			// default return of this function 10 last record of election
			$_options['get_last'] = true;
		}

		$default_options =
		[
			// just return the count record
			"get_count"      => false,
			// enable|disable paignation,
			"pagenation"     => true,
			// for example in get_count mode we needless to limit and pagenation
			// default limit of record is 15
			// set the limit = null and pagenation = false to get all record whitout limit
			"limit"          => 150,
			// for manual pagenation set the statrt_limit and end limit
			"start_limit"    => 0,
			// for manual pagenation set the statrt_limit and end limit
			"end_limit"      => 100,
			// the the last record inserted to post table
			"get_last"       => false,
			// default order by DESC you can change to DESC
			"order"          => "DESC",
			// custom sort by field
			"sort"           => null,
		];

		$_options = array_merge($default_options, $_options);

		$pagenation = false;
		if($_options['pagenation'])
		{
			// page nation
			$pagenation = true;
		}

		// ------------------ get count
		$only_one_value = false;
		$get_count      = false;

		if($_options['get_count'] === true)
		{
			$get_count      = true;
			$public_fields  =
			"
				COUNT(results.id) AS 'electioncount'
				FROM
					results
					INNER JOIN candidas ON candidas.id = results.candida_id
					LEFT JOIN elections ON elections.id = results.election_id
					LEFT JOIN reports ON reports.id = results.report_id
			";
			$limit          = null;
			$only_one_value = true;
		}
		else
		{
			$limit         = null;
			$public_fields =
			"
					results.*,
					elections.title,
					candidas.*,
					reports.*,
					results.id AS `result_id`
				FROM
					results
				INNER JOIN candidas ON candidas.id = results.candida_id
				LEFT JOIN elections ON elections.id = results.election_id
				LEFT JOIN reports ON reports.id = results.report_id
			";

			if($_options['limit'])
			{
				$limit = $_options['limit'];
			}
		}


		if($_options['sort'])
		{
			$temp_sort = null;
			switch ($_options['sort'])
			{
				default:
					$temp_sort = $_options['sort'];
					break;
			}
			$_options['sort'] = $temp_sort;
		}

		// ------------------ get last
		$order = null;
		if($_options['get_last'])
		{
			if($_options['sort'])
			{
				$order = " ORDER BY $_options[sort] $_options[order] ";
			}
			else
			{
				$order = " ORDER BY results.id DESC ";
			}
		}
		else
		{
			if($_options['sort'])
			{
				$order = " ORDER BY $_options[sort] $_options[order] ";
			}
			else
			{
				$order = " ORDER BY results.id $_options[order] ";
			}
		}

		$start_limit = $_options['start_limit'];
		$end_limit   = $_options['end_limit'];


		unset($_options['pagenation']);
		unset($_options['get_count']);
		unset($_options['limit']);
		unset($_options['start_limit']);
		unset($_options['end_limit']);
		unset($_options['get_last']);
		unset($_options['order']);
		unset($_options['sort']);

		foreach ($_options as $key => $value)
		{
			if(is_array($value))
			{
				if(isset($value[0]) && isset($value[1]) && is_string($value[0]) && is_string($value[1]))
				{
					// for similar "results.`field` LIKE '%valud%'"
					$where[] = " results.`$key` $value[0] $value[1] ";
				}
			}
			elseif($value === null)
			{
				$where[] = " results.`$key` IS NULL ";
			}
			elseif(is_numeric($value))
			{
				$where[] = " results.`$key` = $value ";
			}
			elseif(is_string($value))
			{
				$where[] = " results.`$key` = '$value' ";
			}
		}

		$where = join($where, " AND ");
		$search = null;
		if($_string != null)
		{
			$_string = trim($_string);

			$search = "(results.title  LIKE '%$_string%' )";
			if($where)
			{
				$search = " AND ". $search;
			}
		}

		if($where)
		{
			$where = "WHERE $where";
		}
		elseif($search)
		{
			$where = "WHERE";
		}

		if($pagenation && !$get_count)
		{
			$pagenation_query = "SELECT	COUNT(results.id) AS `count`	FROM results	$where $search ";
			$pagenation_query = \dash\db::get($pagenation_query, 'count', true, 'election');

			list($limit_start, $limit) = \dash\db::pagnation((int) $pagenation_query, $limit);
			$limit = " LIMIT $limit_start, $limit ";
		}
		else
		{
			// in get count mode the $limit is null
			if($limit)
			{
				$limit = " LIMIT $start_limit, $end_limit ";
			}
		}

		$json = json_encode(func_get_args());
		$query = " SELECT $public_fields $where $search $order $limit -- results::search() 	-- $json";

		if(!$only_one_value)
		{
			$result = \dash\db::get($query, null, false, 'election');
			$result = \dash\utility\filter::meta_decode($result);
		}
		else
		{
			$result = \dash\db::get($query, 'electioncount', true, 'election');
		}

		return $result;
	}


	/**
	 * update some cash after insert result
	 *
	 * @param      <type>  $_election_id  The election identifier
	 */
	public static function update_cash($_election_id)
	{
		if(!$_election_id || !is_numeric($_election_id))
		{
			return false;
		}
		$query =
		"
			UPDATE
				elections
			SET
				elections.cash =
				(
					SELECT
						IFNULL(reports.cash, 0)
					FROM reports
					WHERE
						reports.election_id = $_election_id AND
						reports.status      = 'enable'
					ORDER BY reports.id DESC
					LIMIT 1
				),
				elections.voted =
				(
					SELECT
						IFNULL(reports.voted, 0)
					FROM reports
					WHERE
						reports.election_id = $_election_id AND
						reports.status      = 'enable'
					ORDER BY reports.id DESC
					LIMIT 1
				),
				elections.invalid =
				(
					SELECT
						IFNULL(reports.invalid, 0)
					FROM reports
					WHERE
						reports.election_id = $_election_id AND
						reports.status      = 'enable'
					ORDER BY reports.id DESC
					LIMIT 1
				)
			WHERE
				elections.id = $_election_id
			LIMIT 1
		";
		\dash\db::query($query, 'election');
	}


	/**
	 * Disables the old record of this elections
	 *
	 * @param      <type>  $_election_id  The election identifier
	 */
	public static function disable_old($_election_id)
	{
		if(!$_election_id || !is_numeric($_election_id))
		{
			return false;
		}
		$query = "UPDATE results SET results.status = 'disable' WHERE results.status = 'enable' AND results.election_id = $_election_id ";
		return \dash\db::query($query, 'election');
	}


	/**
	 * Gets the total.
	 *
	 * @param      <type>  $_election_id  The election identifier
	 */
	public static function get_last($_election_id)
	{
		if(!$_election_id || !is_numeric($_election_id))
		{
			return false;
		}
		$query =
		"
			SELECT
				CONCAT(candidas.name , ' ', candidas.family) AS `name_family`,
				reports.date as 'report_date',
				results.*,
				candidas.*
			FROM
				results
			LEFT JOIN reports ON reports.id = results.candida_id
			INNER JOIN candidas ON candidas.id = results.candida_id
			INNER JOIN elections ON elections.id = results.election_id
			WHERE
				candidas.status = 'active' AND
				elections.id    = $_election_id AND
				results.status  = 'enable'
			ORDER BY results.total DESC
		";
		// var_dump($query);
		$result = \dash\db::get($query, null, false, 'election');
		// var_dump($result);exit();
		return $result;
	}


	/**
	 * Gets the total.
	 *
	 * @param      <type>  $_election_id  The election identifier
	 */
	public static function get_senario($_election_id)
	{
		if(!$_election_id || !is_numeric($_election_id))
		{
			return false;
		}
		$query =
		"
			SELECT
				results.*,
				candidas.*,
				reports.*
			FROM
				results
			LEFT JOIN reports ON reports.id = results.report_id
			INNER JOIN candidas ON candidas.id = results.candida_id
			INNER JOIN elections ON elections.id = results.election_id
			WHERE
				candidas.status = 'active' AND
				elections.id    = $_election_id
			ORDER BY reports.date ASC
		";
		$result = \dash\db::get($query, null, false, 'election');
		return $result;
	}


	/**
	 * Gets the total.
	 *
	 * @param      <type>  $_election_id  The election identifier
	 */
	public static function get_time_line($_election_id, $_select_cat = false)
	{
		if(!$_election_id)
		{
			return false;
		}

		if($_select_cat && $_election_id)
		{
			$cat = 	" elections.cat = '$_election_id' ";
		}
		else
		{
			$cat = 	" elections.cat = (SELECT cat FROM elections WHERE id = $_election_id LIMIT 1) ";

		}
		$query =
		"
			SELECT
				elections.*,
				elections.en_url AS `election_en_url`,
				candidas.*
			FROM
				elections
			LEFT JOIN candidas ON candidas.id = elections.win
			WHERE
				$cat
			ORDER BY elections.election_date ASC
		";
		$result = \dash\db::get($query, null, false, 'election');
		return $result;
	}

	/**
	 * home page result
	 *
	 * @param      <type>  $_cat   The cat
	 *
	 * @return     <type>  ( description_of_the_return_value )
	 */
	public static function home_page($_cat, $_sort = null, $_order = null)
	{
		$order = "DESC";
		if($_order)
		{
			$order = $_order;
		}

		$sort = 'elections.election_date';
		if($_sort)
		{
			switch ($_sort)
			{
				case 'year':
					$sort = 'elections.election_date';
					break;

				case 'percent':
					$sort = 'win_present';
					break;

				case 'acceptance':
					$sort = 'win_present_all';
					break;

				case 'turnout':
					$sort = 'work_present';
					break;

				case 'vote':
					$sort = 'voted';
					break;

				case 'eligible':
					$sort = $_sort;
					break;

				default:
					$sort = 'elections.election_date';
					# code...
					break;
			}
		}

		$query =
		"
			SELECT
				elections.*,
				elections.en_url AS `election_en_url`,
				(
					SELECT ((results.total * 100) / elections.voted)
					FROM results
					WHERE results.election_id = elections.id
					AND results.candida_id = candidas.id
					AND results.status = 'enable'
					LIMIT 1
				) AS `win_present`,
				((elections.voted * 100) / elections.eligible) AS `work_present`,
				(
					SELECT ((results.total * 100) / elections.eligible)
					FROM results
					WHERE results.election_id = elections.id
					AND results.candida_id = candidas.id
					AND results.status = 'enable'
					LIMIT 1
				) AS `win_present_all`,
				candidas.*
			FROM
				elections
			LEFT JOIN candidas ON candidas.id = elections.win
			WHERE
				elections.cat = '$_cat'
			ORDER BY $sort $order
		";
		$result = \dash\db::get($query, null, false, 'election');
		// var_dump($result);exit();
		return $result;
	}
}
?>