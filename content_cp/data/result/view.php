<?php
namespace content_cp\data\result;
use \dash\utility\location;

class view extends \mvc\view
{
	public function config()
	{

	}

	/**
	 * { function_description }
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function view_add_city($_args)
	{
		$election_id          = $this->model()->getid($_args);
		$election             = \lib\elections::get($election_id);
		$this->data->election = $election;

		$candida              = \lib\candidas::search(null,['election_id' => $election_id, 'sort' => 'family', 'order' => 'asc']);
		$this->data->candida  = $candida;

		$city_list            = $_args->api_callback;

		$this->data->list     = $city_list;

		$find_location_url    = $this->model()->find_location_url();
		if(is_array($find_location_url))
		{
			$location = end($find_location_url);
			$child = \dash\db\locations::get_child($location);
			if(is_array($child))
			{
				$child_id = array_column($child, 'id');

				$saved_value = \lib\resultbyplaces::search(null,
				[
					'limit'       => false,
					'election_id' => $election_id,
					'place'       => ['in', "(". implode(',', $child_id). ")"]
				]);

				$result = [];
				foreach ($saved_value as $key => $value)
				{
					if(!isset($result[$value['place']]))
					{
						$result[$value['place']] = [];
					}
					$result[$value['place']][$value['candida_id']] = $value['total'];
				}

				$this->data->result = $result;
			}
		}

		$this->data->city_url = isset($find_location_url['countres']) ? $find_location_url['countres'] : null;
	}


	/**
	 * { function_description }
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function view_result($_args)
	{
		$result = $_args->api_callback;
		$this->data->result = $result;
	}


	/**
	 * view election list
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function view_electionList($_args)
	{
		$this->data->result = $_args->api_callback;
	}

}
?>