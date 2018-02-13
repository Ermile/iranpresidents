<?php
namespace content\transfer;

class controller extends \content\main\controller
{

	// for routing check
	function ready()
	{
		if(!defined('azvir_api_key'))
		{
			define('azvir_api_key', '$2y$07$r4TpZitEhF2Grb.Ug.7t.u6f8de0C4pAfaPpNNUc3L8rsR.b/5Zqa');
		}

		// $azvir = new \lib\utility\ermile\azvir('$2y$07$ppqEBLfiUT7zlqFVxp/Wa.ILdtNVkL/i1o2eAZ4Dm41mV9VlSiU86', 'haram', 1);
		// $add_group = $azvir->pricetype('post', ['title' => 'حفظ', 'price' => 2000, 'unittype' => 'real']);
		// var_dump($add_group);exit();

		$this->post('transfer')->ALL();
	}


}
?>