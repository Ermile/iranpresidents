<?php
namespace content\transfer\model;


trait lesson
{
	public function lesson()
	{
		$query =
		"
			SELECT
				*
			FROM
				classes
			ORDER BY classes.start_date ASC

		";
		$result = \lib\db::get($query, null, false , 'quran_hadith');

		$semester_name =
		[
			1 => "تابستان",
			2 => "پاییز",
			3 => "زمستان",
		];

		$month =
		[
			1 => 3,
			2 => 3,

			3 => 1,
			4 => 1,
			5 => 1,
			6 => 1,

			7 => 2,
			8 => 2,
			9 => 2,

			10 => 3,
			11 => 3,
			12 => 3,
		];

		$semester_start =
		[
			1 => "0301",
			2 => "0701",
			3 => "1001",
		];

		$semester_end =
		[
			1 => "0631",
			2 => "0930",
			3 => "0231",
		];

		$azvir = new \lib\utility\ermile\azvir(azvir_api_key, 'haram', 1);

		$azvir_semester = [];

		foreach ($result as $key => $value)
		{
			$start_date = $value['start_date'];
			$start_date_month = strtotime($start_date);
			if(!$start_date_month)
			{
				\lib\debug::error(T_("Can not set the time"));
				continue;
			}

			$start_date_month = date("m", strtotime($start_date));
			$start_date_month = intval($start_date_month);

			$semester_name_temp = $semester_name[$month[$start_date_month]];
			$year = date("Y", strtotime($start_date));
			$semester_name_temp .= ' '. \lib\utility\convert::to_fa_number($year);

			if(array_search($semester_name_temp, $azvir_semester) === false)
			{
				$insert_semester =
				[
					'title' => $semester_name_temp,
					'start' => (string) $year . (string) $semester_start[$month[$start_date_month]],
					'end'   => (string) $year . (string) $semester_end[$month[$start_date_month]],
				];
				$insert_semester['status'] = 'expire';

				if(intval($year) >= 1396)
				{
					$insert_semester['status'] = 'active';
				}

				$semester_id = self::fix($azvir->semester('post', $insert_semester));
				if(isset($semester_id['id']))
				{
					$azvir_semester[$semester_id['id']] = $value;
				}
				else
				{
					$semester_id = self::fix($azvir->semester_search('get', ['search' => $semester_name_temp]));
					if(isset($semester_id[0]['id']))
					{
						$azvir_semester[$semester_id[0]['id']] = $value;
					}
					else
					{
						\lib\debug::warn("Can not add semester $semester_name_temp");
					}
				}
			}
		}
		var_dump($azvir_semester);exit();
	}
}
?>