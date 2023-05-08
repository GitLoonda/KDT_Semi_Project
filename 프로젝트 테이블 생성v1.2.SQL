-- --------------------------------------------------------
-- 호스트:                          db-gb7pv.pub-cdb.ntruss.com
-- 서버 버전:                        8.0.21 - MySQL Community Server - GPL
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 mini_db2.T3_ABRD 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_ABRD` (
  `ABNO` int NOT NULL AUTO_INCREMENT,
  `ID` varchar(40) NOT NULL COMMENT '아이디',
  `CATE0` varchar(20) DEFAULT NULL COMMENT '공지',
  `ATITLE` varchar(300) DEFAULT NULL COMMENT '제목',
  `ACONT` varchar(1000) DEFAULT NULL COMMENT '내용',
  `HITS` int DEFAULT '0' COMMENT '조회수',
  `CDATE` datetime NOT NULL COMMENT '생성일',
  `UDATE` datetime DEFAULT NULL COMMENT '수정일',
  `DELYN` char(2) DEFAULT NULL,
  PRIMARY KEY (`ABNO`),
  KEY `FK__T3_USER` (`ID`),
  CONSTRAINT `FK__T3_USER` FOREIGN KEY (`ID`) REFERENCES `T3_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='관리자 게시판';

-- 테이블 데이터 mini_db2.T3_ABRD:~0 rows (대략적) 내보내기
DELETE FROM `T3_ABRD`;
INSERT INTO `T3_ABRD` (`ABNO`, `ID`, `CATE0`, `ATITLE`, `ACONT`, `HITS`, `CDATE`, `UDATE`, `DELYN`) VALUES
	(1, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:57:58', NULL, 'N'),
	(2, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:37', NULL, 'N'),
	(3, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:37', NULL, 'N'),
	(4, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:37', NULL, 'N'),
	(5, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:37', NULL, 'N'),
	(6, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:37', NULL, 'N'),
	(7, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:38', NULL, 'N'),
	(8, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:38', NULL, 'N'),
	(9, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:38', NULL, 'N'),
	(10, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:38', NULL, 'N'),
	(11, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:38', NULL, 'N'),
	(12, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:38', NULL, 'N'),
	(13, 'ADMIN', '1', '테스트', '테스트', 0, '2023-05-08 16:58:38', NULL, 'N');

-- 테이블 mini_db2.T3_AIMG 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_AIMG` (
  `APATHNO` int NOT NULL AUTO_INCREMENT,
  `ABNO` int DEFAULT NULL,
  `PATH` varchar(1000) DEFAULT NULL,
  `REP` char(2) DEFAULT NULL,
  PRIMARY KEY (`APATHNO`),
  KEY `FK_T3_AIMG_T3_ABRD` (`ABNO`),
  CONSTRAINT `FK_T3_AIMG_T3_ABRD` FOREIGN KEY (`ABNO`) REFERENCES `T3_ABRD` (`ABNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ADMIN 게시판 이미지';

-- 테이블 데이터 mini_db2.T3_AIMG:~0 rows (대략적) 내보내기
DELETE FROM `T3_AIMG`;

-- 테이블 mini_db2.T3_BAN 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_BAN` (
  `BANO` int unsigned NOT NULL AUTO_INCREMENT,
  `ID` varchar(40) NOT NULL COMMENT '아이디',
  `TBNO` int NOT NULL COMMENT '게시판번호',
  `CNO` int DEFAULT NULL COMMENT '댓글번호',
  `CONTENT` varchar(200) DEFAULT NULL COMMENT '신고사유',
  PRIMARY KEY (`BANO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_BAN:~0 rows (대략적) 내보내기
DELETE FROM `T3_BAN`;

-- 테이블 mini_db2.T3_BIMG 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_BIMG` (
  `BPATHNO` int NOT NULL COMMENT '경로 번호, SEQ',
  `PATH` varchar(1000) NOT NULL COMMENT '이미지경로',
  PRIMARY KEY (`BPATHNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_BIMG:~0 rows (대략적) 내보내기
DELETE FROM `T3_BIMG`;

-- 테이블 mini_db2.T3_CBRD 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_CBRD` (
  `CBNO` int NOT NULL AUTO_INCREMENT COMMENT '게시판번호, SEQ',
  `ID` varchar(40) NOT NULL COMMENT '아이디',
  `CATE1` varchar(20) DEFAULT NULL COMMENT 'SPO스포츠,CEL연예인,MOV영화,ANI애니메이션,GAM게임',
  `CATE2` varchar(20) DEFAULT NULL COMMENT 'SPO1구기종목, SPO2라켓종목, SPO3헬스/요가/필라테스, SPO4골프, SPO5치어리더, CEL1보이그룹, CEL2걸그룹, CEL3솔로가수(남), CEL4솔로가수(여), CEL5배우(남), CEL6배우(여), CEL7방송/예능, MOV1국내영화, MOV2해외영화, MOV3디즈니, ANI1일본, ANI2국내, ANI3해외, GAM1국내온라인게임, GAM2국내콘솔게임, GAM3해외온라인게임, GAM4해외콘솔게임',
  `CTITLE` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '글 제목',
  `CCONT` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '글 내용',
  `HITS` int DEFAULT NULL COMMENT '조회수',
  `CDATE` datetime NOT NULL COMMENT '날짜(게시일)',
  `UDATE` datetime DEFAULT NULL COMMENT '날짜(수정일)',
  `DELYN` char(2) DEFAULT 'N' COMMENT '삭제 Y / N',
  PRIMARY KEY (`CBNO`),
  KEY `FK_T3_CBRD_T3_USER` (`ID`),
  CONSTRAINT `FK_T3_CBRD_T3_USER` FOREIGN KEY (`ID`) REFERENCES `T3_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_CBRD:~0 rows (대략적) 내보내기
DELETE FROM `T3_CBRD`;
INSERT INTO `T3_CBRD` (`CBNO`, `ID`, `CATE1`, `CATE2`, `CTITLE`, `CCONT`, `HITS`, `CDATE`, `UDATE`, `DELYN`) VALUES
	(1, 'test01', 'SPO', 'SPO1', 'test01', 'test01', 0, '2023-05-08 17:11:50', NULL, 'N'),
	(2, 'test02', 'SPO', 'SPO2', 'test02', 'test02', 0, '2023-05-08 17:11:59', NULL, 'N'),
	(3, 'test03', 'SPO', 'SPO3', 'test03', 'test03', 0, '2023-05-08 17:12:31', NULL, 'N'),
	(4, 'test04', 'SPO', 'SPO4', 'test04', 'test04', 0, '2023-05-08 17:12:31', NULL, 'N'),
	(5, 'test05', 'SPO', 'SPO5', 'test05', 'test05', 0, '2023-05-08 17:12:31', NULL, 'N'),
	(6, 'test06', 'SPO', 'SPO1', 'test06', 'test06', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(7, 'test07', 'SPO', 'SPO2', 'test07', 'test07', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(8, 'test08', 'SPO', 'SPO3', 'test08', 'test08', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(9, 'test09', 'SPO', 'SPO4', 'test09', 'test09', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(10, 'test10', 'SPO', 'SPO5', 'test10', 'test10', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(11, 'test11', 'SPO', 'SPO1', 'test11', 'test11', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(12, 'test12', 'SPO', 'SPO2', 'test12', 'test12', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(13, 'test13', 'SPO', 'SPO3', 'test13', 'test13', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(14, 'test14', 'SPO', 'SPO4', 'test14', 'test14', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(15, 'test15', 'SPO', 'SPO5', 'test15', 'test15', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(16, 'test16', 'SPO', 'SPO1', 'test16', 'test16', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(17, 'test17', 'SPO', 'SPO2', 'test17', 'test17', 0, '2023-05-08 17:12:32', NULL, 'N'),
	(18, 'test18', 'SPO', 'SPO3', 'test18', 'test18', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(19, 'test19', 'SPO', 'SPO4', 'test19', 'test19', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(20, 'test20', 'SPO', 'SPO5', 'test20', 'test20', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(21, 'test21', 'CEL', 'CEL1', 'test21', 'test21', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(22, 'test22', 'CEL', 'CEL2', 'test22', 'test22', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(23, 'test23', 'CEL', 'CEL3', 'test23', 'test23', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(24, 'test24', 'CEL', 'CEL4', 'test24', 'test24', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(25, 'test25', 'CEL', 'CEL5', 'test25', 'test25', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(26, 'test26', 'CEL', 'CEL6', 'test26', 'test26', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(27, 'test27', 'CEL', 'CEL7', 'test27', 'test27', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(28, 'test28', 'CEL', 'CEL1', 'test28', 'test28', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(29, 'test29', 'CEL', 'CEL2', 'test29', 'test29', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(30, 'test30', 'CEL', 'CEL3', 'test30', 'test30', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(31, 'test01', 'CEL', 'CEL4', 'test01', 'test01', 0, '2023-05-08 17:12:33', NULL, 'N'),
	(32, 'test02', 'CEL', 'CEL5', 'test02', 'test02', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(33, 'test03', 'CEL', 'CEL6', 'test03', 'test03', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(34, 'test04', 'CEL', 'CEL7', 'test04', 'test04', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(35, 'test05', 'CEL', 'CEL1', 'test05', 'test05', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(36, 'test06', 'CEL', 'CEL2', 'test06', 'test06', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(37, 'test07', 'CEL', 'CEL3', 'test07', 'test07', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(38, 'test08', 'CEL', 'CEL4', 'test08', 'test08', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(39, 'test09', 'CEL', 'CEL5', 'test09', 'test09', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(40, 'test10', 'CEL', 'CEL6', 'test10', 'test10', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(41, 'test11', 'CEL', 'CEL7', 'test11', 'test11', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(42, 'test12', 'CEL', 'CEL1', 'test12', 'test12', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(43, 'test13', 'CEL', 'CEL2', 'test13', 'test13', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(44, 'test14', 'CEL', 'CEL3', 'test14', 'test14', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(45, 'test15', 'CEL', 'CEL4', 'test15', 'test15', 0, '2023-05-08 17:12:34', NULL, 'N'),
	(46, 'test16', 'CEL', 'CEL5', 'test16', 'test16', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(47, 'test17', 'CEL', 'CEL6', 'test17', 'test17', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(48, 'test18', 'CEL', 'CEL7', 'test18', 'test18', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(49, 'test19', 'MOV', 'MOV1', 'test19', 'test19', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(50, 'test20', 'MOV', 'MOV2', 'test20', 'test20', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(51, 'test21', 'MOV', 'MOV3', 'test21', 'test21', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(52, 'test22', 'MOV', 'MOV1', 'test22', 'test22', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(53, 'test23', 'MOV', 'MOV2', 'test23', 'test23', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(54, 'test24', 'MOV', 'MOV3', 'test24', 'test24', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(55, 'test25', 'MOV', 'MOV1', 'test25', 'test25', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(56, 'test26', 'MOV', 'MOV2', 'test26', 'test26', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(57, 'test27', 'MOV', 'MOV3', 'test27', 'test27', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(58, 'test28', 'MOV', 'MOV1', 'test28', 'test28', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(59, 'test29', 'MOV', 'MOV2', 'test29', 'test29', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(60, 'test30', 'MOV', 'MOV3', 'test30', 'test30', 0, '2023-05-08 17:12:35', NULL, 'N'),
	(61, 'test01', 'MOV', 'MOV1', 'test01', 'test01', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(62, 'test02', 'MOV', 'MOV2', 'test02', 'test02', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(63, 'test03', 'MOV', 'MOV3', 'test03', 'test03', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(64, 'test04', 'MOV', 'MOV1', 'test04', 'test04', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(65, 'test05', 'MOV', 'MOV2', 'test05', 'test05', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(66, 'test06', 'MOV', 'MOV3', 'test06', 'test06', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(67, 'test07', 'ANI', 'ANI1', 'test07', 'test07', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(68, 'test08', 'ANI', 'ANI2', 'test08', 'test08', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(69, 'test09', 'ANI', 'ANI3', 'test09', 'test09', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(70, 'test10', 'ANI', 'ANI1', 'test10', 'test10', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(71, 'test11', 'ANI', 'ANI2', 'test11', 'test11', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(72, 'test12', 'ANI', 'ANI3', 'test12', 'test12', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(73, 'test13', 'ANI', 'ANI1', 'test13', 'test13', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(74, 'test14', 'ANI', 'ANI2', 'test14', 'test14', 0, '2023-05-08 17:12:36', NULL, 'N'),
	(75, 'test15', 'ANI', 'ANI3', 'test15', 'test15', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(76, 'test16', 'ANI', 'ANI1', 'test16', 'test16', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(77, 'test17', 'ANI', 'ANI2', 'test17', 'test17', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(78, 'test18', 'ANI', 'ANI3', 'test18', 'test18', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(79, 'test19', 'ANI', 'ANI1', 'test19', 'test19', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(80, 'test20', 'ANI', 'ANI2', 'test20', 'test20', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(81, 'test21', 'ANI', 'ANI3', 'test21', 'test21', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(82, 'test22', 'ANI', 'ANI1', 'test22', 'test22', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(83, 'test23', 'ANI', 'ANI2', 'test23', 'test23', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(84, 'test24', 'ANI', 'ANI3', 'test24', 'test24', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(85, 'test25', 'ANI', 'ANI1', 'test25', 'test25', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(86, 'test26', 'ANI', 'ANI2', 'test26', 'test26', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(87, 'test27', 'ANI', 'ANI3', 'test27', 'test27', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(88, 'test28', 'GAM', 'GAM1', 'test28', 'test28', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(89, 'test29', 'GAM', 'GAM2', 'test29', 'test29', 0, '2023-05-08 17:12:37', NULL, 'N'),
	(90, 'test30', 'GAM', 'GAM3', 'test30', 'test30', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(91, 'test01', 'GAM', 'GAM4', 'test01', 'test01', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(92, 'test02', 'GAM', 'GAM1', 'test02', 'test02', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(93, 'test03', 'GAM', 'GAM2', 'test03', 'test03', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(94, 'test04', 'GAM', 'GAM3', 'test04', 'test04', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(95, 'test05', 'GAM', 'GAM4', 'test05', 'test05', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(96, 'test06', 'GAM', 'GAM1', 'test06', 'test06', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(97, 'test07', 'GAM', 'GAM2', 'test07', 'test07', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(98, 'test08', 'GAM', 'GAM3', 'test08', 'test08', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(99, 'test09', 'GAM', 'GAM4', 'test09', 'test09', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(100, 'test10', 'GAM', 'GAM1', 'test10', 'test10', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(101, 'test11', 'GAM', 'GAM2', 'test11', 'test11', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(102, 'test12', 'GAM', 'GAM3', 'test12', 'test12', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(103, 'test13', 'GAM', 'GAM4', 'test13', 'test13', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(104, 'test14', 'GAM', 'GAM1', 'test14', 'test14', 0, '2023-05-08 17:12:38', NULL, 'N'),
	(105, 'test15', 'GAM', 'GAM2', 'test15', 'test15', 0, '2023-05-08 17:12:39', NULL, 'N'),
	(106, 'test16', 'GAM', 'GAM3', 'test16', 'test16', 0, '2023-05-08 17:12:39', NULL, 'N'),
	(107, 'test17', 'GAM', 'GAM4', 'test17', 'test17', 0, '2023-05-08 17:12:39', NULL, 'N');

-- 테이블 mini_db2.T3_CHATR 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_CHATR` (
  `CRNO` int NOT NULL AUTO_INCREMENT,
  `TBNO` int NOT NULL,
  `BUYID` varchar(40) NOT NULL,
  `SELLID` varchar(40) NOT NULL,
  `CDATE` datetime NOT NULL,
  `DELYN` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`CRNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='채팅방';

-- 테이블 데이터 mini_db2.T3_CHATR:~0 rows (대략적) 내보내기
DELETE FROM `T3_CHATR`;

-- 테이블 mini_db2.T3_CIMG 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_CIMG` (
  `CPATHNO` int NOT NULL AUTO_INCREMENT COMMENT '경로 번호, SEQ',
  `CBNO` int NOT NULL COMMENT '커뮤게시판번호',
  `PATH` varchar(1000) DEFAULT NULL COMMENT '이미지경로',
  `REP` char(2) DEFAULT NULL COMMENT 'N-기본,Y-대표이미지',
  PRIMARY KEY (`CPATHNO`),
  KEY `FK_T3_CIMG_T3_CBRD` (`CBNO`),
  CONSTRAINT `FK_T3_CIMG_T3_CBRD` FOREIGN KEY (`CBNO`) REFERENCES `T3_CBRD` (`CBNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_CIMG:~0 rows (대략적) 내보내기
DELETE FROM `T3_CIMG`;

-- 테이블 mini_db2.T3_CMRE 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_CMRE` (
  `CNO` int NOT NULL COMMENT '댓글번호, SEQ',
  `TBNO` int NOT NULL COMMENT '게시판번호',
  `ID` varchar(40) NOT NULL COMMENT '아이디',
  `CONTE` varchar(1000) DEFAULT NULL COMMENT '댓글 본문',
  `RECONTE` varchar(5000) DEFAULT NULL COMMENT '리뷰 본문',
  `CDATE` datetime NOT NULL COMMENT '작성시간',
  `UDATE` datetime DEFAULT NULL COMMENT '수정시간',
  `RECNO` int DEFAULT NULL COMMENT '대댓글 번호',
  `REVWFLG` char(2) DEFAULT NULL COMMENT '0-댓글,1-리뷰',
  `SHOWYN` char(2) DEFAULT NULL COMMENT 'Y-공개댓글, N-비밀댓글',
  `DELYN` char(2) DEFAULT 'N' COMMENT '삭제 Y / N',
  PRIMARY KEY (`CNO`),
  KEY `FK_T3_CMRE_T3_USER` (`ID`),
  KEY `FK_T3_CMRE_T3_TBRD` (`TBNO`),
  CONSTRAINT `FK_T3_CMRE_T3_TBRD` FOREIGN KEY (`TBNO`) REFERENCES `T3_TBRD` (`TBNO`),
  CONSTRAINT `FK_T3_CMRE_T3_USER` FOREIGN KEY (`ID`) REFERENCES `T3_USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_CMRE:~0 rows (대략적) 내보내기
DELETE FROM `T3_CMRE`;

-- 테이블 mini_db2.T3_DESC 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_DESC` (
  `DNO` int NOT NULL COMMENT '세부사항번호, SEQ',
  `CID` varchar(60) NOT NULL COMMENT '컬럼명',
  `CNUM` varchar(20) DEFAULT NULL COMMENT '값',
  `CINFO` varchar(60) NOT NULL COMMENT '값정보',
  `PCOMM1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '2->1차 부모일때/3->2차부모일때',
  `PCOMM2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '3->1차 부모일때/의뢰게시판',
  PRIMARY KEY (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_DESC:~79 rows (대략적) 내보내기
DELETE FROM `T3_DESC`;
INSERT INTO `T3_DESC` (`DNO`, `CID`, `CNUM`, `CINFO`, `PCOMM1`, `PCOMM2`) VALUES
	(1, 'USTATUS', '1', '사용가능', '', ''),
	(2, 'USTATUS', '2', '중지', '', ''),
	(3, 'USTATUS', '3', '탈퇴', '', ''),
	(4, 'GRDNUM', '1', '-2', '', ''),
	(5, 'GRDNUM', '2', '-1', '', ''),
	(6, 'GRDNUM', '3', '1', '', ''),
	(7, 'GRDNUM', '4', '2', '', ''),
	(8, 'GRDNUM', '5', '3', '', ''),
	(9, 'BRDSET', '1', '거래게시판', '', ''),
	(10, 'BRDSET', '2', '의뢰게시판', '', ''),
	(11, 'BRDFLG', '1', '거래게시판', '', ''),
	(12, 'BRDFLG', '2', '의뢰게시판', '', ''),
	(13, 'BRDFLG', '3', '홍보게시판', '', ''),
	(14, 'KIND', '1', '구매', '', ''),
	(15, 'KIND', '2', '판매', '', ''),
	(16, 'KIND', '3', '의뢰', '', ''),
	(17, 'KIND', '4', '홍보', '', ''),
	(18, 'BPROD', '1', '미개봉', '', ''),
	(19, 'BPROD', '2', '거의 새것', '', ''),
	(20, 'BPROD', '3', '상', '', ''),
	(21, 'BPROD', '4', '중', '', ''),
	(22, 'BPROD', '5', '하', '', ''),
	(23, 'BSTATUS', '1', '판매', '', ''),
	(24, 'BSTATUS', '2', '구매', '', ''),
	(25, 'BSTATUS', '3', '의뢰요청', '', ''),
	(26, 'BSTATUS', '4', '예약/거래중', '', ''),
	(27, 'BSTATUS', '5', '완료', '', ''),
	(28, 'BPUR', '1', '직거래', '', ''),
	(29, 'BPUR', '2', '택배', '', ''),
	(30, 'BPUR', '3', '온라인', '', ''),
	(31, 'BBOX', '1', '박스있음', '', ''),
	(32, 'BBOX', '2', '박스없음', '', ''),
	(33, 'BRCPT', '1', '영수증 있음', '', ''),
	(34, 'BRCPT', '2', '영수증 없음', '', ''),
	(35, 'BCMS', '1', '조립', '', ''),
	(36, 'BCMS', '2', '도색', '', ''),
	(37, 'BCMS', '3', '수리', '', ''),
	(38, 'BCMS', '4', '커미션', '', ''),
	(39, 'CATE1', 'SPO', '스포츠', '', ''),
	(40, 'CATE1', 'CEL', '연예인', '', ''),
	(41, 'CATE1', 'MOV', '영화', '', ''),
	(42, 'CATE1', 'ANI', '애니메이션', '', ''),
	(43, 'CATE1', 'GAM', '게임', '', ''),
	(44, 'CATE2', 'SPO1', '구기종목', 'SPO', ''),
	(45, 'CATE2', 'SPO2', '라켓종목', 'SPO', ''),
	(46, 'CATE2', 'SPO3', '헬스/요가/필라테스', 'SPO', ''),
	(47, 'CATE2', 'SPO4', '골프', 'SPO', ''),
	(48, 'CATE2', 'SPO5', '치어리더', 'SPO', ''),
	(49, 'CATE2', 'CEL1', '보이그룹', 'CEL', ''),
	(50, 'CATE2', 'CEL2', '걸그룹', 'CEL', ''),
	(51, 'CATE2', 'CEL3', '솔로가수(남)', 'CEL', ''),
	(52, 'CATE2', 'CEL4', '솔로가수(여)', 'CEL', ''),
	(53, 'CATE2', 'CEL5', '배우(남)', 'CEL', ''),
	(54, 'CATE2', 'CEL6', '배우(여)', 'CEL', ''),
	(55, 'CATE2', 'CEL7', '방송/예능', 'CEL', ''),
	(56, 'CATE2', 'MOV1', '국내영화', 'MOV', ''),
	(57, 'CATE2', 'MOV2', '해외영화', 'MOV', ''),
	(58, 'CATE2', 'MOV3', '디즈니', 'MOV', ''),
	(59, 'CATE2', 'ANI1', '일본', 'ANI', ''),
	(60, 'CATE2', 'ANI2', '국내', 'ANI', ''),
	(61, 'CATE2', 'ANI3', '해외', 'ANI', ''),
	(62, 'CATE2', 'GAM1', '국내온라인게임', 'GAM', ''),
	(63, 'CATE2', 'GAM2', '국내콘솔게임', 'GAM', ''),
	(64, 'CATE2', 'GAM3', '해외온라인게임', 'GAM', ''),
	(65, 'CATE2', 'GAM4', '해외콘솔게임', 'GAM', ''),
	(66, 'CATE3', '1', '포토카드', '', ''),
	(67, 'CATE3', '2', '의류', '', ''),
	(68, 'CATE3', '3', '패션/악세서리', '', ''),
	(69, 'CATE3', '4', '피규어', '', ''),
	(70, 'CATE3', '5', '아크릴/문구', '', ''),
	(71, 'CATE3', '6', '기타용품', '', ''),
	(72, 'REQG', '1', '사과', '', ''),
	(73, 'REQG', '2', '나무', '', ''),
	(74, 'REQG', '3', '가지', '', ''),
	(75, 'REQG', '4', '잎새', '', ''),
	(76, 'REQG', '5', '새싹', '', ''),
	(77, 'GENDER', '1', '남자', '', ''),
	(78, 'GENDER', '2', '여자', '', ''),
	(79, 'GENDER', '3', '기타', '', ''),
	(80, 'CATE0', '1', '공지', NULL, NULL),
	(81, 'QUIZ', 'Q1', '기억에 남는 추억의 장소는?', '', ''),
	(82, 'QUIZ', 'Q2', '자신의 인생 좌우명은?', '', ''),
	(83, 'QUIZ', 'Q3', '가장 기억에 남는 선생님 성함은?', '', ''),
	(84, 'QUIZ', 'Q4', '자신의 게임 닉네임은?', '', ''),
	(85, 'QUIZ', 'Q5', '받았던 선물 중 기억에 남는 독특한 선물은?', '', ''),
	(86, 'QUIZ', 'Q6', '유년시절 가장 생각나는 친구 이름은?', '', ''),
	(87, 'QUIZ', 'Q7', '인상 깊게 읽은 책 이름은?', '', ''),
	(88, 'QUIZ', 'Q8', '읽은 책 중에서 좋아하는 구절이 있다면?', '', ''),
	(89, 'QUIZ', 'Q9', '자신이 두 번째로 존경하는 인물은?', '', ''),
	(90, 'QUIZ', 'Q10', '친구들에게 공개하지 않은 어릴 적 별명이 있다면?', '', ''),
	(91, 'QUIZ', 'Q11', '초등학교 때 기억에 남는 짝꿍 이름은?', '', ''),
	(92, 'QUIZ', 'Q12', '다시 태어나면 되고 싶은 것은?', '', ''),
	(93, 'QUIZ', 'Q13', '내가 좋아하는 캐릭터는?', '', '');

-- 테이블 mini_db2.T3_GRD 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_GRD` (
  `GNO` int unsigned NOT NULL AUTO_INCREMENT,
  `ID` varchar(40) NOT NULL COMMENT '아이디',
  `TBNO` int NOT NULL COMMENT '게시판번호',
  `GRDNUM` char(2) NOT NULL COMMENT '1.-2점 / 2.-1점 / 3.1점 / 4.2점/5.3점',
  `BRDSET` char(2) NOT NULL COMMENT '1-거래게시판 2-의뢰게시판',
  PRIMARY KEY (`GNO`),
  KEY `FK_T3_GRD_T3_USER` (`ID`),
  KEY `FK_T3_GRD_T3_TBRD` (`TBNO`),
  CONSTRAINT `FK_T3_GRD_T3_TBRD` FOREIGN KEY (`TBNO`) REFERENCES `T3_TBRD` (`TBNO`),
  CONSTRAINT `FK_T3_GRD_T3_USER` FOREIGN KEY (`ID`) REFERENCES `T3_USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_GRD:~0 rows (대략적) 내보내기
DELETE FROM `T3_GRD`;

-- 테이블 mini_db2.T3_JJIM 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_JJIM` (
  `JJNO` int unsigned NOT NULL AUTO_INCREMENT,
  `ID` varchar(40) NOT NULL COMMENT '아이디',
  `TBNO` int NOT NULL COMMENT '거래게시판번호',
  PRIMARY KEY (`JJNO`),
  KEY `FK_T3_JJIM_T3_USER` (`ID`),
  KEY `FK_T3_JJIM_T3_TBRD` (`TBNO`),
  CONSTRAINT `FK_T3_JJIM_T3_TBRD` FOREIGN KEY (`TBNO`) REFERENCES `T3_TBRD` (`TBNO`),
  CONSTRAINT `FK_T3_JJIM_T3_USER` FOREIGN KEY (`ID`) REFERENCES `T3_USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_JJIM:~0 rows (대략적) 내보내기
DELETE FROM `T3_JJIM`;

-- 테이블 mini_db2.T3_PROF 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_PROF` (
  `ID` varchar(40) NOT NULL COMMENT '아이디',
  `INTRO` varchar(1000) DEFAULT NULL COMMENT '프로필 한줄소개',
  `PINFO` varchar(1000) DEFAULT NULL COMMENT '프로필 상세내용',
  `CINTRO` varchar(1000) DEFAULT NULL COMMENT '크리에이터 프로필 한줄소개',
  KEY `FK_T3_PROF_T3_USER` (`ID`),
  CONSTRAINT `FK_T3_PROF_T3_USER` FOREIGN KEY (`ID`) REFERENCES `T3_USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_PROF:~0 rows (대략적) 내보내기
DELETE FROM `T3_PROF`;

-- 테이블 mini_db2.T3_REPRO 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_REPRO` (
  `RENO` int NOT NULL COMMENT '순서, SEQ',
  `ID` varchar(40) NOT NULL COMMENT '아이디',
  `TBNO` int NOT NULL COMMENT '게시판번호',
  `VDATE` datetime NOT NULL COMMENT '사용자가 게시글 클릭시 / 갱신 /7일간 보관',
  PRIMARY KEY (`RENO`),
  KEY `FK_T3_REPRO_T3_USER` (`ID`),
  KEY `FK_T3_REPRO_T3_TBRD` (`TBNO`),
  CONSTRAINT `FK_T3_REPRO_T3_TBRD` FOREIGN KEY (`TBNO`) REFERENCES `T3_TBRD` (`TBNO`),
  CONSTRAINT `FK_T3_REPRO_T3_USER` FOREIGN KEY (`ID`) REFERENCES `T3_USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_REPRO:~0 rows (대략적) 내보내기
DELETE FROM `T3_REPRO`;

-- 테이블 mini_db2.T3_TBRD 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_TBRD` (
  `TBNO` int NOT NULL AUTO_INCREMENT COMMENT '게시판번호, SEQ',
  `ID` varchar(40) NOT NULL COMMENT '아이디',
  `BPRICE` int DEFAULT NULL COMMENT '상품가격',
  `BTITLE` varchar(300) DEFAULT NULL COMMENT '글 제목',
  `BCONT` varchar(1000) DEFAULT NULL COMMENT '글 내용',
  `HITS` int DEFAULT NULL COMMENT '조회수',
  `LIKES` int DEFAULT NULL COMMENT '찜 횟수',
  `BRDFLG` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '게시판종류 1-거래게시판,2-의뢰게시판3-홍보게시판',
  `KIND` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '글머리 1-구매,  2-판매,  3-의뢰, 4-홍보',
  `CATE1` varchar(20) DEFAULT NULL COMMENT 'SPO스포츠,CEL연예인,MOV영화,ANI애니메이션,GAM게임',
  `CATE2` varchar(20) DEFAULT NULL COMMENT 'SPO1구기종목, SPO2라켓종목, SPO3헬스/요가/필라테스, SPO4골프, SPO5치어리더, CEL1보이그룹, CEL2걸그룹, CEL3솔로가수(남), CEL4솔로가수(여), CEL5배우(남), CEL6배우(여), CEL7방송/예능, MOV1국내영화, MOV2해외영화, MOV3디즈니, ANI1일본, ANI2국내, ANI3해외, GAM1국내온라인게임, GAM2국내콘솔게임, GAM3해외온라인게임, GAM4해외콘솔게임',
  `CATE3` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '3차분류 카드,1 - 포토카드 , 2 - 의류 , 3  - 패션/악세사리 , 4 - 피규어 , 5 -  아크릴/문구 , 6 - 기타용품',
  `BPROD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '상품 상태 1-미개봉, 2-거의 새것, 3-사용감 상, 4-사용감 중, 5-사용감 하',
  `BSTATUS` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '거래 상태1-판매, 2-구매,3-의뢰요청 4-예약/거래중 5-완료',
  `BPUR` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '거래 방법 1-직거래, 2-택배, 3-온라인',
  `BBOX` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '박스 상태 1-박스 있음, 2-박스 없음',
  `BRCPT` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '영수증 여부 1-영수증 있음, 2-영수증 없음',
  `BCMS` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '의뢰 종류 1-조립, 2-도색, 3-수리, 4-커미션',
  `LOCAL1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '지역1',
  `LOCAL2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '지역2',
  `LOCAL3` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '지역3',
  `CDATE` datetime DEFAULT NULL COMMENT '날짜(게시일)',
  `UDATE` datetime DEFAULT NULL COMMENT '날짜(수정일)',
  `DELYN` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'N' COMMENT '삭제 Y / N',
  PRIMARY KEY (`TBNO`),
  KEY `FK_T3_TBRD_T3_USER` (`ID`),
  CONSTRAINT `FK_T3_TBRD_T3_USER` FOREIGN KEY (`ID`) REFERENCES `T3_USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_TBRD:~0 rows (대략적) 내보내기
DELETE FROM `T3_TBRD`;
INSERT INTO `T3_TBRD` (`TBNO`, `ID`, `BPRICE`, `BTITLE`, `BCONT`, `HITS`, `LIKES`, `BRDFLG`, `KIND`, `CATE1`, `CATE2`, `CATE3`, `BPROD`, `BSTATUS`, `BPUR`, `BBOX`, `BRCPT`, `BCMS`, `LOCAL1`, `LOCAL2`, `LOCAL3`, `CDATE`, `UDATE`, `DELYN`) VALUES
	(1, 'test01', 1000000, '판매', '2', 2, 11, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', NULL, NULL, '2023-05-08 13:20:09', NULL, 'N'),
	(2, 'test01', 10000, 'test01', 'test01', 0, 0, '1', '1', 'SPO', 'SPO1', '1', '1', '1', '1', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:49', NULL, 'N'),
	(3, 'test02', 20000, 'test02', 'test02', 0, 0, '2', '2', 'SPO', 'SPO2', '2', '2', '1', '2', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:49', NULL, 'N'),
	(4, 'test03', 30000, 'test03', 'test03', 0, 0, '3', '3', 'SPO', 'SPO3', '3', '3', '3', '3', '1', '1', '1', '0', NULL, NULL, '2023-05-08 15:54:49', NULL, 'N'),
	(5, 'test04', 40000, 'test04', 'test04', 0, 0, '2', '1', 'SPO', 'SPO4', '4', '4', '3', '1', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:49', NULL, 'N'),
	(6, 'test05', 50000, 'test05', 'test05', 0, 0, '1', '2', 'SPO', 'SPO5', '5', '5', '4', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:50', NULL, 'N'),
	(7, 'test06', 80000, 'test06', 'test06', 0, 0, '3', '3', 'SPO', 'SPO1', '6', '1', '5', '3', '1', '1', '2', '0', NULL, NULL, '2023-05-08 15:54:50', NULL, 'N'),
	(8, 'test07', 10000, 'test07', 'test07', 0, 0, '2', '2', 'SPO', 'SPO2', '5', '2', '5', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:50', NULL, 'N'),
	(9, 'test08', 100000, 'test08', 'test08', 0, 0, '1', '2', 'SPO', 'SPO3', '4', '3', '1', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:50', NULL, 'N'),
	(10, 'test09', 2000000, 'test09', 'test09', 0, 0, '2', '2', 'SPO', 'SPO4', '5', '4', '2', '3', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:50', NULL, 'N'),
	(11, 'test10', 200000, 'test10', 'test10', 0, 0, '3', '3', 'SPO', 'SPO5', '2', '5', '3', '2', '1', '1', '3', '0', NULL, NULL, '2023-05-08 15:54:50', NULL, 'N'),
	(12, 'test11', 10000, 'test11', 'test11', 0, 0, '2', '3', 'SPO', 'SPO1', '3', '1', '1', '3', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:50', NULL, 'N'),
	(13, 'test12', 50000, 'test12', 'test12', 0, 0, '1', '3', 'SPO', 'SPO2', '4', '2', '2', '2', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:50', NULL, 'N'),
	(14, 'test13', 10000, 'test13', 'test13', 0, 0, '2', '3', 'SPO', 'SPO3', '5', '3', '3', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:50', NULL, 'N'),
	(15, 'test14', 20000, 'test14', 'test14', 0, 0, '3', '3', 'SPO', 'SPO4', '1', '1', '4', '2', '1', '1', '4', '0', NULL, NULL, '2023-05-08 15:54:51', NULL, 'N'),
	(16, 'test15', 30000, 'test15', 'test15', 0, 0, '1', '1', 'SPO', 'SPO5', '4', '2', '5', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:51', NULL, 'N'),
	(17, 'test16', 40000, 'test16', 'test16', 0, 0, '2', '1', 'SPO', 'CEL1', '2', '3', '3', '1', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:51', NULL, 'N'),
	(18, 'test17', 50000, 'test17', 'test17', 0, 0, '3', '1', 'CEL', 'CEL2', '3', '1', '3', '1', '1', '1', '2', '0', NULL, NULL, '2023-05-08 15:54:51', NULL, 'N'),
	(19, 'test18', 80000, 'test18', 'test18', 0, 0, '1', '2', 'CEL', 'CEL3', '6', '2', '2', '1', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:51', NULL, 'N'),
	(20, 'test19', 10000, 'test19', 'test19', 0, 0, '2', '2', 'CEL', 'CEL4', '5', '3', '3', '1', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:51', NULL, 'N'),
	(21, 'test20', 100000, 'test20', 'test20', 0, 0, '3', '2', 'CEL', 'CEL5', '2', '4', '4', '2', '1', '1', '3', '0', NULL, NULL, '2023-05-08 15:54:51', NULL, 'N'),
	(22, 'test21', 2000000, 'test21', 'test21', 0, 0, '1', '2', 'CEL', 'CEL6', '4', '5', '5', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:51', NULL, 'N'),
	(23, 'test22', 200000, 'test22', 'test22', 0, 0, '2', '2', 'CEL', 'CEL7', '3', '2', '3', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:52', NULL, 'N'),
	(24, 'test23', 10000, 'test23', 'test23', 0, 0, '3', '2', 'CEL', 'CEL1', '2', '1', '4', '3', '2', '1', '2', '0', NULL, NULL, '2023-05-08 15:54:52', NULL, 'N'),
	(25, 'test24', 50000, 'test24', 'test24', 0, 0, '1', '1', 'CEL', 'CEL2', '5', '2', '1', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:52', NULL, 'N'),
	(26, 'test25', 10000, 'test25', 'test25', 0, 0, '2', '1', 'CEL', 'CEL3', '1', '3', '2', '1', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:52', NULL, 'N'),
	(27, 'test26', 20000, 'test26', 'test26', 0, 0, '3', '1', 'CEL', 'CEL4', '5', '4', '3', '1', '1', '1', '3', '0', NULL, NULL, '2023-05-08 15:54:52', NULL, 'N'),
	(28, 'test27', 30000, 'test27', 'test27', 0, 0, '1', '2', 'CEL', 'CEL5', '6', '5', '2', '1', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:52', NULL, 'N'),
	(29, 'test28', 40000, 'test28', 'test28', 0, 0, '2', '3', 'CEL', 'CEL6', '9', '2', '3', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:52', NULL, 'N'),
	(30, 'test29', 50000, 'test29', 'test29', 0, 0, '3', '2', 'CEL', 'CEL7', '8', '3', '4', '3', '1', '1', '4', '0', NULL, NULL, '2023-05-08 15:54:52', NULL, 'N'),
	(31, 'test30', 80000, 'test30', 'test30', 0, 0, '1', '1', 'MOV', 'MOV1', '4', '1', '5', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:53', NULL, 'N'),
	(32, 'test01', 10000, 'test01', 'test01', 0, 0, '1', '1', 'MOV', 'MOV1', '1', '2', '1', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:53', NULL, 'N'),
	(33, 'test02', 20000, 'test02', 'test02', 0, 0, '2', '2', 'MOV', 'MOV2', '2', '1', '2', '3', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:53', NULL, 'N'),
	(34, 'test03', 40000, 'test03', 'test03', 0, 0, '3', '3', 'MOV', 'MOV3', '6', '2', '3', '1', '1', '1', '1', '0', NULL, NULL, '2023-05-08 15:54:53', NULL, 'N'),
	(35, 'test04', 50000, 'test04', 'test04', 0, 0, '2', '1', 'MOV', 'MOV1', '3', '3', '1', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:53', NULL, 'N'),
	(36, 'test05', 10000, 'test05', 'test05', 0, 0, '1', '2', 'MOV', 'MOV2', '4', '1', '2', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:53', NULL, 'N'),
	(37, 'test06', 100000, 'test06', 'test06', 0, 0, '3', '3', 'MOV', 'MOV3', '5', '2', '3', '2', '2', '1', '2', '0', NULL, NULL, '2023-05-08 15:54:53', NULL, 'N'),
	(38, 'test07', 2000000, 'test07', 'test07', 0, 0, '2', '2', 'MOV', 'MOV1', '3', '3', '4', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:53', NULL, 'N'),
	(39, 'test08', 10000, 'test08', 'test08', 0, 0, '1', '2', 'MOV', 'MOV2', '2', '4', '5', '1', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:54', NULL, 'N'),
	(40, 'test09', 50000, 'test09', 'test09', 0, 0, '2', '2', 'MOV', 'MOV3', '5', '5', '2', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:54', NULL, 'N'),
	(41, 'test10', 10000, 'test10', 'test10', 0, 0, '3', '3', 'MOV', 'MOV1', '6', '1', '3', '2', '2', '1', '3', '0', NULL, NULL, '2023-05-08 15:54:54', NULL, 'N'),
	(42, 'test11', 30000, 'test11', 'test11', 0, 0, '2', '3', 'MOV', 'MOV2', '1', '2', '4', '1', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:54', NULL, 'N'),
	(43, 'test12', 40000, 'test12', 'test12', 0, 0, '1', '3', 'MOV', 'MOV3', '4', '3', '5', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:54', NULL, 'N'),
	(44, 'test13', 80000, 'test13', 'test13', 0, 0, '2', '3', 'MOV', 'MOV3', '2', '4', '1', '2', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:54', NULL, 'N'),
	(45, 'test14', 10000, 'test14', 'test14', 0, 0, '3', '3', 'ANI', 'ANI1', '3', '1', '3', '1', '1', '1', '4', '0', NULL, NULL, '2023-05-08 15:54:54', NULL, 'N'),
	(46, 'test15', 2000000, 'test15', 'test15', 0, 0, '1', '1', 'ANI', 'ANI2', '5', '2', '3', '2', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:54', NULL, 'N'),
	(47, 'test16', 200000, 'test16', 'test16', 0, 0, '2', '1', 'ANI', 'ANI3', '3', '1', '1', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:54', NULL, 'N'),
	(48, 'test17', 50000, 'test17', 'test17', 0, 0, '3', '1', 'ANI', 'ANI1', '2', '2', '3', '3', '1', '1', '1', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(49, 'test18', 10000, 'test18', 'test18', 0, 0, '1', '2', 'ANI', 'ANI2', '5', '3', '2', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(50, 'test19', 30000, 'test19', 'test19', 0, 0, '2', '2', 'ANI', 'ANI3', '3', '4', '3', '1', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(51, 'test20', 40000, 'test20', 'test20', 0, 0, '3', '2', 'ANI', 'ANI1', '6', '5', '4', '2', '1', '1', '2', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(52, 'test21', 80000, 'test21', 'test21', 0, 0, '1', '2', 'ANI', 'ANI2', '4', '1', '5', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(53, 'test22', 10000, 'test22', 'test22', 0, 0, '2', '2', 'ANI', 'ANI3', '4', '2', '1', '2', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(54, 'test23', 20000, 'test23', 'test23', 0, 0, '3', '2', 'ANI', 'ANI1', '2', '1', '3', '1', '1', '1', '3', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(55, 'test24', 40000, 'test24', 'test24', 0, 0, '1', '1', 'ANI', 'ANI2', '1', '2', '3', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(56, 'test25', 50000, 'test25', 'test25', 0, 0, '2', '1', 'ANI', 'ANI3', '5', '3', '4', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(57, 'test26', 10000, 'test26', 'test26', 0, 0, '3', '1', 'ANI', 'ANI2', '2', '1', '5', '2', '2', '1', '2', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(58, 'test27', 100000, 'test27', 'test27', 0, 0, '1', '2', 'ANI', 'ANI3', '3', '2', '1', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(59, 'test28', 2000000, 'test28', 'test28', 0, 0, '2', '3', 'GAM', 'GAM1', '2', '3', '2', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:55', NULL, 'N'),
	(60, 'test29', 10000, 'test29', 'test29', 0, 0, '3', '2', 'GAM', 'GAM2', '1', '4', '3', '1', '2', '1', '4', '0', NULL, NULL, '2023-05-08 15:54:56', NULL, 'N'),
	(61, 'test30', 50000, 'test30', 'test30', 0, 0, '1', '1', 'GAM', 'GAM3', '2', '5', '4', '1', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:56', NULL, 'N'),
	(62, 'test01', 10000, 'test01', 'test01', 0, 0, '1', '1', 'GAM', 'GAM4', '3', '2', '5', '1', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:56', NULL, 'N'),
	(63, 'test02', 30000, 'test02', 'test02', 0, 0, '2', '2', 'GAM', 'GAM1', '5', '3', '1', '2', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:56', NULL, 'N'),
	(64, 'test03', 40000, 'test03', 'test03', 0, 0, '3', '3', 'GAM', 'GAM2', '4', '4', '3', '3', '1', '1', '3', '0', NULL, NULL, '2023-05-08 15:54:56', NULL, 'N'),
	(65, 'test04', 80000, 'test04', 'test04', 0, 0, '2', '1', 'GAM', 'GAM3', '6', '5', '1', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:56', NULL, 'N'),
	(66, 'test05', 10000, 'test05', 'test05', 0, 0, '1', '2', 'GAM', 'GAM4', '2', '1', '2', '1', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:56', NULL, 'N'),
	(67, 'test06', 2000000, 'test06', 'test06', 0, 0, '3', '3', 'GAM', 'GAM1', '5', '2', '3', '2', '2', '1', '2', '0', NULL, NULL, '2023-05-08 15:54:56', NULL, 'N'),
	(68, 'test07', 200000, 'test07', 'test07', 0, 0, '2', '2', 'GAM', 'GAM2', '1', '1', '2', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:56', NULL, 'N'),
	(69, 'test08', 50000, 'test08', 'test08', 0, 0, '1', '2', 'GAM', 'GAM3', '4', '2', '3', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:56', NULL, 'N'),
	(70, 'test09', 10000, 'test09', 'test09', 0, 0, '2', '2', 'GAM', 'GAM4', '3', '3', '4', '1', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:56', NULL, 'N'),
	(71, 'test10', 30000, 'test10', 'test10', 0, 0, '3', '3', 'GAM', 'GAM1', '5', '1', '5', '2', '1', '1', '1', '0', NULL, NULL, '2023-05-08 15:54:57', NULL, 'N'),
	(72, 'test11', 40000, 'test11', 'test11', 0, 0, '2', '3', 'GAM', 'GAM2', '2', '2', '2', '3', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:57', NULL, 'N'),
	(73, 'test12', 80000, 'test12', 'test12', 0, 0, '1', '3', 'GAM', 'GAM3', '3', '3', '3', '2', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:57', NULL, 'N'),
	(74, 'test13', 80000, 'test13', 'test13', 0, 0, '2', '3', 'GAM', 'GAM4', '4', '4', '1', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:57', NULL, 'N'),
	(75, 'test14', 10000, 'test14', 'test14', 0, 0, '3', '3', 'GAM', 'GAM1', '5', '5', '3', '1', '1', '1', '1', '0', NULL, NULL, '2023-05-08 15:54:57', NULL, 'N'),
	(76, 'test15', 30000, 'test15', 'test15', 0, 0, '1', '1', 'GAM', 'GAM2', '6', '2', '3', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:57', NULL, 'N'),
	(77, 'test16', 40000, 'test16', 'test16', 0, 0, '2', '1', 'GAM', 'GAM3', '7', '3', '4', '2', '1', '1', '', '0', NULL, NULL, '2023-05-08 15:54:57', NULL, 'N'),
	(78, 'test17', 80000, 'test17', 'test17', 0, 0, '2', '3', 'GAM', 'GAM4', '8', '4', '5', '3', '2', '1', '', '0', NULL, NULL, '2023-05-08 15:54:57', NULL, 'N'),
	(79, 'test05', 500000, 'test05', 'test05', 0, 0, '0', '0', NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL, 'N');

-- 테이블 mini_db2.T3_TIMG 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_TIMG` (
  `TPATHNO` int NOT NULL COMMENT '경로 번호, SEQ',
  `TBNO` int NOT NULL COMMENT '거래게시판번호',
  `PATH` varchar(1000) DEFAULT NULL COMMENT '이미지경로',
  `REP` char(2) DEFAULT NULL COMMENT 'N-기본,Y-대표이미지',
  PRIMARY KEY (`TPATHNO`),
  KEY `FK_T3_TIMG_T3_TBRD` (`TBNO`),
  CONSTRAINT `FK_T3_TIMG_T3_TBRD` FOREIGN KEY (`TBNO`) REFERENCES `T3_TBRD` (`TBNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_TIMG:~0 rows (대략적) 내보내기
DELETE FROM `T3_TIMG`;

-- 테이블 mini_db2.T3_UIMG 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_UIMG` (
  `PPATHNO` int NOT NULL COMMENT '경로 번호, SEQ',
  `ID` varchar(40) NOT NULL COMMENT 'ID',
  `PATH` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '이미지경로',
  PRIMARY KEY (`PPATHNO`),
  KEY `FK_T3_UIMG_T3_USER` (`ID`),
  CONSTRAINT `FK_T3_UIMG_T3_USER` FOREIGN KEY (`ID`) REFERENCES `T3_USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_UIMG:~0 rows (대략적) 내보내기
DELETE FROM `T3_UIMG`;

-- 테이블 mini_db2.T3_USER 구조 내보내기
CREATE TABLE IF NOT EXISTS `T3_USER` (
  `ID` varchar(40) NOT NULL COMMENT '아이디',
  `PASSWD` varchar(40) NOT NULL COMMENT '비밀번호',
  `NAME` varchar(20) NOT NULL COMMENT '이름',
  `NICK` varchar(20) NOT NULL COMMENT '닉네임',
  `GENDER` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '성별 1-남자 2-여자 3-기타',
  `BIRTH` datetime DEFAULT NULL COMMENT '생년월일',
  `PHONE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '전화번호',
  `EMAIL` varchar(100) NOT NULL COMMENT '이메일',
  `ADDR` varchar(200) DEFAULT NULL COMMENT '주소',
  `QUIZ` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ANSWER` varchar(100) NOT NULL,
  `GRADE` int NOT NULL DEFAULT '30' COMMENT '사용자 기본 평점',
  `CGRADE` int NOT NULL DEFAULT '30' COMMENT '크리에이터 기본 평점',
  `POINT` int NOT NULL DEFAULT '0' COMMENT '사용자 포인트',
  `BANCNT1` int NOT NULL DEFAULT '0' COMMENT '게시판 신고 누적횟수/트리거?',
  `BANCNT2` int NOT NULL DEFAULT '0' COMMENT '댓글 신고 누적횟수',
  `PWCONT` int NOT NULL DEFAULT '0' COMMENT '로그인 실패 횟수',
  `AUTH1YN` char(2) DEFAULT 'N' COMMENT '이메일 인증, 대문자로만 처리',
  `AUTH2YN` char(2) DEFAULT 'N' COMMENT '연락처 인증, 대문자로만 처리',
  `CREAFLG` char(2) DEFAULT 'N' COMMENT '크리에이터 권한',
  `ADMINFLG` char(2) DEFAULT 'N' COMMENT '관리자 권한',
  `USTATUS` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '1-사용가능, 2-불가능, 3-중지',
  `CDATE` datetime DEFAULT NULL COMMENT '생성일',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 mini_db2.T3_USER:~31 rows (대략적) 내보내기
DELETE FROM `T3_USER`;
INSERT INTO `T3_USER` (`ID`, `PASSWD`, `NAME`, `NICK`, `GENDER`, `BIRTH`, `PHONE`, `EMAIL`, `ADDR`, `QUIZ`, `ANSWER`, `GRADE`, `CGRADE`, `POINT`, `BANCNT1`, `BANCNT2`, `PWCONT`, `AUTH1YN`, `AUTH2YN`, `CREAFLG`, `ADMINFLG`, `USTATUS`, `CDATE`) VALUES
	('admin', '1234', 'admin', 'admin', '3', '2023-05-04 12:33:55', '1234567890', 'admin@admin.com', 'adminaddr', 'Q1', 'Q1', 30, 30, 0, 0, 0, 0, 'Y', 'Y', 'N', 'Y', '1', '2023-05-08 16:12:59'),
	('test01', '1232', 'test01', 'test01', '3', '2023-05-04 03:37:21', '123456', 'test01@test.com', 'testaddrs', 'Q2', 'Q2', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test02', '1233', 'test02', 'test02', '3', '2023-05-04 03:37:21', '123456', 'test02@test.com', 'testaddrs', 'Q3', 'Q3', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test03', '1234', 'test03', 'test03', '3', '2023-05-04 03:37:22', '123456', 'test03@test.com', 'testaddrs', 'Q4', 'Q4', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test04', '1234', 'test04', 'test04', '3', '2023-05-04 03:37:22', '123456', 'test04@test.com', 'testaddrs', 'Q5', 'Q5', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test05', '1234', 'test05', 'test05', '3', '2023-05-04 03:37:22', '123456', 'test05@test.com', 'testaddrs', 'Q6', 'Q6', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test06', '1234', 'test06', 'test06', '3', '2023-05-04 03:37:22', '123456', 'test06@test.com', 'testaddrs', 'Q7', 'Q7', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test07', '1234', 'test07', 'test07', '3', '2023-05-04 03:37:22', '123456', 'test07@test.com', 'testaddrs', 'Q8', 'Q8', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test08', '1234', 'test08', 'test08', '3', '2023-05-04 03:37:22', '123456', 'test08@test.com', 'testaddrs', 'Q9', 'Q9', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test09', '1234', 'test09', 'test09', '3', '2023-05-04 03:37:22', '123456', 'test09@test.com', 'testaddrs', 'Q10', 'Q10', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test10', '1234', 'test10', 'test10', '3', '2023-05-04 03:37:22', '123456', 'test10@test.com', 'testaddrs', 'Q11', 'Q11', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test11', '1234', 'test11', 'test11', '3', '2023-05-04 03:37:22', '123456', 'test11@test.com', 'testaddrs', 'Q12', 'Q12', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test12', '1234', 'test12', 'test12', '3', '2023-05-04 03:37:23', '123456', 'test12@test.com', 'testaddrs', 'Q13', 'Q13', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test13', '1234', 'test13', 'test13', '3', '2023-05-04 03:37:23', '123456', 'test13@test.com', 'testaddrs', 'Q1', 'Q1', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test14', '1234', 'test14', 'test14', '3', '2023-05-04 03:37:23', '123456', 'test14@test.com', 'testaddrs', 'Q2', 'Q2', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test15', '1234', 'test15', 'test15', '3', '2023-05-04 03:37:23', '123456', 'test15@test.com', 'testaddrs', 'Q3', 'Q3', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test16', '1234', 'test16', 'test16', '3', '2023-05-04 03:37:23', '123456', 'test16@test.com', 'testaddrs', 'Q4', 'Q4', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test17', '1234', 'test17', 'test17', '3', '2023-05-04 03:37:23', '123456', 'test17@test.com', 'testaddrs', 'Q5', 'Q5', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test18', '1234', 'test18', 'test18', '3', '2023-05-04 03:37:23', '123456', 'test18@test.com', 'testaddrs', 'Q6', 'Q6', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test19', '1234', 'test19', 'test19', '3', '2023-05-04 03:37:23', '123456', 'test19@test.com', 'testaddrs', 'Q7', 'Q7', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test20', '1234', 'test20', 'test20', '3', '2023-05-04 03:37:24', '123456', 'test20@test.com', 'testaddrs', 'Q8', 'Q8', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test21', '1234', 'test21', 'test21', '3', '2023-05-04 03:37:24', '123456', 'test21@test.com', 'testaddrs', 'Q9', 'Q9', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test22', '1234', 'test22', 'test22', '3', '2023-05-04 03:37:24', '123456', 'test22@test.com', 'testaddrs', 'Q10', 'Q10', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test23', '1234', 'test23', 'test23', '3', '2023-05-04 03:37:24', '123456', 'test23@test.com', 'testaddrs', 'Q11', 'Q11', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test24', '1234', 'test24', 'test24', '3', '2023-05-04 03:37:24', '123456', 'test24@test.com', 'testaddrs', 'Q12', 'Q12', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test25', '1234', 'test25', 'test25', '3', '2023-05-04 03:37:24', '123456', 'test25@test.com', 'testaddrs', 'Q13', 'Q13', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test26', '1234', 'test26', 'test26', '3', '2023-05-04 03:37:24', '123456', 'test26@test.com', 'testaddrs', 'Q1', 'Q1', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test27', '1234', 'test27', 'test27', '3', '2023-05-04 03:37:24', '123456', 'test27@test.com', 'testaddrs', 'Q2', 'Q2', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test28', '1234', 'test28', 'test28', '3', '2023-05-04 03:37:24', '123456', 'test28@test.com', 'testaddrs', 'Q3', 'Q3', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test29', '1234', 'test29', 'test29', '3', '2023-05-04 03:37:25', '123456', 'test29@test.com', 'testaddrs', 'Q4', 'Q4', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59'),
	('test30', '1234', 'test30', 'test30', '3', '2023-05-04 03:37:25', '123456', 'test30@test.com', 'testaddrs', 'Q5', 'Q5', 30, 30, 0, 0, 0, 0, 'Y', 'N', 'N', 'N', '1', '2023-05-08 16:12:59');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
