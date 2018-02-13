<?php
namespace content\transfer;


class model extends \mvc\model
{
	use \content\transfer\model\planfile;
	use \content\transfer\model\removefakemobile;
	use \content\transfer\model\nationalcode;
	use \content\transfer\model\personfix;
	use \content\transfer\model\student;
	use \content\transfer\model\lesson;
	use \content\transfer\model\classroom;

	public function database_field_upgrade()
	{
		$query = [];

		$query[] = "ALTER TABLE `plan` ADD `azvir_topic_id` varchar(100) NULL DEFAULT NULL";
		$query[] = "ALTER TABLE `person` ADD `city_name` varchar(100) NULL DEFAULT NULL";
		$query[] = "ALTER TABLE `person` ADD `province_name` varchar(100) NULL DEFAULT NULL";
		$query[] = "ALTER TABLE `person` ADD `country_name` varchar(100) NULL DEFAULT NULL";
		$query[] = "ALTER TABLE `person` ADD `education_name` varchar(200) NULL DEFAULT NULL";
		$query[] = "ALTER TABLE `person` ADD `education_name2` varchar(200) NULL DEFAULT NULL";
		$query[] = "ALTER TABLE `person` ADD `azvir_member_id` varchar(200) NULL DEFAULT NULL";
		$query[] = "ALTER TABLE `person` ADD `azvir_teacher_id` varchar(200) NULL DEFAULT NULL";
		$query[] = "ALTER TABLE `classes` ADD `azvir_semester_id` varchar(200) NULL DEFAULT NULL";
		$query[] = "ALTER TABLE `classes` ADD `azvir_lesson_id` varchar(200) NULL DEFAULT NULL";
		$query[] = "ALTER TABLE `place` ADD `azvir_classroom_id` varchar(200) NULL DEFAULT NULL";

		foreach ($query as $key => $value)
		{
			\lib\db::query($value, 'quran_hadith');
		}
		\lib\debug::true("حله!");
	}

	public function post_transfer()
	{
		if(\lib\utility::get('level') != \lib\utility::post('level'))
		{
			$this->redirector($this->url('base'). '/transfer?level='. \lib\utility::post('level'))->redirect();
			return;
		}

		switch (\lib\utility::post('level'))
		{
			case 'sql':
				$this->database_field_upgrade();
				break;

			case 'planfile':
				$this->plan_file();
				break;

			case 'removefakemobile':
				$this->removefakemobile();
				break;

			case 'fixmobile':
				$this->fixmobile();
				break;

			case 'nationalcodeduplicate':
				$this->nationalcodeduplicate();
				break;

			case 'removeduplicatemobile':
				$this->removeduplicatemobile();
				break;

			case 'personfix':
				$this->personfix();
				break;

			case 'student':
				$this->student();
				break;

			case 'classroom':
				$this->classroom();
				break;


			case 'lesson':
				$this->lesson();
				break;

			case 'teacher':
				$this->student('teacher');
				break;

			default:
				\lib\debug::warn("نکن!");
				return false;
				break;
		}
	}

}
?>