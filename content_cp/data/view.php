<?php
namespace content_cp\data;

class view extends \mvc\view
{
	/**
	 * cofnig
	 */
	public function config()
	{
		$election = \lib\elections::search(null, ['limit' => 50]);

		$this->data->electionList = $election;
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