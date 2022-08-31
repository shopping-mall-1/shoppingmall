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

-- 테이블 데이터 webmarket.cart:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`customer`, `p_code`, `p_count`) VALUES
	('test', 3, 4),
	('minjae60', 6, 16),
	('test', 1, 9),
	('test', 6, 6);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 데이터 webmarket.mboard:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `mboard` DISABLE KEYS */;
INSERT INTO `mboard` (`seqno`, `mtitle`, `mwriter`, `mcontent`, `mregdate`, `hitno`, `id`, `org_filename`, `stored_filename`, `filesize`, `code`) VALUES
	(45, '야호', '밍쟈이', '성공이다 시바라랃잗자ㅣㄹㄷㅈ', '2022-08-30T19:16:50.516137300', NULL, 'minjae60', 'null', '', 0, 2),
	(46, '검색', '밍쟈이', '제발 좀 하자자아아아아아ㅏㅏ', '2022-08-30T19:17:42.304742', NULL, 'minjae60', 'null', '', 0, 2),
	(47, '성공', '밍쟈이', '가보쟈공', '2022-08-30T19:18:24.224396400', NULL, 'minjae60', 'null', '', 0, 2),
	(49, 'ㅈㄹㅈㅈ', '밍쟈이', 'ㄹㄹㅈㅈㄹ', '2022-08-30T19:18:32.023974600', NULL, 'minjae60', 'null', '', 0, 2),
	(50, 'ㅈㄹㅈㄹㅈㄹ', '밍쟈이', 'ㅈㄹㅈㄹㅈㄹㅈ', '2022-08-30T19:18:35.879170400', NULL, 'minjae60', 'null', '', 0, 2),
	(52, 'ㄹㄹ', '밍쟈이', 'ㄹㄹ', '2022-08-30T19:32:38.749692500', NULL, 'minjae60', 'null', '', 0, 2),
	(54, '복숭아', '테스트계정', '어때요', '2022-08-31T14:20:32.751230300', NULL, 'test', 'null', '', 0, 1);
/*!40000 ALTER TABLE `mboard` ENABLE KEYS */;

