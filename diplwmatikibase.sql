-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.18 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.6037
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for diplwmatiki
DROP DATABASE IF EXISTS `diplwmatiki`;
CREATE DATABASE IF NOT EXISTS `diplwmatiki` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `diplwmatiki`;

-- Dumping structure for table diplwmatiki.excersice_tables
DROP TABLE IF EXISTS `excersice_tables`;
CREATE TABLE IF NOT EXISTS `excersice_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.excersice_tables: ~5 rows (approximately)
/*!40000 ALTER TABLE `excersice_tables` DISABLE KEYS */;
REPLACE INTO `excersice_tables` (`id`, `table_name`) VALUES
	(20, 'persons'),
	(64, 'ko'),
	(66, 'players'),
	(67, 'scores'),
	(78, 'tests'),
	(80, 'asdads'),
	(81, 'pools'),
	(82, 'owners');
/*!40000 ALTER TABLE `excersice_tables` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.fill_fields_questions
DROP TABLE IF EXISTS `fill_fields_questions`;
CREATE TABLE IF NOT EXISTS `fill_fields_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) COLLATE utf8_bin NOT NULL,
  `fill_field_question` varchar(500) COLLATE utf8_bin NOT NULL,
  `hideWord` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.fill_fields_questions: ~25 rows (approximately)
/*!40000 ALTER TABLE `fill_fields_questions` DISABLE KEYS */;
REPLACE INTO `fill_fields_questions` (`id`, `question`, `fill_field_question`, `hideWord`) VALUES
	(1, 'Εισάγετε τη δήλωση που λείπει για να λάβετε όλες τις στήλες από τον πίνακα Πελάτες.', 'SELECT * FROM Customers', 'SELECT,*'),
	(2, 'Γράψτε μια δήλωση που θα επιλέξει τη στήλη Πόλη από τον πίνακα Πελάτες.', 'SELECT City FROM Customers', 'SELECT,City,FROM'),
	(15, 'Επιλέξτε όλες τις διαφορετικές τιμές από τη στήλη Χώρα στον πίνακα Πελάτες.', 'SELECT DISTINCT Country FROM Customers;', 'SELECT,DISTINCT'),
	(16, 'Επιλέξτε όλες τις εγγραφές όπου η στήλη Πόλη έχει την τιμή "Βερολίνο".', 'SELECT * FROM Customers WHERE City = \'Berlin\'', 'WHERE,City,\'Berlin\''),
	(17, 'Χρησιμοποιήστε τη λέξη-κλειδί NOT για να επιλέξετε όλες τις εγγραφές όπου η πόλη ΔΕΝ είναι "Βερολίνο".', 'SELECT * FROM Customers WHERE NOT City =  \'Berlin\'', 'WHERE,NOT,City,\'Berlin\''),
	(18, 'Επιλέξτε όλες τις εγγραφές όπου η στήλη CustomerID έχει την τιμή 32.', 'SELECT * FROM Customers WHERE CustomerID = 32', 'WHERE,=,32'),
	(19, 'Επιλέξτε όλες τις εγγραφές από τον πίνακα Πελάτες, ταξινομήστε το αποτέλεσμα που αντιστρέφεται αλφαβητικά από τη στήλη Πόλη.', 'SELECT * FROM Customers ORDER BY City DESC', 'ORDER BY,City,DESC'),
	(20, 'Εισαγάγετε μια νέα εγγραφή στον πίνακα Πελάτες.', 'INSERT INTO Customers (CustomerName ) VALUES (\'Hekkan Burger\')', 'INSERT INTO,(,),VALUES,(,)'),
	(21, 'Επιλέξτε όλες τις εγγραφές από τους πελάτες όπου η στήλη PostalCode ΔΕΝ είναι κενή', 'SELECT * FROM Customers WHERE PostalCode IS NOT NULL', 'PostalCode,IS,NOT,NULL'),
	(22, 'Ορίστε την τιμή των στηλών Πόλη σε "Όσλο", αλλά μόνο εκείνες όπου η στήλη Χώρα έχει την τιμή "Νορβηγία".', 'UPDATE Customers SET City = \'Oslo\' WHERE Country=\'Norway\';', 'UPDATE,SET,WHERE'),
	(23, 'Διαγράψτε όλες τις εγγραφές από τον πίνακα Πελάτες.', 'DELETE FROM Customers', 'DELETE,FROM'),
	(24, 'Χρησιμοποιήστε μια συνάρτηση SQL για να επιλέξετε την εγγραφή με την υψηλότερη τιμή της στήλης Τιμή.', 'SELECT MAX(Price) FROM Products;', 'MAX(Price)'),
	(25, 'Χρησιμοποιήστε τη συνάρτηση MIN για να επιλέξετε την εγγραφή με τη μικρότερη τιμή στη στήλη Τιμή.', 'SELECT MIN(Price) FROM Products;', 'MIN(Price)'),
	(26, 'Χρησιμοποιήστε μια συνάρτηση SQL για να υπολογίσετε το άθροισμα όλων των τιμών της στήλης Τιμή στον πίνακα Προϊόντα.', 'SELECT SUM(Price) FROM Products;', 'SUM(Price)'),
	(27, 'Επιλέξτε όλες τις εγγραφές όπου η τιμή της στήλης Πόλη τελειώνει με το γράμμα "a".', 'SELECT * FROM Customers WHERE City LIKE \'%a\'', 'WHERE,City,LIKE,\'%a\''),
	(28, 'Επιλέξτε όλες τις εγγραφές όπου η τιμή της στήλης Πόλη ξεκινά με το γράμμα "a" και τελειώνει με το γράμμα "b".', 'SELECT * FROM Customers WHERE City LIKE \'a%b\'', 'WHERE,City,LIKE ,\'a%b\''),
	(29, 'Επιλέξτε όλες τις εγγραφές όπου το πρώτο γράμμα της πόλης είναι "a" ή "c" ή "s".', 'SELECT * FROM Customers WHERE City LIKE \'[acs]%\'', '[acs]'),
	(30, 'Επιλέξτε όλες τις εγγραφές όπου το πρώτο γράμμα της Πόλης ξεκινά με οτιδήποτε από "a" έως "f".', 'SELECT * FROM Customers WHERE City LIKE \'[a-f]%\'', '[a-f]'),
	(31, 'Χρησιμοποιήστε τον τελεστή IN για να επιλέξετε όλες τις εγγραφές όπου η χώρα ΔΕΝ είναι "Νορβηγία" και ΔΕΝ "Γαλλία".', 'SELECT * FROM Customers WHERE Country NOT IN (\'Norway\', \'France\');', 'WHERE,Country,NOT,IN'),
	(32, 'Χρησιμοποιήστε τον τελεστή IN για να επιλέξετε όλες τις εγγραφές όπου η χώρα είναι είτε "Νορβηγία" είτε "Γαλλία".', 'SELECT * FROM Customers WHERE Country IN (\'Norway\', \'France\' )', 'WHERE,Country,IN,(\'Norway\',)'),
	(33, 'Χρησιμοποιήστε τον τελεστή BETWEEN για να επιλέξετε όλες τις εγγραφές όπου η τιμή της στήλης Τιμή είναι μεταξύ 10 και 20.', 'SELECT * FROM Products WHERE Price BETWEEN 10 AND 20', 'BETWEEN,10,AND,20'),
	(34, 'Χρησιμοποιήστε τον χειριστή ΜΕΤΑΞΥ για να επιλέξετε όλες τις εγγραφές όπου η τιμή της στήλης Τιμή ΔΕΝ είναι μεταξύ 10 και 20.', 'SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20', 'NOT,BETWEEN'),
	(35, 'Κατά την εμφάνιση του πίνακα Πελάτες, δημιουργήστε ένα ALIAS της στήλης PostalCode, η στήλη θα πρέπει να ονομάζεται Pno.', 'SELECT CustomerName,Address,PostalCode AS Pno FROM Customers;', 'AS,Pno'),
	(36, 'Εισαγάγετε τα μέρη που λείπουν στον όρο JOIN για να ενωθείτε με τους δύο πίνακες Παραγγελίες και Πελάτες, χρησιμοποιώντας το πεδίο CustomerID και στους δύο πίνακες ως σχέση μεταξύ των δύο πινάκων.', 'SELECT * FROM Orders LEFT JOIN Customers ON Orders.CustomerID=Customers.CustomerID', 'ON,Orders.CustomerID,Customers.CustomerID'),
	(37, 'Επιλέξτε τη σωστή ρήτρα JOIN για να επιλέξετε όλες τις εγγραφές από τους δύο πίνακες όπου υπάρχει αντιστοιχία και στους δύο πίνακες.', 'SELECT * FROM Orders INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;', 'INNER JOIN,Customers'),
	(38, 'Επιλέξτε τη σωστή ρήτρα JOIN για να επιλέξετε όλες τις εγγραφές από τον πίνακα Πελάτες συν όλους τους αγώνες στον πίνακα Παραγγελίες.', 'SELECT * FROM Orders RIGHT JOIN Customers ON Orders.CustomerID=Customers.CustomerID;', 'RIGHT JOIN,Customers'),
	(39, 'Αναφέρετε τον αριθμό των πελατών σε κάθε χώρα.', 'SELECT COUNT (CustomerID),Country FROM Customers GROUP BY Country', 'COUNT,GROUP BY,Country'),
	(40, 'Αναφέρετε πρώτα τον αριθμό των πελατών σε κάθε χώρα, κατά σειρά με τη σειρά με τους περισσότερους πελάτες.', 'SELECT COUNT (CustomerID),Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC', 'COUNT,GROUP BY,Country,COUNT(CustomerID),DESC'),
	(41, 'Κατά την εμφάνιση του πίνακα Πελάτες, δημιουργήστε ένα ALIAS της στήλης PostalCode, η στήλη θα πρέπει να ονομάζεται Pno.', 'SELECT CustomerName,Address,PostalCode AS Pno FROM Customers;', 'AS Pno');
