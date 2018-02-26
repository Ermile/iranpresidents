<?php
namespace mvc;

class view extends \lib\view
{
	function project()
	{
		// define default value for global

		$this->data->site['title']           = T_("Iran Presidents");
		$this->data->site['desc']            = T_("Live and complete result of iran elections after revolution until now.");
		$this->data->site['slogan']          = T_("Know more about iranian presidents");

		$this->data->page['desc']            = $this->data->site['desc']. ' | '. $this->data->site['slogan'];

		$this->data->bodyclass               = 'unselectable';

		if(method_exists($this, 'options'))
		{
			$this->options();
		}
	}


	/**
	 * [pushState description]
	 * @return [type] [description]
	 */
	function pushState()
	{

	}
}
?>