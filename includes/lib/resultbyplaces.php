<?php
namespace lib;

class resultbyplaces
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
			\dash\db::query("INSERT INTO resultbyplaces SET $set", 'election');
			return \dash\db::insert_id(\dash\db::$link_open['election']);
		}
	}


	/**
	 * { function_description }
	 *
	 * @param      <type>  $_args  The arguments
	 *
	 * @return     <type>  ( description_of_the_return_value )
	 */
	public static function check($_args)
	{
		$where = \dash\db\config::make_where($_args);
		if($where)
		{
			$query  = "SELECT id FROM resultbyplaces WHERE $where LIMIT 1";
			$result = \dash\db::get($query, 'id', true, 'election');
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

		$query = "UPDATE resultbyplaces SET $set WHERE id = $_id LIMIT 1";
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
			$public_fields  = " COUNT(resultbyplaces.id) AS 'resultbyplacescount' FROM	resultbyplaces";
			$limit          = null;
			$only_one_value = true;
		}
		else
		{
			$limit         = null;
			$public_fields = " resultbyplaces.*, elections.title FROM resultbyplaces INNER JOIN elections ON elections.id = resultbyplaces.election_id";

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
				$order = " ORDER BY resultbyplaces.id DESC ";
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
				$order = " ORDER BY resultbyplaces.id $_options[order] ";
			}
		}

		$start_limit = $_options['start_limit'];
		$end_limit   = $_options['end_limit'];

		$no_limit = false;
		if($_options['limit'] === false)
		{
			$no_limit = true;
		}

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
					// for similar "resultbyplaces.`field` LIKE '%valud%'"
					$where[] = " resultbyplaces.`$key` $value[0] $value[1] ";
				}
			}
			elseif($value === null)
			{
				$where[] = " resultbyplaces.`$key` IS NULL ";
			}
			elseif(is_numeric($value))
			{
				$where[] = " resultbyplaces.`$key` = $value ";
			}
			elseif(is_string($value))
			{
				$where[] = " resultbyplaces.`$key` = '$value' ";
			}
		}

		$where = join($where, " AND ");
		$search = null;
		if($_string != null)
		{
			$_string = trim($_string);

			$search = "(resultbyplaces.title  LIKE '%$_string%' )";
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
			$pagenation_query = "SELECT	COUNT(resultbyplaces.id) AS `count`	FROM resultbyplaces	$where $search ";
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

		if($no_limit)
		{
			$limit = null;
		}

		$query = " SELECT $public_fields $where $search $order $limit -- resultbyplaces::search() 	-- $json";

		if(!$only_one_value)
		{
			$result = \dash\db::get($query, null, false, 'election');
			$result = \dash\utility\filter::meta_decode($result);
		}
		else
		{
			$result = \dash\db::get($query, 'resultbyplacescount', true, 'election');
		}

		return $result;
	}


	public static function get_election($_election_id)
	{
		if(!is_numeric($_election_id))
		{
			return false;
		}

		$query =
		"
			SELECT
				election.resultbyplaces.*,
				saloos_tools.locations.*
			FROM
				election.resultbyplaces
			LEFT JOIN saloos_tools.locations ON saloos_tools.locations.id = election.resultbyplaces.place
			WHERE election.resultbyplaces.election_id = $_election_id
			ORDER BY election.resultbyplaces.candida_id ASC
		";
		$result = \dash\db::get($query, null, false, 'election');
		$temp = [];

		foreach ($result as $key => $value)
		{
			if(isset($value['type']))
			{
				if(!isset($temp[$value['type']][$value['id']]['data']))
				{
					$temp[$value['type']][$value['id']] =
					[
						'data' => [],
						'location' => ['name' => $value['name'], 'local_name' => $value['local_name']],
					];
				}
				$temp[$value['type']][$value['id']]['data'][$value['candida_id']] = $value['total'];
			}
		}

		// var_dump($temp,$result);exit();

		return $temp;
	}

}
?>