-- 테이블 데이터 webmarket.member:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`id`, `name`, `password`, `tel`, `address`, `email`, `lastpwdate`, `pwcheck`, `role`) VALUES
	('guest00a', '게스트계정', '1234', '01022334455', '서울시 마이구 에스큐엘동 돌고래빌라 202호', 'guest@email.com', NULL, NULL, 'none'),
	('kim00a', '김영아', '1234', '01033445566', '서울시 어쩌고구 저쩌고동 블라빌라 303호', 'kim00a@email.com', NULL, NULL, 'none'),
	('minjae60', '밍쟈이', 'rkdud123!', '01026758245', '서울 영등포구 버드나루로 74 (영등포동7가) 403', 'minjae60@gmail.com', NULL, NULL, 'admin'),
	('test', '테스트계정', 'rkdud135!', '01012341234', '서울시 마리아구 물개동 데이터베이스빌라 101호', 'test@email.com', '2022-08-31 14:41:29', 1, 'none');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 데이터 webmarket.product:~21 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`code`, `name`, `company`, `price`, `stock`, `description`, `image`, `category`, `regist_date`, `detail_category`, `benefit`, `recommend`) VALUES
	(1, '[타미나]부드러운 백도 복숭아 1.8kg <p><h6 style="color:gray">산지 폭우로 당도가 떨어질 수 있습니다.</h6>', '복숭아나무', 19900, 500, '1.8kg 내외/5~7입 <p>국산 <p>당도 10.4 Brix이상 <p>농산물이므로 별도의 유통기한은 없으나 가급적 빠르게 드시기 바랍니다. <p>금주 수확한 복숭아는 산지 장마 영향으로 인하여 당도가 낮아질 수 있습니다. <p>복숭아는 최대한 신선하게 배송드리고자 당일 혹인 전일 수확한 상품만을 판매합니다. 시세에 따라 가격이 변경될 수 있습니다. <p>상품특성상 3%내외의 중량차이가 있을 수 있습니다. <p>신선식품 특성상 원물마다 크기 및 형태가 일정하지 않을 수 있습니다.', 'images/peach.JPG', '과일·견과·쌀', '2022-08-29', '국산', 0, NULL),
	(2, '[Dole] 스위티오 바나나 1KG <p><h6 style="color:gray">고랭지 재배로 더 달고 쫀득한</h6>', 'Dole', 4700, 250, '1kg 내외 <p>필리핀 <p>신선식품으로 별도의 유통기한은 없으나 최대한 빠른 섭취 부탁드립니다 <p>초록빛이 나는 덜 후숙된 바나나의 경우 실온에서 1~3일정도 보관시 후숙되는 점 참고 부탁드립니다. <p>수분이 함유된 과일의 특성 상 약 3% 내외의 중량 차이가 있을 수 있습니다.', 'images/banana.jpg', '과일·견과·쌀', '2022-08-29', '수입', 0, NULL),
	(3, '아삭한 햇 홍로 사과 1.5KG <p><h6 style="color:gray">아삭하고 달콤함 가득한 사과</h6>', '사과나무', 5000, 300, '싱싱한 사과\r\n<p>1.5KG 내외\r\n<p>국산\r\n<p>당도 14.2 Brix 이상\r\n<p>신선식품으로 별도의 유통기한은 없으나 가급적 빠른 시일 내에 드시길 바랍니다\r\n<p>상품특성상 3%내외의 중량차이가 있을 수 있습니다.\r\n<p>신선식품 특성상 원물마다 크기 및 형태가 일정하지 않을 수 있습니다.', 'images/apple.PNG', '과일·견과·쌀', '2022-08-29', '국산', 0, NULL),
	(4, '[제스프리]뉴질랜드 점보 그린키위 710g <p><h6 style="color:gray">뉴질랜드에서 건너온 싱그러운 초록빛</h6>', '제스프리', 11000, 100, '710g 내외/5개입 <p>뉴질랜드 <p>농산물이므로 별도의 유통기한은 없으나 온도 및 환경에 따라 보관 기간이 달라질 수 있습니다. <p>상품 특성상 3% 내외의 차이가 발생할 수 있습니다. 신선식품 특성상 원물마다 크기 및 형태가 일정하지 않을 수 있습니다. ', 'images/kiwi.jpg', '과일·견과·쌀', '2022-08-29', '제철', 0, NULL),
	(5, '상큼 가득 캠벨포도 500g <p><h6 style="color:gray">알알이 차오른 새콤달콤 여름 포도</h6>', '포도나무', 6900, 800, '500g내외 <p>국산 <p>당도 13.6Brix 이상 <p> 상품 특성상 3% 내외의 중량차이가 발생할 수 있습니다. <p>신선식품 특성상 원물마다 크기 및 형태가 일정하지 않을 수 있습니다.', 'images/grape.jpg', '과일·견과·쌀', '2022-08-29', '수입', 0, NULL),
	(6, '친환경 백향과 300g <p><h6 style="color:gray">새콤달콤 신비의 과일, 패션프루트</h6>', '백향과나무', 7900, 500, '300g 내외/3-5입 <p>국산 <p>농산물이므로 별도의 유통기한은 없으나 가급적 빠르게 드시기 바랍니다. <p>백향과는 후숙과일로, 익을수록 점점 겉면이 붉은색으로 변하고 쭈글쭈글해집니다. 이는 단맛이 더해지는 과정이니 안심하고 맛있게 드세요. 햇 백향과로 후숙기간이 길어질 수 있음을 안내드리오니 충분히 후숙(겉표면이 쭈글쭈글하게 변함)이 된 후 섭취 부탁드립니다. <p>간혹 얼룩이 있는 경우, 재배과정에서 얻은 빛깔의 차이일 뿐 맛에는 아무런 차이가 없는 자연스러운 현상입니다. <p>식품 특성상 중량은 3% 내외의 차이가 발생할 수 있습니다. <p>신선식품 특성상 원물마다 크기 및 형태가 일정하지 않을 수 있습니다. ', 'images/passionfruit.png', '과일·견과·쌀', '2022-08-29', '친환경', 0, NULL),
	(7, '호주산 네이블 오렌지 1kg <p><h6 style="color:gray">생기 넘치는 주황빛 과일</h6>', '오렌지나무', 9900, 500, '1.2kg 내외/6입 <p>호주산 <p>신선식품으로 별도의 유통기한은 없으나 가급적 빠른 시일 내에 드시길 바랍니다.', 'images/orange.JPG', '과일·견과·쌀', '2022-08-29', '수입', 0, NULL),
	(8, '[선물세트] 한삼인 산삼배양근 30병', '한삼인', 59800, 100, '뿌리와 농축액이 함께 담긴', 'images/hongsam.png', '건강식품', '2022-08-31', '국산', 0, '추석'),
	(9, '[선물세트] CJ 한뿌리 배도라지달임진액 24포', 'cj', 21370, 200, '배도라지의 영양 가득 담은 한 포', 'images/dorage.png', '건강식품', '2022-08-29', '국산', 0, '추석'),
	(10, '[산메촌] 메밀 물막국수(2인분)', '산메촌', 8415, 500, NULL, 'images/guksu.png', '면·양념·오일', '2022-08-31', '국산', 0, '이거어때'),
	(11, '[풀무원] 식물성 지구식단 한끼두부면 생바질 파스타 160g', '풀무원', 4183, 100, NULL, 'images/dubu.png', '샐러드·간편식', '2022-08-31', '국산', 0, '이거어때'),
	(12, '[설성목장] 한돈 갈비 김치찌개', '설성목장', 7560, 100, NULL, 'images/kimchi.png', '국·반찬·메인요리', '2022-08-31', '국산', 0, '이거어때'),
	(13, '[전통주] 명품안동소주 프리미엄30 30도 375ml(명품안동소주 30도)', '안동소주', 11700, 500, NULL, 'images/sul.png', '와인', '2022-08-31', '국산', 0, '이거어때'),
	(14, '[KF365] 김구원선생 국내산 무농약 콩나물 300g', '김구원', 1280, 100, NULL, 'images/congnamul.png', '채소', '2022-08-31', '국산', 0, '이거어때'),
	(15, '[KF365] DOLE 실속 바나나 1kg (필리핀)', 'DOLE', 3700, 500, NULL, 'images/banana2.png', '과일·견과·쌀', '2022-08-31', '수입', 0, '이거어때'),
	(16, '[연세우유 x 마켓컬리] 전용목장우유 900mL', '연세우유', 2070, 500, NULL, 'images/milk.png', '생수·음료·우유·커피', '2022-08-31', '국산', 0, '이거어때'),
	(17, '[Kurly\\\'s] 국산콩 두부 300g', '국산콩', 1900, 100, NULL, 'images/dububu.png', '샐러드·간편식', '2022-08-31', '국산', 0, '이거어때'),
	(18, '[고메공방] 대구식 납작만두 300g (15g x 20입)', '고메공방', 4400, 500, NULL, 'images/mandu.png', '샐러드·간편식', '2022-08-31', '국산', 0, '놓치면후회'),
	(19, '[자연실록] 무항생제 닭 다리살 (정육) 500g', '자연실록', 8200, 200, NULL, 'images/chicken.png', '정육·계란', '2022-08-31', '국산', 0, '놓치면후회'),
	(20, '[KF365] 한돈 삼겹살 구이용 600g (냉장)', '한돈', 15600, 200, NULL, 'images/pig.png', '정육·계란', '2022-08-31', '국산', 0, '놓치면후회'),
	(21, '아삭한 햇 홍로 사과 1.5kg (6~7입)', '사과팡', 12900, 500, NULL, 'images/apple2.png', '과일·견과·쌀', '2022-08-31', '국산', 0, '놓치면후회');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 데이터 webmarket.reply:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` (`replyseqno`, `seqno`, `replywriter`, `replycontent`, `replyregdate`, `id`) VALUES
	(6, 29, '밍쟈이', '헤이이이이 호우우', '2022-08-30T17:38:07.763563100', 'minjae60'),
	(7, 31, '밍쟈이', '답변 좀 해주세요', '2022-08-30T18:09:53.978288100', 'minjae60'),
	(8, 42, '밍쟈이', '안녕\r\n', '2022-08-30T19:06:53.574997100', 'minjae60'),
	(9, 42, '밍쟈이', '개빡치네', '2022-08-30T19:10:55.349868500', 'minjae60'),
	(10, 43, '밍쟈이', '제발 ㅠㅜ', '2022-08-30T19:13:10.316511100', 'minjae60'),
	(11, 45, '밍쟈이', '집에 가보자고~~', '2022-08-30T19:36:10.224384700', 'minjae60');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;

-- 테이블 데이터 webmarket.tbl_order:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
INSERT INTO `tbl_order` (`code`, `customer`, `p_code`, `p_count`, `state`, `date`, `address`) VALUES
	(1, 'guest00a', 2, 1, '배송 중', '2022-08-22 15:30:05', '서울시 마이구 에스큐엘동 돌고래빌라 202호'),
	(2, 'guest00a', 4, 1, '배송 중', '2022-08-22 15:30:05', '서울시 마이구 에스큐엘동 돌고래빌라 202호');
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
