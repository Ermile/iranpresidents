<?php
namespace content_cp\data\report;

class view extends \mvc\view
{

	/**
	 * cofig
	 */
	public function config()
	{
		$this->data->electionList = \lib\elections::search();
	}


	/**
	 * view report
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function view_report($_args)
	{
		$this->data->edit_report = true;
		$result = $_args->api_callback;
		$this->data->report = $result;
	}


	/**
	 * view for add
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function view_add($_args)
	{
		$this->data->list = $_args->api_callback;
	}


	/**
	 * view list
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function view_list($_args)
	{
		$this->data->report_list = $_args->api_callback;

	}


	/**
	 * { function_description }
	 *
	 * @param      <type>  $_args  The arguments
	 */
	public function view_report_vote($_args)
	{
		$this->data->result = $_args->api_callback;
	}
}
?>