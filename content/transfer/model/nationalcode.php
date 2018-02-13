<?php
namespace content\transfer\model;


trait nationalcode
{
	public function nationalcodeduplicate()
	{

		$query =
		"
			SELECT
				person.nationalcode AS `nationalcode`,
				count(nationalcode) as `count`
			FROM
				person
			WHERE
				nationalcode <> ''
			GROUP BY nationalcode, name, family
			HAVING count(nationalcode) >= 2
		";

		$result = \lib\db::get($query, ['nationalcode', 'count'], false, 'quran_hadith');
		if(!$result)
		{
			\lib\debug::true("حله");
			return false;
		}
		// var_dump($result);exit();
		foreach ($result as $nationalcode => $value)
		{
			$find_username = "SELECT users.username FROM person INNER JOIN users ON users.id = person.users_id WHERE person.nationalcode = '$nationalcode' ";
			$find_username = \lib\db::get($find_username, 'username', false, 'quran_hadith');
			if(isset($find_username[0]) && isset($find_username[1]))
			{
				$this->post_merge($find_username[0], $find_username[1]);
			}

		}
	}


	public $main_users_id = false;
	public $duplicate_users_id = array();
	public $users_id = array();
	public $nationalcode = false;
	public $show = array();

	public function post_merge($username1, $username2)
	{
		set_time_limit(30000);
		ini_set('memory_limit', '-1');
		ini_set("max_execution_time", "-1");

		if($username1 == $username2)
		{
			\lib\debug::error("نام کاربری باهم برابر است");
			return false;
		}

		if($username1 == "" || $username2 == "")
		{
			\lib\debug::error("هر دو نام کاربری را وارد کنید");
			return false;
		}

		// $user_data1 = $this->sql()->tableUsers()->whereUsername($username1)->limit(1)->select();
		// $user_data1 = ($user_data1->num() == 1) ? $user_data1 = $user_data1->assoc() : false;
		$user_data1 = \lib\db::get("SELECT * FROM users WHERE users.username = '$username1' LIMIT 1", null, true, 'quran_hadith');

		// $user_data2 = $this->sql()->tableUsers()->whereUsername($username2)->limit(1)->select();
		// $user_data2 = ($user_data2->num() == 1) ? $user_data2 = $user_data2->assoc() : false;
		$user_data2 = \lib\db::get("SELECT * FROM users WHERE users.username = '$username2' LIMIT 1", null, true, 'quran_hadith');

		if(!$user_data1 || !$user_data2)
		{
			\lib\debug::error("نام کاربری اشتباه است");
			return false;
		}

		//------------- person
		$this->person($user_data1['id'], $user_data2['id']);

		//------------- bridge
		$this->bridge($user_data1['id'], $user_data2['id']);

		//------------- classification
		$this->classification($user_data1['id'], $user_data2['id']);

		//------------- price
		$this->price($user_data1['id'], $user_data2['id']);

		//------------- users_branch
		$this->users_branch($user_data1['id'], $user_data2['id']);

		//------------- users_description
		$this->users_description($user_data1['id'], $user_data2['id']);

		//------------- file_users
		$this->file_users($user_data1['id'], $user_data2['id']);

	}

	public function person($users_id1 = false, $users_id2 = false) {

		// $person1 = $this->sql()->tablePerson()->whereUsers_id($users_id1)->limit(1)->select()->assoc();
		$person1 = \lib\db::get("SELECT * FROM person WHERE users_id = '$users_id1' LIMIT 1", null, true, 'quran_hadith');

		// $person2 = $this->sql()->tablePerson()->whereUsers_id($users_id2)->limit(1)->select()->assoc();
		$person2 = \lib\db::get("SELECT * FROM person WHERE users_id = '$users_id2' LIMIT 1", null, true, 'quran_hadith');
		if(!$person1 || !$person2)
		{
			return false;
		}

		$update    = [];

		foreach ($person1 as $key => $value)
		{

			if($key == "id") continue;
			if($key == "users_id") continue;
			if($person2[$key] != "" ) continue;
			if($person1[$key] == "" && $person2[$key] != "") continue;

			if($person1[$key] != "" && $person2[$key] == "")
			{
				$update[] = "`$key` = '$person1[$key]' ";

			}
		}

		if(!empty($update))
		{
			$update = implode(',', $update);
			$person2_id = $person2['id'];
			\lib\db::query("UPDATE person SET $update WHERE person.id = $person2_id LIMIT 1", 'quran_hadith');
		}

		$person1_id = $person1['id'];
		\lib\db::query("DELETE FROM person WHERE person.id = $person1_id LIMIT 1", 'quran_hadith');
	}

