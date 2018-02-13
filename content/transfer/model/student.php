<?php
namespace content\transfer\model;


trait student
{
	public function student($_type = null)
	{


		if($_type === 'teacher')
		{
			$query =
			"
				SELECT
					person.*,
					(SELECT bridge.value from bridge where bridge.users_id = person.users_id AND bridge.title  = 'mobile' LIMIT 1) AS `mobile`,
					(SELECT bridge.value from bridge where bridge.users_id = person.users_id AND bridge.title  = 'phone' LIMIT 1) AS `phone`,
					(SELECT bridge.value from bridge where bridge.users_id = person.users_id AND bridge.title  = 'email' LIMIT 1) AS `email`,
					(SELECT users.username from users where users.id = person.users_id ) AS `username`
				FROM
					person
				INNER JOIN users_branch ON users_branch.users_id = person.users_id
				WHERE
					person.azvir_teacher_id IS NULL AND
					users_branch.type = 'teacher'
			";
		}
		else
		{
			$query =
			"
				SELECT
					person.*,
					(SELECT bridge.value from bridge where bridge.users_id = person.users_id AND bridge.title  = 'mobile' LIMIT 1) AS `mobile`,
					(SELECT bridge.value from bridge where bridge.users_id = person.users_id AND bridge.title  = 'phone' LIMIT 1) AS `phone`,
					(SELECT bridge.value from bridge where bridge.users_id = person.users_id AND bridge.title  = 'email' LIMIT 1) AS `email`,
					(SELECT users.username from users where users.id = person.users_id ) AS `username`
				FROM
					person
				WHERE
					person.azvir_member_id IS NULL
			";
		}

		$result = \lib\db::get($query, null, false, 'quran_hadith');

		$type = 'student';
		if($_type === 'teacher')
		{
			$type = 'teacher';
		}

		if(!$result)
		{
			\lib\debug::true("همه رفتند");
			return false;
		}

		$azvir = new \lib\utility\ermile\azvir(azvir_api_key, 'haram', 1);
		foreach ($result as $key => $value)
		{

			$insert_member =
			[
				'force_add'       => true,
				'type'            => $type,
				'mobile'          => $value['mobile'],
				'email'           => $value['email'],
				'shfrom'          => $value['province_name'],
				'foreign'         => intval($value['nationality']) === 97 ? false : true ,

				'firstname'       => $value['name'],
				'lastname'        => $value['family'],
				'father'          => $value['father'],
				'birthdate'       => $value['birthday'],
				'pasportdate'     => $value['pasport_date'],
				'gender'          => $value['gender'],
				'marital'         => $value['marriage'],
				'shcode'          => $value['code'],

				'birthcity'       => null,
				'zipcode'         => null,
				'religion'        => null,
				'avatar'          => null,

				'education'       => $value['education_name'],
				'education2'      => $value['education_name2'],

				'educationcourse' => null,
				'city'            => $value['city_name'],
				'province'        => $value['province_name'],
				'country'         => $value['country_name'],
				'address'         => null,
				'phone'           => $value['phone'],
				'mobile2'         => null,
				'fathermobile'    => null,
				'mothermobile'    => null,
				'status'          => 'awaiting',
				'desc'            => null,
			];

			if($type === 'student')
			{
				$insert_member['code'] = $value['username'];
			}

			if(\lib\utility\nationalcode::check($value['nationalcode']))
			{
				$insert_member['nationalcode']    = $value['nationalcode'];
				$insert_member['foreign'] = false;
			}
			else
			{
				$insert_member['pasportcode']    = $value['nationalcode'];
				$insert_member['foreign'] = true;
			}

			$xazvir = $azvir->member('post', $insert_member);

			$member_id = self::fix($xazvir, true ,[$value, $insert_member]);
			if(isset($member_id['member_id']))
			{
				if($type === 'teacher')
				{
					$field = 'azvir_teacher_id';
				}
				else
				{
					$field = 'azvir_member_id';
				}

				\lib\db::query("UPDATE person set $field = '$member_id[member_id]' WHERE person.id = $value[id] LIMIT 1 ", 'quran_hadith');
			}
			else
			{
				\lib\debug::error(T_("نمیتونم کاربر رو اضافه کنم"));

			}

		}
	}
}
?>