/*!40000 ALTER TABLE `fill_fields_questions` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.owners
DROP TABLE IF EXISTS `owners`;
CREATE TABLE IF NOT EXISTS `owners` (
  `id` int(23) NOT NULL,
  `name` varchar(23) COLLATE utf8_bin NOT NULL,
  `surname` varchar(23) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.owners: ~0 rows (approximately)
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.persons
DROP TABLE IF EXISTS `persons`;
CREATE TABLE IF NOT EXISTS `persons` (
  `id` int(23) NOT NULL AUTO_INCREMENT,
  `name` varchar(234) COLLATE utf8_bin NOT NULL,
  `surname` varchar(234) COLLATE utf8_bin NOT NULL,
  `address` varchar(234) COLLATE utf8_bin DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `isAlive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.persons: ~7 rows (approximately)
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
REPLACE INTO `persons` (`id`, `name`, `surname`, `address`, `birthdate`, `isAlive`) VALUES
	(1, 'giorgos', 'pappas', '1300 Carter St', '2020-05-05 00:00:00', 1),
	(2, 'aleksis', 'panousis', '1300 Carter St', '1994-05-05 00:00:00', 1),
	(4, 'dimitris', 'lappas', 'loykias', '1865-03-03 00:00:00', 0),
	(5, 'giorgos', 'paraskeyas', 'kwstopoulou', '1965-01-26 00:00:00', 0),
	(6, 'dimitra', 'augeri', 'agiou dimitriou', '1963-06-06 00:00:00', 1),
	(7, 'panagiwta', 'kakkou', 'fwkionos 16', '1988-12-01 00:00:00', 1),
	(8, 'kostas', 'antwniadis', 'newxoropoulo 14', '1945-06-06 00:00:00', 0);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(23) NOT NULL,
  `name` varchar(234) COLLATE utf8_bin NOT NULL,
  `surname` varchar(234) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.players: ~4 rows (approximately)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
REPLACE INTO `players` (`id`, `name`, `surname`) VALUES
	(1, 'dimitris', 'motsios'),
	(2, 'giorgos', 'kakkos'),
	(3, 'ilias', 'antwniadis'),
	(4, 'giorgos', 'pappas');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.pools
DROP TABLE IF EXISTS `pools`;
CREATE TABLE IF NOT EXISTS `pools` (
  `idpool` int(21) NOT NULL,
  `owner_id` int(23) DEFAULT NULL,
  PRIMARY KEY (`idpool`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.pools: ~0 rows (approximately)
/*!40000 ALTER TABLE `pools` DISABLE KEYS */;
/*!40000 ALTER TABLE `pools` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.scores
DROP TABLE IF EXISTS `scores`;
CREATE TABLE IF NOT EXISTS `scores` (
  `id` int(23) NOT NULL,
  `score` int(23) DEFAULT NULL,
  `player_id` int(23) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.scores: ~6 rows (approximately)
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
REPLACE INTO `scores` (`id`, `score`, `player_id`) VALUES
	(1, 58, 1),
	(2, 65, 1),
	(3, 20, 1),
	(4, 34, 2),
	(5, 234, 3),
	(6, 23, 3),
	(7, 345, 3);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.score_table
DROP TABLE IF EXISTS `score_table`;
CREATE TABLE IF NOT EXISTS `score_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `time` varchar(100) COLLATE utf8_bin NOT NULL,
  `category` varchar(45) COLLATE utf8_bin NOT NULL,
  `difficulty` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id_idx` (`student_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.score_table: ~38 rows (approximately)
/*!40000 ALTER TABLE `score_table` DISABLE KEYS */;
REPLACE INTO `score_table` (`id`, `student_id`, `score`, `time`, `category`, `difficulty`, `created_at`, `updated_at`) VALUES
	(20, 5, 65, '00:01:22', '15 Questions', 'hard', '2020-12-08 17:24:31', '2020-12-08 17:24:31'),
	(21, 16, 40, '00:02:22', '25 Questions', 'hard', '2020-12-08 17:25:03', '2020-12-08 17:25:03'),
	(22, 16, 80, '00:02:22', '15 Questions', 'hard', '2020-12-08 20:31:59', '2020-12-08 20:31:59'),
	(23, 5, 70, '00:04:22', '25 Questions', 'easy', '2020-12-08 20:32:02', '2020-12-08 20:32:02'),
	(24, 16, 25, '00:03:22', '15 Questions', 'easy', '2020-12-09 20:16:36', '2020-12-09 20:16:36'),
	(25, 5, 85, '00:40:22', '25 Questions', 'easy', '2020-12-09 20:16:42', '2020-12-09 20:16:42'),
	(31, 5, 90, '00:01:32', '25 Questions', 'easy', '2020-12-14 19:28:35', '2020-12-14 19:28:35'),
	(50, 5, 15, '00:00:24', '25 Questions', 'hard', '2020-12-17 19:37:27', '2020-12-17 19:37:27'),
	(51, 5, 15, '00:00:18', '25 Questions', 'hard', '2020-12-17 19:39:57', '2020-12-17 19:39:57'),
	(52, 5, 15, '00:00:49', '25 Questions', 'hard', '2020-12-19 14:31:17', '2020-12-19 14:31:17'),
	(53, 5, 20, '00:00:26', '15 Questions', 'hard', '2020-12-19 14:43:32', '2020-12-19 14:43:32'),
	(54, 5, 12, '00:00:24', '25 Questions', 'hard', '2020-12-20 20:40:09', '2020-12-20 20:40:09'),
	(55, 5, 20, '00:00:21', '25 Questions', 'easy', '2020-12-20 20:40:41', '2020-12-20 20:40:41'),
	(56, 5, 40, '00:00:31', '15 Questions', 'easy', '2021-01-05 23:00:05', '2021-01-05 23:00:05'),
	(57, 5, 20, '00:00:25', '25 Questions', 'easy', '2021-01-07 16:48:36', '2021-01-07 16:48:36'),
	(58, 5, 15, '00:00:19', '25 Questions', 'easy', '2021-01-07 16:55:19', '2021-01-07 16:55:19'),
	(59, 5, 20, '00:00:15', '25 Questions', 'easy', '2021-01-07 16:56:07', '2021-01-07 16:56:07'),
	(60, 5, 22, '00:00:19', '25 Questions', 'easy', '2021-01-07 16:57:27', '2021-01-07 16:57:27'),
	(61, 5, 22, '00:00:25', '15 Questions', 'easy', '2021-01-07 16:58:36', '2021-01-07 16:58:36'),
	(62, 5, 51, '00:00:19', '15 Questions', 'hard', '2021-01-07 17:38:53', '2021-01-07 17:38:53'),
	(63, 5, 15, '00:00:18', '25 Questions', 'easy', '2021-01-09 13:00:20', '2021-01-09 13:00:20'),
	(64, 5, 30, '00:00:18', '15 Questions', 'easy', '2021-01-09 13:03:36', '2021-01-09 13:03:36'),
	(65, 5, 17, '00:00:18', '25 Questions', 'easy', '2021-01-09 13:04:56', '2021-01-09 13:04:56'),
	(66, 5, 20, '00:00:18', '25 Questions', 'easy', '2021-01-09 13:07:35', '2021-01-09 13:07:35'),
	(67, 5, 15, '00:00:17', '15 Questions', 'easy', '2021-01-09 13:21:44', '2021-01-09 13:21:44'),
	(68, 5, 15, '00:00:15', '25 Questions', 'easy', '2021-01-09 13:28:47', '2021-01-09 13:28:47'),
	(69, 5, 0, '00:00:18', '15 Questions', 'easy', '2021-01-09 13:39:06', '2021-01-09 13:39:06'),
	(70, 5, 36, '00:00:19', '25 Questions', 'hard', '2021-01-09 13:41:18', '2021-01-09 13:41:18'),
	(71, 5, 35, '00:00:17', '15 Questions', 'easy', '2021-01-09 13:42:52', '2021-01-09 13:42:52'),
	(72, 5, 35, '00:00:23', '25 Questions', 'hard', '2021-01-11 19:42:05', '2021-01-11 19:42:05'),
	(73, 22, 72, '00:00:20', '15 Questions', 'hard', '2021-01-12 19:07:19', '2021-01-12 19:07:19'),
	(74, 22, 88, '00:00:30', '25 Questions', 'hard', '2021-01-12 19:08:13', '2021-01-12 19:08:13'),
	(75, 23, 82, '00:00:18', '15 Questions', 'hard', '2021-01-12 19:09:48', '2021-01-12 19:09:48'),
	(76, 23, 45, '00:00:26', '25 Questions', 'hard', '2021-01-12 19:10:34', '2021-01-12 19:10:34'),
	(77, 5, 20, '00:00:25', '15 Questions', 'easy', '2021-01-14 08:46:59', '2021-01-14 08:46:59'),
	(78, 5, 21, '00:00:20', '15 Questions', 'easy', '2021-01-14 10:51:40', '2021-01-14 10:51:40'),
	(79, 5, 40, '00:00:17', '15 Questions', 'hard', '2021-01-14 10:57:02', '2021-01-14 10:57:02'),
	(80, 5, 20, '00:01:23', '15 Questions', 'easy', '2021-01-14 20:11:34', '2021-01-14 20:11:34'),
	(169, 5, 18, '00:00:33', '15 Questions', 'hard', '2021-01-17 13:59:04', '2021-01-17 13:59:04'),
	(170, 5, 0, '00:00:00', '15 Questions', 'hard', '2021-01-17 14:03:41', '2021-01-17 14:03:41'),
	(171, 5, 0, '00:00:01', '15 Questions', 'hard', '2021-01-17 14:04:48', '2021-01-17 14:04:48'),
	(172, 5, 0, '00:00:02', '15 Questions', 'easy', '2021-01-17 14:04:57', '2021-01-17 14:04:57'),
	(173, 5, 0, '00:00:00', '15 Questions', 'easy', '2021-01-17 14:06:02', '2021-01-17 14:06:02');
