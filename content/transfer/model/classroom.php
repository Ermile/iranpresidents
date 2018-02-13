<?php
namespace content\transfer\model;


trait classroom
{
	public function classroom()
	{
		$query =
		"
			SELECT
				*
			FROM
				place

		";
		$result = \lib\db::get($query, null, false , 'quran_hadith');

		$azvir = new \lib\utility\ermile\azvir(azvir_api_key, 'haram', 1);

		$azvir_classroom = [];

		foreach ($result as $key => $value)
		{

			$insert_classroom =
			[
				'title'      => $value['name'],
				'desc'       => $value['description'],
				'status'     => $value['status'],
				'multiclass' => $value['multiclass'] === 'no' ? false : true,
				'maxperson'  => null,
			];

			$classroom_id = self::fix($azvir->classroom('post', $insert_classroom));
			$new_id = null;
			if(isset($classroom_id['id']))
			{
				$azvir_classroom[$classroom_id['id']] = $value;
				$new_id = $classroom_id['id'];
			}
			else
			{
				$classroom_id = self::fix($azvir->classroom_search('get', ['search' => $value['name']]));
				if(isset($classroom_id[0]['id']))
				{
					$new_id = $classroom_id[0]['id'];
					$azvir_classroom[$classroom_id[0]['id']] = $value;
				}
				else
				{
					\lib\debug::warn("Can not add classroom $value[name]");
				}
			}
			if($new_id)
			{
				\lib\db::query("UPDATE place set azvir_classroom_id = '$new_id' WHERE place.id = $value[id] LIMIT 1 ", 'quran_hadith');
			}
		}
		\lib\debug::true("تمام");
	}
}
?>