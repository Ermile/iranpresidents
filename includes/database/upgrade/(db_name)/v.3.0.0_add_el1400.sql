
INSERT INTO `elections` (`id`, `title`, `status`, `eligible`, `voted`, `invalid`, `cash`, `branchs`, `first_vote_male_count`, `first_vote_female_count`, `signuped_count`, `verified_count`, `candida_count`, `start_time`, `end_time`, `election_date`, `jalali_year`, `year`, `en_url`, `fa_url`, `cat`, `win`, `createdate`, `date_modified`, `desc`, `meta`, `en_title`) VALUES
(14, 'سیزدهمین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 59310307, 28989529, NULL, NULL, NULL, NULL, NULL, 7, 4, NULL, NULL, NULL, '2021-06-18 00:00:00', 1400, 2021, '2021', '1400', 'president', 79, '2021-05-09 13:42:29', '2021-06-27 14:34:54', 'منبع سایت وزارت کشور می‌باشد.', NULL, 'Iranian presidential election, 2021');

INSERT INTO `candidas` (`id`, `election_id`, `name`, `family`, `father`, `fame`, `nationalcode`, `birthdate`, `electioncode`, `file_url`, `file_url_2`, `win_url`, `status`, `createdate`, `date_modified`, `desc`, `meta`, `en_url`, `en_name`, `en_family`, `en_father`, `en_fame`) VALUES
(79, 14, 'سید ابراهیم', 'رئيس‌الساداتی', 'سید', 'رئیسی', NULL, '1960-12-14 00:00:00', '44', '/files/election/iran-president-1396-ebrahim_raisos_sadati(raisi).jpg', '/files/election/iran-president-1396-ebrahim_raisos_sadati(raisi)-vs.jpg', '/files/election/iran-president-1396-ebrahim_raisos_sadati(raisi)-vs.jpg', 'active', '2017-05-09 15:39:58', '2021-06-27 14:40:22', NULL, NULL, NULL, 'Ebrahim', 'raisos sadati', 'Seyyed', 'Raisi'),
(80, 14, 'محسن', 'رضایی میرقائد', 'نجف', 'رضایی', NULL, '1954-09-01 00:00:00', NULL, '/files/election/iran-president-1388-mohsen_rezaee_mirghaed(rezaee).jpg', NULL, NULL, 'active', '2017-05-13 15:38:52', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mohsen', 'Rezaee Mirghaed', 'Najaf', 'Rezaee'),
(81, 14, ' ', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-18 05:29:49', '2017-05-19 12:49:54', NULL, NULL, NULL, ' ', 'unacceptable', NULL, NULL),
(82, 14, 'عبدالناصر', 'همتی', '', 'همتی', NULL, NULL, NULL, 'hemmati file', NULL, NULL, 'active', '2017-05-13 15:38:52', '2021-06-27 15:44:00', NULL, NULL, NULL, 'Abdolnaser', 'Hemmati', '', 'Hemmati'),
(83, 14, 'سید امیر حسین', 'قاضی زاده هاشمی', '', 'قاضی زاده هاشمی', NULL, NULL, NULL, 'qazizade file', NULL, NULL, 'active', '2017-05-13 15:38:52', '2021-06-27 15:44:06', NULL, NULL, NULL, 'Amir Hossein', 'Ghazizadeh Hashemi', '', 'Ghazizadeh Hashemi');


INSERT INTO `reports` (`id`, `election_id`, `date`, `level`, `number`, `cash`, `voted`, `invalid`, `status`, `createdate`, `date_modified`, `desc`, `meta`) VALUES
(63, 14, '2009-06-12 00:00:00', 'نتیجه نهایی', 1, 0, 28989529, 3740688, 'enable', '2021-06-27 06:00:40', '2021-06-27 17:26:52', NULL, NULL);


INSERT INTO `results` (`id`, `election_id`, `report_id`, `candida_id`, `total`, `status`, `createdate`, `date_modified`, `desc`, `meta`) VALUES

(349, 14, 63, 79, 18021945, 'enable', '2021-05-19 06:00:40', NULL, NULL, NULL),
(350, 14, 63, 80, 3440835, 'enable', '2021-05-19 06:00:40', NULL, NULL, NULL),
(351, 14, 63, 81, 4079712, 'enable', '2021-05-19 06:00:40', NULL, NULL, NULL),
(352, 14, 63, 82, 2443387, 'enable', '2021-05-19 06:00:40', NULL, NULL, NULL),
(353, 14, 63, 83, 1003650, 'enable', '2021-05-19 06:00:40', NULL, NULL, NULL);