/*!40000 ALTER TABLE `score_table` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.sql_questions
DROP TABLE IF EXISTS `sql_questions`;
CREATE TABLE IF NOT EXISTS `sql_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) COLLATE utf8_bin NOT NULL,
  `a` varchar(500) COLLATE utf8_bin NOT NULL,
  `b` varchar(500) COLLATE utf8_bin NOT NULL,
  `c` varchar(500) COLLATE utf8_bin NOT NULL,
  `d` varchar(500) COLLATE utf8_bin NOT NULL,
  `correct_answer` varchar(100) COLLATE utf8_bin NOT NULL,
  `score` int(11) NOT NULL,
  `difficulty` varchar(400) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.sql_questions: ~54 rows (approximately)
/*!40000 ALTER TABLE `sql_questions` DISABLE KEYS */;
REPLACE INTO `sql_questions` (`id`, `question`, `a`, `b`, `c`, `d`, `correct_answer`, `score`, `difficulty`) VALUES
	(2, 'Ποια δήλωση SQL χρησιμοποιείται για την εξαγωγή δεδομένων από μια βάση δεδομένων;', 'GET', 'EXTRACT', 'SELECT', 'ef', 'd', 7, 'hard'),
	(3, 'Ποια δήλωση SQL χρησιμοποιείται για την ενημέρωση δεδομένων σε μια βάση δεδομένων; ', 'SAVE    ', 'UPDATE    ', 'SAVE AS', 'SELECT', 'd', 10, 'hard'),
	(4, 'Ποια δήλωση SQL χρησιμοποιείται για τη διαγραφή δεδομένων από μια βάση δεδομένων;', 'DELETE', 'COLLAPSE', 'REMOVE', 'REMOVE', 'd', 5, 'easy'),
	(8, 'Ποια δήλωση SQL χρησιμοποιείται για την ενημέρωση δεδομένων σε μια βάση δεδομένων;', 'SAVE AS  ', 'SAVE', 'UPDATE', 'MODIFY', 'c', 5, 'easy'),
	(12, 'Ποια δήλωση SQL χρησιμοποιείται για την εξαγωγή δεδομένων από μια βάση δεδομένων;', 'GET', 'OPEN', 'SELECT    ', 'EXTRACT  ', 'c', 5, 'easy'),
	(13, 'Τι σημαίνει η SQL;', 'Structured Query Language  ', 'Structured Question Language', 'Strong Question Language', 'Strong Question Language', 'a', 5, 'easy'),
	(14, 'Ποια δήλωση SQL χρησιμοποιείται για τη διαγραφή δεδομένων από μια βάση δεδομένων;', 'COLLAPSE  ', 'REMOVE', 'SELECT', 'DELETE    ', 'd', 5, 'easy'),
	(21, 'Ποια δήλωση SQL χρησιμοποιείται για την εισαγωγή νέων δεδομένων σε μια βάση δεδομένων;', 'INSERT INTO  ', 'ADD RECORD', 'ADD NEW', 'INSERT NEW', 'a', 5, 'easy'),
	(22, 'Με το SQL, πώς επιλέγετε μια στήλη με το όνομα "FirstName" από έναν πίνακα με το όνομα "Persons";', 'SELECT FirstName FROM Persons  ', 'SELECT Persons.FirstName', 'EXTRACT FirstName FROM Persons', 'SELECT *.Persons', 'a', 5, 'easy'),
	(23, 'Με το SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα "Άτομα" όπου η τιμή της στήλης "FirstName" είναι "Peter";', 'SELECT [all] FROM Persons WHERE FirstName LIKE \'Peter\'  ', 'SELECT * FROM Persons WHERE FirstName=\'Peter\'  ', 'SELECT [all] FROM Persons WHERE FirstName=\'Peter\'', 'SELECT * FROM Persons WHERE FirstName<>\'Peter\'', 'b', 5, 'easy'),
	(24, 'Με το SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα "Άτομα" όπου η τιμή της στήλης "FirstName" ξεκινά με "a";', 'SELECT * FROM Persons WHERE FirstName LIKE \'%a\'  ', 'SELECT * FROM Persons WHERE FirstName=\'%a%\'', 'SELECT * FROM Persons WHERE FirstName=\'a\'', 'SELECT * FROM Persons WHERE FirstName LIKE \'a%\'  ', 'd', 5, 'easy'),
	(25, 'Ο τελεστής OR εμφανίζει μια εγγραφή εάν ΚΑΝΕΤΕ οι καταχωρισμένες συνθήκες είναι αληθείς Ο τελεστής AND εμφανίζει μια εγγραφή εάν ΟΛΕΣ οι αναφερόμενες συνθήκες είναι αληθείς', 'False    ', 'True  ', '.', '.', 'b', 5, 'easy'),
	(26, 'Με το SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα "Persons" όπου το "FirstName" είναι "Peter" και το "LastName" είναι "Jackson";', 'SELECT * FROM Persons WHERE FirstName=\'Peter\' AND LastName=\'Jackson\'  ', 'SELECT * FROM Persons WHERE FirstName<>\'Peter\' AND LastName<>\'Jackson\'', 'SELECT FirstName=\'Peter\', LastName=\'Jackson\' FROM Persons', 'SELECT * FROM Persons WHERE LastName>\'Hansen\' AND LastName<\'Pettersen\'  ', 'a', 5, 'easy'),
	(27, 'Με το SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα "Persons" όπου το "LastName" βρίσκεται αλφαβητικά μεταξύ (και περιλαμβάνει) "Hansen" και "Pettersen";', 'SELECT * FROM Persons WHERE LastName>\'Hansen\' AND LastName<\'Pettersen\'  ', 'SELECT * FROM Persons WHERE LastName BETWEEN \'Hansen\' AND \'Pettersen\'  ', 'SELECT LastName>\'Hansen\' AND LastName<\'Pettersen\' FROM Persons', 'SELECT FirstName=\'Peter\', LastName=\'Jackson\' FROM Persons', 'b', 5, 'easy'),
	(28, 'Ποια δήλωση SQL χρησιμοποιείται για την επιστροφή μόνο διαφορετικών τιμών;', 'SELECT DIFFERENT  ', 'SELECT UNIQUE', 'SELECT DISTINCT  ', 'SELECT * FROM Persons WHERE LastName BETWEEN \'Hansen\' AND \'Pettersen\'  ', 'c', 5, 'easy'),
	(29, 'Ποια λέξη-κλειδί SQL χρησιμοποιείται για την ταξινόμηση του συνόλου αποτελεσμάτων;', 'SORT  ', 'ORDER BY  ', 'ORDER', 'SORT BY', 'b', 5, 'easy'),
	(30, 'Με το SQL, πώς μπορείτε να επιστρέψετε όλες τις εγγραφές από έναν πίνακα με το όνομα "Άτομα" ταξινομημένο κατά φθίνουσα κατά "FirstName";', 'SELECT * FROM Persons SORT \'FirstName\' DESC  ', 'SELECT * FROM Persons SORT BY \'FirstName\' DESC', 'SELECT * FROM Persons ORDER BY FirstName DESC  ', 'SELECT * FROM Persons ORDER FirstName DESC', 'c', 5, 'easy'),
	(31, 'Με το SQL, πώς μπορείτε να εισαγάγετε μια νέα εγγραφή στον πίνακα "Πρόσωπα";', 'INSERT VALUES (\'Jimmy\', \'Jackson\') INTO Persons', 'INSERT (\'Jimmy\', \'Jackson\') INTO Persons', 'INSERT INTO Persons VALUES (\'Jimmy\', \'Jackson\')  ', 'INSERT (\'Olsen\') INTO Persons (LastName)', 'c', 5, 'easy'),
	(32, 'Με το SQL, πώς μπορείτε να εισαγάγετε το "Olsen" ως "LastName" στον πίνακα "Persons";', 'INSERT INTO Persons (LastName) VALUES (\'Olsen\')  ', 'INSERT (\'Olsen\') INTO Persons (LastName)', 'INSERT INTO Persons (\'Olsen\') INTO LastName', 'INSERT (\'Jimmy\', \'Jackson\') INTO Persons', 'a', 5, 'easy'),
	(33, 'Πώς μπορείτε να αλλάξετε το "Hansen" σε "Nilsen" στη στήλη "LastName" στον πίνακα Persons;', 'MODIFY Persons SET LastName=\'Nilsen\' WHERE LastName=\'Hansen\'  ', 'UPDATE Persons SET LastName=\'Nilsen\' WHERE LastName=\'Hansen\'  ', 'MODIFY Persons SET LastName=\'Hansen\' INTO LastName=\'Nilsen', 'UPDATE Persons SET LastName=\'Hansen\' INTO LastName=\'Nilsen\'', 'b', 12, 'hard'),
	(34, 'Με το SQL, πώς μπορείτε να διαγράψετε τις εγγραφές όπου το "FirstName" είναι "Peter" στον πίνακα Persons;', 'DELETE ROW FirstName=\'Peter\' FROM Persons', 'DELETE FirstName=\'Peter\' FROM Persons', 'DELETE FROM Persons WHERE FirstName = \'Peter\'  ', '.', 'c', 11, 'hard'),
	(35, 'Με το SQL, πώς μπορείτε να επιστρέψετε τον αριθμό των εγγραφών στον πίνακα "Πρόσωπα";', 'SELECT NO(*) FROM Persons', 'SELECT COUNT(*) FROM Persons  ', 'SELECT LEN(*) FROM Persons', 'SELECT COLUMNS(*) FROM Persons', 'b', 20, 'hard'),
	(36, 'Ποιος είναι ο πιο κοινός τύπος συμμετοχής;', 'JOINED', 'INSIDE JOIN', 'INNER JOIN  ', 'JOINED TABLE', 'c', 11, 'hard'),
	(37, 'Ποιος χειριστής χρησιμοποιείται για την επιλογή τιμών εντός ενός εύρους;', 'WITHIN', 'BETWEEN    ', 'RANGE', 'JOINED', 'b', 11, 'hard'),
	(38, 'Ποιος χειριστής χρησιμοποιείται για την επιλογή τιμών εντός ενός εύρους;', 'WITHIN', 'BETWEEN    ', 'RANGE', 'JOINED TABLE', 'b', 11, 'hard'),
	(39, 'Ο περιορισμός NOT NULL επιβάλλει μια στήλη για να μην δέχεται τιμές NULL.', 'True', 'False', '.', '.', 'b', 11, 'hard'),
	(40, 'Ποιος χειριστής χρησιμοποιείται για την αναζήτηση ενός συγκεκριμένου μοτίβου σε μια στήλη;', 'FROM    ', 'GET', 'LIKE    ', 'RANGE', 'c', 11, 'hard'),
	(41, 'Ποιος είναι ο πιο κοινός τύπος συμμετοχής;', 'JOINED', 'INSIDE JOIN', 'INNER JOIN  ', 'JOINED TABLE', 'c', 11, 'hard'),
	(42, 'Μπορείτε να προσθέσετε μια σειρά χρησιμοποιώντας SQL σε μια βάση δεδομένων με ποιο από τα παρακάτω;', 'ADD', 'CREATE', 'INSERT', 'MAKE', 'c', 5, 'easy'),
	(43, 'Η εντολή για την κατάργηση σειρών από τον πίνακα "ΠΕΛΑΤΗΣ" είναι:', 'REMOVE FROM CUSTOMER ...', 'DROP FROM CUSTOMER ...', 'DELETE FROM CUSTOMER WHERE ...', 'UPDATE FROM CUSTOMER ...', 'c', 5, 'easy'),
	(44, 'Η ρήτρα SQL WHERE:', 'limits the column data that are returned.', 'limits the row data are returned.', 'Both A and B are correct.', 'Neither A nor B are correct.', 'b', 10, 'hard'),
	(45, 'Ποιο από τα παρακάτω είναι ο αρχικός σκοπός του SQL;', 'To specify the syntax and semantics of SQL data definition language', 'To specify the syntax and semantics of SQL manipulation language', 'To define the data structures', 'All of the above.', 'd', 10, 'hard'),
	(46, 'Η μπαλαντέρ σε μια ρήτρα WHERE είναι χρήσιμη πότε;', 'An exact match is necessary in a SELECT statement.', 'An exact match is not possible in a SELECT statement.', 'An exact match is necessary in a CREATE statement.', 'An exact match is not possible in a CREATE statement.', 'b', 7, 'easy'),
	(47, 'Μια άποψη είναι ποια από τις ακόλουθες;', 'A virtual table that can be accessed via SQL commands', 'A virtual table that cannot be accessed via SQL commands', 'A base table that can be accessed via SQL commands', 'A base table that cannot be accessed via SQL commands', 'a', 5, 'easy'),
	(48, 'Η εντολή για την εξάλειψη ενός πίνακα από μια βάση δεδομένων είναι:', 'REMOVE TABLE CUSTOMER;', 'DROP TABLE CUSTOMER;', 'DELETE TABLE CUSTOMER;', 'UPDATE TABLE CUSTOMER;', 'b', 5, 'easy'),
	(49, 'ON UPDATE CASCADE εξασφαλίζει ποιο από τα παρακάτω;', 'Normalization', 'Data Integrity', 'Materialized Views', 'All of the above.', 'b', 5, 'easy'),
	(50, 'ON UPDATE CASCADE εξασφαλίζει ποιο από τα παρακάτω;', 'DDL', 'DML', 'HTML', 'XML', 'a', 7, 'hard'),
	(51, 'Ποιο από τα παρακάτω είναι έγκυρο SQL για ευρετήριο;', 'CREATE INDEX ID;', 'CHANGE INDEX ID;', 'ADD INDEX ID;', 'REMOVE INDEX ID;', 'a', 5, 'hard'),
	(52, 'Η λέξη-κλειδί SQL ________ χρησιμοποιείται με χαρακτήρες μπαλαντέρ.', 'LIKE only', 'IN only', 'NOT IN only', 'IN and NOT IN', 'a', 5, 'hard'),
	(53, 'Ποιο από τα παρακάτω είναι η σωστή σειρά λέξεων-κλειδιών για δηλώσεις SQL SELECT;', 'SELECT, FROM, WHERE', 'FROM, WHERE, SELECT', 'WHERE, FROM,SELECT', 'SELECT,WHERE,FROM', 'a', 5, 'hard'),
	(54, 'Το αποτέλεσμα μιας δήλωσης SQL SELECT είναι ένα α(n) ________.', 'report', 'form', 'file', 'table', 'd', 5, 'easy'),
	(55, 'Η λέξη-κλειδί SQL  BETWEEN  χρησιμοποιείται:', 'for ranges.', 'to limit the columns displayed.', 'as a wildcard.', 'None of the above is correct.', 'a', 7, 'hard'),
	(56, 'Το ________ υιοθετήθηκε ως εθνικό πρότυπο από την ANSI το 1992.', 'Oracle', 'SQL', 'Microsoft Access', 'DBase', 'b', 5, 'easy'),
	(57, 'Ποιο από τα παρακάτω πρέπει να λάβετε υπόψη όταν δημιουργείτε έναν πίνακα σε SQL;', 'Data types', 'Primary keys', 'Default values', 'All of the above.', 'd', 7, 'hard'),
	(58, 'Ποια από τις παρακάτω σειρές ταξινομεί στο SQL;', 'SORT BY', 'ALIGN BY', 'ORDER BY', 'GROUP BY', 'c', 7, 'hard'),
	(59, 'Για να ορίσετε ποιες στήλες πρέπει να εμφανίζονται σε μια δήλωση SQL SELECT:', 'use FROM to name the source table(s) and list the columns to be shown after SELECT.', 'use USING to name the source table(s) and list the columns to be shown after SELECT.', 'use SELECT to name the source table(s) and list the columns to be shown after USING.', 'use USING to name the source table(s) and list the columns to be shown after WHERE.', 'a', 7, 'hard'),
	(60, 'Το SQL μπορεί να χρησιμοποιηθεί για:', 'create database structures only.', 'query database data only.', 'modify database data only.', 'All of the above can be done by SQL.', 'd', 9, 'hard'),
	(61, 'Ποιο από τα παρακάτω είναι μια νομική έκφραση στο SQL;', 'SELECT NULL FROM SALES;', 'SELECT NAME FROM SALES;', 'SELECT * FROM SALES WHEN PRICE = NULL;', 'SELECT # FROM SALES;', 'b', 10, 'hard'),
	(62, 'Το DCL παρέχει εντολές σε λειτουργίες όπως', 'Change thestructureof Tables', 'Insert, Update or Delete Records and Values', 'Authorizing Access and othercontrolover Database', 'None of Above', 'c', 5, 'easy'),
	(63, 'Η συνάρτηση COUNT στο SQL επιστρέφει τον αριθμό ______________', 'Values', 'Distinct values', 'Group By', 'Columns', 'a', 10, 'hard'),
	(64, 'Ποιος τύπος δεδομένων μπορεί να αποθηκεύσει μη δομημένα δεδομένα σε μια στήλη;', 'RAW', 'CHAR', 'NUMERIC', 'VARCHAR', 'a', 15, 'hard'),
	(65, 'Ποια συνάρτηση χρησιμοποιείται για να διαιρέσει μια αριθμητική έκφραση από την άλλη και να πάρει το υπόλοιπο;', 'POWER', 'MOD', 'ROUND', 'REMAINDER', 'b', 9, 'hard'),
	(66, 'Ποια είναι η πλήρης μορφή του DDL;', 'Dynamic Data Language', 'Detailed Data Language', 'Data Definition Language', 'Data Derivation Language', 'c', 8, 'hard'),
	(67, 'Μια γλώσσα βάσης δεδομένων που χρησιμοποιείται για τον ορισμό ολόκληρης της βάσης δεδομένων και του σχήματος ονομάζεται:', 'DCL', 'DML', 'DDL', 'All Of Above', 'c', 6, 'easy'),
	(68, 'Ποια δήλωση στο SQL μας επιτρέπει να αλλάξουμε τον ορισμό ενός πίνακα;', 'ALTER', 'UPDATE', 'CREATE', 'SELECT', 'a', 8, 'hard'),
	(69, 'Το SQL που χρησιμοποιείται από προγράμματα εφαρμογών front-end για να ζητήσει δεδομένα από το DBMS ονομάζεται _______', 'DML', 'DDL', 'VDL', 'SDL', 'a', 10, 'easy'),
	(70, 'Η εντολή που χρησιμοποιείται για τη διαγραφή μιας συγκεκριμένης στήλης σε μια σχέση είναι ____________', 'UPDATE TABLE', 'TRUNCATE COLUMN', 'ALTER , DROP', 'DELETE COLUMN', 'c', 7, 'hard'),
	(71, 'Ποια από τις παρακάτω ενέργειες απαιτεί οι σχέσεις να είναι συμβατές με την ένωση;', 'UNION', 'INTERSECTION', 'DIFFERENCE', 'ALL OF THESE', 'd', 7, 'easy'),
	(72, 'Ποιο από τα παρακάτω είναι χειριστής σύγκρισης στο SQL;', 'Double equal sign ( == )', 'LIKE', 'BETWEEN', 'Single equal sign ( = )', 'a', 12, 'hard'),
	(73, 'Ποιος χειριστής χρησιμοποιείται για να συγκρίνει μια τιμή με μια καθορισμένη λίστα τιμών;', 'BETWEEN', 'ANY', 'IN', 'ALL', 'c', 9, 'easy');
