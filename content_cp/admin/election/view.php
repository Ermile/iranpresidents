<?php
namespace content_cp\admin\election;

class view extends \mvc\view
{
	/**
	 * view one election
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function view_election($_args)
	{
		$this->data->edit_election = true;
		$result = $_args->api_callback;
		$this->data->election = $result;
		$this->data->candidas = \lib\candidas::search(null,['election_id' => $this->model()->getid($_args)]);
	}


	/**
	 * view list of elections
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function view_list($_args)
	{
		$this->data->electionList = $_args->api_callback;
		$this->data->candidas = \lib\candidas::search();
	}
}
?>