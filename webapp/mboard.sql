-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.8.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 데이터 webmarket.mboard:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `mboard` DISABLE KEYS */;
INSERT INTO `mboard` (`seqno`, `mtitle`, `mwriter`, `mcontent`, `mregdate`, `hitno`, `id`, `org_filename`, `stored_filename`, `filesize`, `code`) VALUES
	(45, '야호', '밍쟈이', '성공이다 시바라랃잗자ㅣㄹㄷㅈ', '2022-08-30T19:16:50.516137300', NULL, 'minjae60', 'null', '', 0, 2),
	(46, '검색', '밍쟈이', '제발 좀 하자자아아아아아ㅏㅏ', '2022-08-30T19:17:42.304742', NULL, 'minjae60', 'null', '', 0, 2),
	(47, '성공', '밍쟈이', '가보쟈공', '2022-08-30T19:18:24.224396400', NULL, 'minjae60', 'null', '', 0, 2),
	(49, 'ㅈㄹㅈㅈ', '밍쟈이', 'ㄹㄹㅈㅈㄹ', '2022-08-30T19:18:32.023974600', NULL, 'minjae60', 'null', '', 0, 2),
	(50, 'ㅈㄹㅈㄹㅈㄹ', '밍쟈이', 'ㅈㄹㅈㄹㅈㄹㅈ', '2022-08-30T19:18:35.879170400', NULL, 'minjae60', 'null', '', 0, 2);
/*!40000 ALTER TABLE `mboard` ENABLE KEYS */;

-- 테이블 데이터 webmarket.reply:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` (`replyseqno`, `seqno`, `replywriter`, `replycontent`, `replyregdate`, `id`) VALUES
	(6, 29, '밍쟈이', '헤이이이이 호우우', '2022-08-30T17:38:07.763563100', 'minjae60'),
	(7, 31, '밍쟈이', '답변 좀 해주세요', '2022-08-30T18:09:53.978288100', 'minjae60'),
	(8, 42, '밍쟈이', '안녕\r\n', '2022-08-30T19:06:53.574997100', 'minjae60'),
	(9, 42, '밍쟈이', '개빡치네', '2022-08-30T19:10:55.349868500', 'minjae60'),
	(10, 43, '밍쟈이', '제발 ㅠㅜ', '2022-08-30T19:13:10.316511100', 'minjae60');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