/*!40000 ALTER TABLE `sql_questions` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.sql_random_queries
DROP TABLE IF EXISTS `sql_random_queries`;
CREATE TABLE IF NOT EXISTS `sql_random_queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql_query` varchar(200) COLLATE utf8_bin NOT NULL,
  `table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `table_id_idx` (`table_id`),
  CONSTRAINT `table_id` FOREIGN KEY (`table_id`) REFERENCES `excersice_tables` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.sql_random_queries: ~18 rows (approximately)
/*!40000 ALTER TABLE `sql_random_queries` DISABLE KEYS */;
REPLACE INTO `sql_random_queries` (`id`, `sql_query`, `table_id`) VALUES
	(159, 'SELECT surname, surname FROM persons ORDER BY address ASC', 20),
	(160, 'SELECT * FROM persons ORDER BY surname ASC, birthdate DESC', 20),
	(161, 'SELECT MIN(isAlive) AS minValue  FROM persons', 20),
	(162, 'SELECT COUNT(birthdate) FROM persons', 20),
	(178, 'Select count(id) from persons where id>5', 20),
	(276, 'SELECT id FROM players ORDER BY RAND() LIMIT 1', 66),
	(277, 'SELECT * FROM players WHERE name = (SELECT MAX(name) FROM players)', 66),
	(278, 'SELECT name FROM players UNION SELECT name FROM players ORDER BY \'name\'', 66),
	(279, 'SELECT name,COUNT(*) FROM players WHERE id=\'kostas\' GROUP BY  id ORDER BY \'surname\'', 66),
	(280, 'SELECT * FROM scores ORDER BY \'id\' ASC, id DESC', 67),
	(281, 'SELECT MIN(player_id) AS minValue  FROM scores', 67),
	(282, 'SELECT COUNT(player_id) FROM scores', 67),
	(283, 'SELECT COUNT(score), player_id FROM scores GROUP BY score HAVING COUNT(player_id)', 67),
	(284, 'SELECT * FROM players LEFT JOIN scores ON scores.player_id=players.id', 67),
	(285, 'SELECT * FROM players INNER JOIN scores ON scores.player_id=players.id', 67),
	(287, 'SELECT title, id FROM tests ORDER BY \'title\' ASC', 78),
	(288, 'SELECT * FROM tests ORDER BY \'id\' ASC, id DESC', 78),
	(289, 'SELECT MIN(id) AS minValue  FROM tests', 78),
	(290, 'SELECT COUNT(id) FROM tests', 78),
	(291, 'SELECT COUNT(idpool), owner_id FROM pools GROUP BY idpool HAVING COUNT(owner_id)', 81),
	(292, 'SELECT owner_id FROM pools GROUP BY owner_id', 81),
	(293, 'SELECT owner_id FROM pools ORDER BY RAND() LIMIT 1', 81),
	(294, 'SELECT * FROM pools WHERE owner_id = (SELECT MAX(idpool) FROM pools)', 81),
	(295, 'SELECT surname, surname FROM owners', 82),
	(296, 'SELECT DISTINCT id, name, name FROM owners', 82),
	(297, 'SELECT surname, id FROM owners ORDER BY \'id\' ASC', 82),
	(298, 'SELECT * FROM owners ORDER BY \'surname\' ASC, surname DESC', 82);
