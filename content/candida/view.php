<?php
namespace content\candida;


class view extends \mvc\view
{
	public function config()
	{
		$this->data->page['title'] = T_('Presidents of Islamic Republic of Iran');
		$this->data->page['desc']  = T_('Live and complete result of iran elections after revolution until now.');
		$this->data->result        = \lib\candidas::get_list_all('president');
	}
}
?>