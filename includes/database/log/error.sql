
#---------------------------------------------------------------------- /su/install?time=first_time
---2018-02-13 09:13:11
	---0.00050520896911621s		---1ms
	#2018-02-13 09:13:11
-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `meta` mediumtext,
  `status` enum('approved','unapproved','spam','deleted') NOT NULL DEFAULT 'unapproved',
  `parent` smallint(5) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8
/* ERROR	MYSQL ERROR
Table 'comments' already exists */

#---------------------------------------------------------------------- /su/install?time=first_time
---2018-02-13 09:13:11
	---0.0001680850982666s		---0ms
	#2018-02-13 09:13:11 -- -- Indexes for table `comments` -- ALTER TABLE `comments` ADD PRIMARY KEY (`id`) /* ERROR MYSQL ERROR Multiple primary key defined */