	public function bridge($users_id1 = false, $users_id2 = false)
	{
		// $bridge1 = $this->sql()->tableBridge()->whereUsers_id($users_id1)->select()->allAssoc();
		$bridge1 = \lib\db::get("SELECT * FROM bridge WHERE users_id = '$users_id1' ", null, false, 'quran_hadith');

		// $bridge2 = $this->sql()->tableBridge()->whereUsers_id($users_id2)->select()->allAssoc();
		$bridge2 = \lib\db::get("SELECT * FROM bridge WHERE users_id = '$users_id2' ", null, false, 'quran_hadith');

		foreach ($bridge1 as $key1 => $value1)
		{

			// $check = $this->sql()->tableBridge()->whereUsers_id($users_id2)->andTitle($value1['title'])->andValue($value1['value'])->select();
			$xtitle = $value1['title'];
			$xvalue = $value1['value'];
			$check = \lib\db::get("SELECT * FROM bridge WHERE users_id = '$users_id2' AND title = '$xtitle' AND bridge.value = '$xvalue' LIMIT 1", null, true, 'quran_hadith');

			if(count($check) == 0)
			{
				#update
				// $update = $this->sql()->tableBridge()->whereId($value1['id'])->setUsers_id($users_id2)->update();
				$xid = $value1['id'];
				$update = \lib\db::query("UPDATE bridge set users_id = $users_id2  WHERE id = '$xid' ", 'quran_hadith');
			}
			else
			{
				#duplicate must be remove
				// $delete = $this->sql()->tableBridge()->whereId($check->assoc("id"))->delete();
				$chekc_id = $check['id'];
				$update = \lib\db::query("DELETE FROM  bridge WHERE id = '$chekc_id' ", 'quran_hadith');
			}
		}

	}

	public function classification($users_id1 = false, $users_id2 = false)
	{
		$update = \lib\db::query("UPDATE classification set users_id = $users_id2  WHERE users_id = '$users_id1' ", 'quran_hadith');
		// $update = $this->sql()->tableClassification()->whereUsers_id($users_id1)->setUsers_id($users_id2)->update();


	}

	public function price($users_id1 = false, $users_id2 = false) {
		$update = \lib\db::query("UPDATE price set users_id = $users_id2  WHERE users_id = '$users_id1' ", 'quran_hadith');
		// $update = $this->sql()->tablePrice()->whereUsers_id($users_id1)->setUsers_id($users_id2)->update();
	}

	public function users_branch($users_id1 = false, $users_id2 = false)
	{
		// $list_branch = $this->sql()->tableUsers_branch()->whereUsers_id($users_id1)->select()->allAssoc();
		$list_branch = \lib\db::get("SELECT * FROM users_branch WHERE users_id = '$users_id1' ", null, false, 'quran_hadith');
		foreach ($list_branch as $key => $value)
		{
			// $check = $this->sql()->tableUsers_branch()->whereUsers_id($users_id2)->andBranch_id($value['branch_id'])->select();
			$xvalue = $value['branch_id'];
			$check = \lib\db::get("SELECT * FROM users_branch WHERE users_id = '$users_id2' AND branch_id = $xvalue ", null, false, 'quran_hadith');
			if(count($check) == 0)
			{
				$xbranch = $value['branch_id'];
				$xtype   = $value['type'];
				$xs      = $value['status'];
				$insert = \lib\db::query("INSERT INTO users_branch SET  users_id = $users_id2, branch_id = $xbranch , type = '$xtype', status = '$xs' ", 'quran_hadith');

				// $insert = $this->sql()->tableUsers_branch()->setUsers_id($users_id2)->setBranch_id($value['branch_id'])->setType($value['type'])->setStatus($value['status'])->insert();
			}
		}
		// $update = $this->sql()->tableUsers_branch()->whereUsers_id($users_id1)->setStatus("delete")->update();
		$update = \lib\db::query("UPDATE  users_branch SET  status 	 = 'delete' where users_id = $users_id1 ", 'quran_hadith');

	}