/*!40000 ALTER TABLE `sql_random_queries` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.tests
DROP TABLE IF EXISTS `tests`;
CREATE TABLE IF NOT EXISTS `tests` (
  `id` int(23) NOT NULL,
  `title` varchar(23) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.tests: ~0 rows (approximately)
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.user_table
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE IF NOT EXISTS `user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `sex` varchar(45) COLLATE utf8_bin NOT NULL,
  `phone` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `username` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL,
  `role` varchar(100) COLLATE utf8_bin NOT NULL,
  `verification_code` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.user_table: ~7 rows (approximately)
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
REPLACE INTO `user_table` (`id`, `first_name`, `last_name`, `sex`, `phone`, `email`, `username`, `password`, `role`, `verification_code`) VALUES
	(3, 'dimitris', 'motsios', 'male', '6312546987', 'www.motsios@hotmail.com', 'motsios', '$2a$10$w034HpLNWTSOrf9Au.d2G.SDPmLWiA8syFtqHe6fjAj213iD5xcDG', 'teacher', ''),
	(4, 'giorgos', 'pappas', 'male', '6935146987', 'giorgos@gmail.com', 'giorgos', '$2a$10$1X8vht1REou23F.xMl51reymvMVky653wd7ElT5q/JEHGRpuZOFxy', 'teacher', NULL),
	(5, 'kostas', 'kakkos', 'male', '6935123697', 'kostas@gmail.com', 'kostas', '$2a$10$mezTsIwg.Md7Guklprtk6uLrxmIQy4iUfsu5LxD15DutxhIM9yldq', 'student', NULL),
	(15, 'motsskosa', 'qeqwdfdas', 'male', '6932156987', 'motsskosa', 'motsakos', '$2a$10$YIhoXzgqr6zU/D6THXexe.z5H9jeQH/ZduPy7XU8qopZLRLQXywCy', 'teacher', '667377645'),
	(16, 'dionisis', 'papakwstas', 'female', '6936547892', 'dionisis@gmail.com', 'dioni', '$2a$10$AJQJhxAZVVTDbJwU75qGm.BW9LDld1qvaGy/n7dkU9Jw2j9jDSMbq', 'student', NULL),
	(22, 'aleksis', 'koumasis', 'male', '6932156941', 'aleksis', 'aleksis', '$2a$10$4kT52oOxyPwuXXU6LCSMY.OkC8uZOKrZXX2NXIdb7/6/N5GQuO9u.', 'student', NULL),
	(23, 'georgia', 'kali', 'female', '6932569515', 'georgia', 'georgia', '$2a$10$jGKcviqvwK3RqFy/kmUvfe3ofLmHU2HiYQw1G0uWjh.8ItYqZB7G.', 'student', NULL),
	(24, 'Iliana', 'papanikou', 'female', '6945611212', 'Iliana', 'iliana', '$2a$10$kaBhe10ytWP.RhUxuYwgbe3x1cSG6/R0TUe.MsoMZf77BPAHwJyyi', 'student', NULL);
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
