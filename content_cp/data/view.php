<?php
namespace content\data;

class view extends \content\main\view
{
	/**
	 * cofnig
	 */
	public function config()
	{
		$election = \content\lib\elections::search(null, ['limit' => 50]);

		$this->data->election_list = $election;
		$running = [];
		foreach ($election as $key => $value)
		{
			if(isset($value['status']) && $value['status'] === 'running')
			{
				$running[] = $value;
			}
		}
		$this->data->running = $running;
	}
}
?>