	public function users_description($users_id1 = false, $users_id2 = false) {
		// $update = $this->sql()->tableUsers_description()
		// 	->whereUsers_id($users_id1)->setUsers_id($users_id2)->update();
	}

	public function file_users($users_id1 = false, $users_id2 = false) {
		// $update = $this->sql()->tableFile_user()
		// 	->whereUsers_id($users_id1)->setUsers_id($users_id2)->update();
	}




	public function _get_delete(){
		die();
		$table = get::table();
		$status = get::status();
		$id = get::id();
		if($status == "delete"){
			$x = "table" .ucfirst($table);
			$query = $this->sql()->$x()->whereId($id)->delete();
			// echo "result: ". $query->result();
			// echo "<br> error : " . $query->error();
			// echo "<br> query: " . $query->string();
			$this->commit(function(){

				var_dump(\lib\debug::complie());exit();
				\lib\debug::true("ok");
			});
			$this->rollback(function(){


				var_dump(\lib\debug::complie());exit();
				\lib\debug::error("fuck");
			});

		}
		// var_dump($_GET);exit() 	;
	}

	public function sql_duplicate($nationalcode = false ){
		var_dump(":|");exit();
		$this->nationalcode = $nationalcode;
		//----------- if get the url delete it
		$this->_get_delete();

		//------------------ fund person whit this nationalcode
		$dbl_person = $this->sql()->tablePerson()->whereNationalcode($nationalcode)->select();

		//------------------ if duplicate is true
		if ($dbl_person->num() > 1) {
			$dbl_person = $dbl_person->allAssoc();
			//-------------- show data
			$this->table($dbl_person, "person");
			//-------------- list of table muse be change
			$show_table = array("bridge","price","classification", "users_branch");
			$ret = array();
			foreach ($dbl_person as $key => $value) {
				//---------------- save users_id
				$this->users_id[] = $value['users_id'];

				if(!$this->main_users_id){
					$this->main_users_id = $value['users_id'];
				}else{
					$this->duplicate_users_id[] = $value['users_id'];
				}

				$x = $this->sql()->tableUsers()->whereId($value['users_id'])->limit(1)->select()->assoc();
				array_push($ret, $x);
			}

			$this->table($ret, "users");

			foreach ($show_table as $key => $value) {
				$x = "table" . ucfirst($value);
				$sql = $this->sql()->$x();
				foreach ($dbl_person as $k => $v) {
					if($k == 0){
						$sql->whereUsers_id($v['users_id']);
					}else{
						$sql->orUsers_id($v['users_id']);
					}

				}
			$sql = $sql->select()->allAssoc();
			$this->table($sql, $value);
		}




		}
		return $this->show;


	}

	public function table($array, $title){
		// return ;
		// var_dump($array);
		$href ="database/status=removeduplicate/nationalcode=" . $this->nationalcode;
		$echo = "<h3>$title</h3>";
		$echo .= "<table border=1>";
		foreach ($array as $key => $value) {
			$echo .= "<tr>";
			if($key == 0){
					$echo .= "<th>";
					$echo .= "num";
					$echo .= "</th>";

				foreach ($value as $k => $v) {
					$echo .= "<th>";
					$echo .= $k;
					$echo .= "</th>";
				}

					$echo .= "<tr>";
					$echo .= "<th>";
					$echo .= $key;
					$echo .= "</th>";

				foreach ($value as $k => $v) {
					if($k == 0) {
						$v = "<a href='$href?table=$title&status=delete&id=$v'>$v</a>";
					}
					$echo .= "<td>";
					$echo .= $v;
					$echo .= "</td>";
				}
				$echo .= "</tr>";
			}else{
				$echo .= "<th>";
					$echo .= $key;
					$echo .= "</th>";
				foreach ($value as $k => $v) {
					if($k == 0) {
						$v = "<a href='$href?table=$title&status=delete&id=$v'>$v</a>";
					}
					$echo .= "<td>";
					$echo .= $v;
					$echo .= "</td>";
				}

			}
			$echo .= "</tr>";
		}
		$echo .= "</table>";
		$this->show[] = $echo;
	}
}
?>