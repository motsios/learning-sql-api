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

-- Dumping structure for table diplwmatiki.books
DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `idbook` int(12) NOT NULL,
  `title` varchar(22) COLLATE utf8_bin NOT NULL,
  `releasedDate` datetime NOT NULL,
  `idwriter` int(12) DEFAULT NULL,
  PRIMARY KEY (`idbook`),
  KEY `idwriter` (`idwriter`),
  CONSTRAINT `idwriter` FOREIGN KEY (`idwriter`) REFERENCES `writers` (`idwriter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.books: ~0 rows (approximately)
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
REPLACE INTO `books` (`idbook`, `title`, `releasedDate`, `idwriter`) VALUES
	(1, 'La la land', '2020-03-03 00:00:00', 2),
	(2, 'Tommorow', '1994-03-03 00:00:00', NULL),
	(3, 'The day after Tommorow', '1992-12-12 00:00:00', 1),
	(4, 'Friends With Benefits', '2001-06-12 00:00:00', 6),
	(5, 'Alone', '1993-11-10 00:00:00', 6),
	(6, 'The lords of the ring', '1998-06-03 00:00:00', 7),
	(7, 'Warm Up', '1994-03-01 00:00:00', 6);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.excersice_tables
DROP TABLE IF EXISTS `excersice_tables`;
CREATE TABLE IF NOT EXISTS `excersice_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.excersice_tables: ~3 rows (approximately)
/*!40000 ALTER TABLE `excersice_tables` DISABLE KEYS */;
REPLACE INTO `excersice_tables` (`id`, `table_name`) VALUES
	(116, 'asdsad'),
	(166, 'players'),
	(167, 'location'),
	(172, 'writers'),
	(173, 'books');
/*!40000 ALTER TABLE `excersice_tables` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.fill_fields_questions
DROP TABLE IF EXISTS `fill_fields_questions`;
CREATE TABLE IF NOT EXISTS `fill_fields_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fill_field_question` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `hideWord` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.fill_fields_questions: ~31 rows (approximately)
/*!40000 ALTER TABLE `fill_fields_questions` DISABLE KEYS */;
REPLACE INTO `fill_fields_questions` (`id`, `question`, `fill_field_question`, `hideWord`) VALUES
	(1, 'Εισάγετε τη δήλωση που λείπει για να λάβετε όλες τις στήλες από τον πίνακα Customers.', 'SELECT * FROM Customers', 'SELECT,*'),
	(2, 'Γράψτε μια δήλωση που θα επιλέξει τη στήλη City από τον πίνακα Customers.', 'SELECT City FROM Customers', 'SELECT,City,FROM'),
	(15, 'Επιλέξτε όλες τις διαφορετικές τιμές από τη στήλη Country στον πίνακα Customers.', 'SELECT DISTINCT Country FROM Customers;', 'SELECT,DISTINCT'),
	(16, 'Επιλέξτε όλες τις εγγραφές όπου η στήλη City έχει την τιμή \'Berlin\'.', 'SELECT * FROM Customers WHERE City = \'Berlin\'', 'WHERE,City,\'Berlin\''),
	(17, 'Χρησιμοποιήστε τη λέξη-κλειδί NOT για να επιλέξετε όλες τις εγγραφές όπου η στήλη City ΔΕΝ είναι \'Berlin\'.', 'SELECT * FROM Customers WHERE NOT City =  \'Berlin\'', 'WHERE,NOT,City,\'Berlin\''),
	(18, 'Επιλέξτε όλες τις εγγραφές όπου η στήλη CustomerID έχει την τιμή 32.', 'SELECT * FROM Customers WHERE CustomerID = 32', 'WHERE,=,32'),
	(19, 'Επιλέξτε όλες τις εγγραφές από τον πίνακαCustomers, ταξινομήστε το αποτέλεσμα που αντιστρέφεται αλφαβητικά από τη στήλη City.', 'SELECT * FROM Customers ORDER BY City DESC', 'ORDER BY,City,DESC'),
	(20, 'Εισαγάγετε μια νέα εγγραφή στον πίνακα Customers.', 'INSERT INTO Customers (CustomerName ) VALUES (\'Hekkan Burger\')', 'INSERT INTO,(,),VALUES,(,)'),
	(21, 'Επιλέξτε όλες τις εγγραφές από τους Customers όπου η στήλη PostalCode ΔΕΝ είναι κενή', 'SELECT * FROM Customers WHERE PostalCode IS NOT NULL', 'PostalCode,IS,NOT,NULL'),
	(22, 'Ορίστε την τιμή των στηλών City σε \'Oslo\', αλλά μόνο εκείνες όπου η στήλη Countryέχει την τιμή "Norway".', 'UPDATE Customers SET City = \'Oslo\' WHERE Country=\'Norway\';', 'UPDATE,SET,WHERE'),
	(23, 'Διαγράψτε όλες τις εγγραφές από τον πίνακα Customers.', 'DELETE FROM Customers', 'DELETE,FROM'),
	(24, 'Χρησιμοποιήστε μια συνάρτηση SQL για να επιλέξετε την εγγραφή με την υψηλότερη Price της στήλης Products.', 'SELECT MAX(Price) FROM Products;', 'MAX(Price)'),
	(25, 'Χρησιμοποιήστε τη συνάρτηση MIN για να επιλέξετε την εγγραφή με τη μικρότερη Price στη στήλη Products.', 'SELECT MIN(Price) FROM Products;', 'MIN(Price)'),
	(26, 'Χρησιμοποιήστε μια συνάρτηση SQL για να υπολογίσετε το άθροισμα όλων των τιμών της στήλης Price στον πίνακα Products.', 'SELECT SUM(Price) FROM Products;', 'SUM(Price)'),
	(27, 'Επιλέξτε όλες τις εγγραφές όπου η τιμή της στήλης City τελειώνει με το γράμμα "a".', 'SELECT * FROM Customers WHERE City LIKE \'%a\'', 'WHERE,City,LIKE,\'%a\''),
	(28, 'Επιλέξτε όλες τις εγγραφές όπου η τιμή της στήλης City ξεκινά με το γράμμα "a" και τελειώνει με το γράμμα "b".', 'SELECT * FROM Customers WHERE City LIKE \'a%b\'', 'WHERE,City,LIKE ,\'a%b\''),
	(29, 'Επιλέξτε όλες τις εγγραφές όπου το πρώτο γράμμα της πόλης είναι "a" ή "c" ή "s".', 'SELECT * FROM Customers WHERE City LIKE \'[acs]%\'', '[acs]'),
	(30, 'Επιλέξτε όλες τις εγγραφές όπου το πρώτο γράμμα της στήλης City ξεκινά με οτιδήποτε από "a" έως "f".', 'SELECT * FROM Customers WHERE City LIKE \'[a-f]%\'', '[a-f]'),
	(31, 'Χρησιμοποιήστε τον τελεστή IN για να επιλέξετε όλες τις εγγραφές όπου η στήλη Country ΔΕΝ είναι "Norway" και ΔΕΝ "France".', 'SELECT * FROM Customers WHERE Country NOT IN (\'Norway\', \'France\');', 'WHERE,Country,NOT,IN'),
	(32, 'Χρησιμοποιήστε τον τελεστή IN για να επιλέξετε όλες τις εγγραφές όπου η στήλη Country είναι είτε "Norway" είτε "France".', 'SELECT * FROM Customers WHERE Country IN (\'Norway\', \'France\' )', 'WHERE,Country,IN,(\'Norway\',)'),
	(33, 'Χρησιμοποιήστε τον τελεστή BETWEEN για να επιλέξετε όλες τις εγγραφές όπου η τιμή της στήλης Price είναι μεταξύ 10 και 20.', 'SELECT * FROM Products WHERE Price BETWEEN 10 AND 20', 'BETWEEN,10,AND,20'),
	(34, 'Χρησιμοποιήστε τον χειριστή BETWEEN για να επιλέξετε όλες τις εγγραφές όπου η τιμή της στήλης Price ΔΕΝ είναι μεταξύ 10 και 20.', 'SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20', 'NOT,BETWEEN'),
	(35, 'Κατά την εμφάνιση του πίνακα Customers, δημιουργήστε ένα ALIAS της στήλης PostalCode, η στήλη θα πρέπει να ονομάζεται Pno.', 'SELECT CustomerName,Address,PostalCode AS Pno FROM Customers;', 'AS,Pno'),
	(36, 'Εισαγάγετε τα μέρη που λείπουν στον όρο JOIN για να ενωθείτε με τους δύο πίνακες Orders και Customers, χρησιμοποιώντας το πεδίο CustomerID και στους δύο πίνακες ως σχέση μεταξύ των δύο πινάκων.', 'SELECT * FROM Orders LEFT JOIN Customers ON Orders.CustomerID=Customers.CustomerID', 'ON,Orders.CustomerID,Customers.CustomerID'),
	(37, 'Επιλέξτε τη σωστή ρήτρα JOIN για να επιλέξετε όλες τις εγγραφές από τους δύο πίνακες όπου υπάρχει αντιστοιχία και στους δύο πίνακες.', 'SELECT * FROM Orders INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;', 'INNER JOIN,Customers'),
	(38, 'Επιλέξτε τη σωστή ρήτρα JOIN για να επιλέξετε όλες τις εγγραφές από τον πίνακα Customers συν όλους τους αγώνες στον πίνακα Orders.', 'SELECT * FROM Orders RIGHT JOIN Customers ON Orders.CustomerID=Customers.CustomerID;', 'RIGHT JOIN,Customers'),
	(39, 'Αναφέρετε τον αριθμό των Customers σε κάθε Country.', 'SELECT COUNT (CustomerID),Country FROM Customers GROUP BY Country', 'COUNT,GROUP BY,Country'),
	(40, 'Αναφέρετε πρώτα τον αριθμό των Customers σε κάθε Country, κατά σειρά με τους περισσότερους Customers.', 'SELECT COUNT (CustomerID),Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC', 'COUNT,GROUP BY,Country,COUNT(CustomerID),DESC'),
	(41, 'Κατά την εμφάνιση του πίνακα Customers, δημιουργήστε ένα ALIAS της στήλης PostalCode, η στήλη θα πρέπει να ονομάζεται Pno.', 'SELECT CustomerName,Address,PostalCode AS Pno FROM Customers;', 'AS Pno'),
	(43, 'Εμφάνισε όλα τα δεδομένα του πίνακα Scores', 'SELECT * FROM Scores', 'SELECT,FROM'),
	(44, 'Διαγράψτε από τον πίνακα users όσες εγγραφές έχουν id μεγαλύτερο του 5', 'DELETE FROM users WHERE id>5', 'DELETE,FROM,>');
/*!40000 ALTER TABLE `fill_fields_questions` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.location
DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `idlocation` int(12) NOT NULL,
  `address` varchar(22) COLLATE utf8_bin NOT NULL,
  `city` varchar(22) COLLATE utf8_bin NOT NULL,
  `player_id` int(12) DEFAULT NULL,
  PRIMARY KEY (`idlocation`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.location: ~8 rows (approximately)
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
REPLACE INTO `location` (`idlocation`, `address`, `city`, `player_id`) VALUES
	(1, 'antwni samaraki 16', 'ioannina', 4),
	(2, 'euergetwn 8', 'ioannina', 5),
	(3, 'akragantos 18a', 'preveza', 6),
	(4, 'euergetwn 16', 'ioannina', 6),
	(5, 'akragantos 22', 'preveza', 7),
	(7, 'papagewrgiou 16', 'ioannina', 1),
	(8, 'mabili 22', 'ioannina', 6),
	(9, 'katsimixa 23', 'larisa', NULL),
	(10, 'palermou 19', 'trikala', NULL);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(12) NOT NULL,
  `name` varchar(22) COLLATE utf8_bin NOT NULL,
  `surname` varchar(22) COLLATE utf8_bin NOT NULL,
  `score` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.players: ~11 rows (approximately)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
REPLACE INTO `players` (`id`, `name`, `surname`, `score`) VALUES
	(1, 'dimitris', 'motsios', '100'),
	(2, 'georgia', 'pappa', '85'),
	(3, 'dimitra', 'motsiou', '83'),
	(4, 'stefanos', 'pappas', '88'),
	(5, 'iliana', 'kakkou', '36'),
	(6, 'stefania', 'papathanasiou', '93'),
	(7, 'kostas', 'pappas', '78'),
	(8, 'kostas', 'motsios', '88'),
	(9, 'nikos', 'motsios', '100'),
	(10, 'thanasis', 'motsios', '88'),
	(11, 'dimitra', 'pappathanasiou', '100'),
	(12, 'georgia', 'liakou', '100');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.score_table
DROP TABLE IF EXISTS `score_table`;
CREATE TABLE IF NOT EXISTS `score_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `time` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `category` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `difficulty` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id_idx` (`student_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.score_table: ~27 rows (approximately)
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
	(69, 5, 0, '00:00:18', '15 Questions', 'easy', '2021-01-09 13:39:06', '2021-01-09 13:39:06'),
	(70, 5, 36, '00:00:19', '25 Questions', 'hard', '2021-01-09 13:41:18', '2021-01-09 13:41:18'),
	(71, 5, 35, '00:00:17', '15 Questions', 'easy', '2021-01-09 13:42:52', '2021-01-09 13:42:52'),
	(72, 5, 35, '00:00:23', '25 Questions', 'hard', '2021-01-11 19:42:05', '2021-01-11 19:42:05'),
	(73, 22, 72, '00:00:20', '15 Questions', 'hard', '2021-01-12 19:07:19', '2021-01-12 19:07:19'),
	(74, 22, 88, '00:00:30', '25 Questions', 'hard', '2021-01-12 19:08:13', '2021-01-12 19:08:13'),
	(75, 23, 82, '00:00:18', '15 Questions', 'hard', '2021-01-12 19:09:48', '2021-01-12 19:09:48'),
	(76, 23, 45, '00:00:26', '25 Questions', 'hard', '2021-01-12 19:10:34', '2021-01-12 19:10:34'),
	(200, 26, 20, '00:00:19', '15 Questions', 'easy', '2021-03-20 01:11:20', '2021-03-20 01:11:20'),
	(201, 26, 20, '00:00:19', '15 Questions', 'easy', '2021-03-20 01:11:50', '2021-03-20 01:11:50'),
	(202, 26, 29, '00:00:17', '15 Questions', 'easy', '2021-03-20 01:12:23', '2021-03-20 01:12:23'),
	(203, 26, 72, '00:00:35', '25 Questions', 'easy', '2021-03-20 01:13:14', '2021-03-20 01:13:14');
/*!40000 ALTER TABLE `score_table` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.sql_questions
DROP TABLE IF EXISTS `sql_questions`;
CREATE TABLE IF NOT EXISTS `sql_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `a` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `b` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `d` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `correct_answer` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `score` int(11) NOT NULL,
  `difficulty` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.sql_questions: ~60 rows (approximately)
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
	(22, 'Με την SQL, πώς επιλέγετε μια στήλη με το όνομα "FirstName" από έναν πίνακα με το όνομα "Persons";', 'SELECT FirstName FROM Persons  ', 'SELECT Persons.FirstName', 'EXTRACT FirstName FROM Persons', 'SELECT *.Persons', 'a', 5, 'easy'),
	(23, 'Με την SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα Persons όπου η τιμή της στήλης "FirstName" είναι "Peter";', 'SELECT [all] FROM Persons WHERE FirstName LIKE \'Peter\'  ', 'SELECT * FROM Persons WHERE FirstName=\'Peter\'  ', 'SELECT [all] FROM Persons WHERE FirstName=\'Peter\'', 'SELECT * FROM Persons WHERE FirstName<>\'Peter\'', 'b', 5, 'easy'),
	(24, 'Με την SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα Persons όπου η τιμή της στήλης "FirstName" ξεκινά με "a";', 'SELECT * FROM Persons WHERE FirstName LIKE \'%a\'  ', 'SELECT * FROM Persons WHERE FirstName=\'%a%\'', 'SELECT * FROM Persons WHERE FirstName=\'a\'', 'SELECT * FROM Persons WHERE FirstName LIKE \'a%\'  ', 'd', 5, 'easy'),
	(25, 'Ο τελεστής OR εμφανίζει μια εγγραφή εάν ΚΑΝΕΤΕ οι καταχωρισμένες συνθήκες είναι αληθείς Ο τελεστής AND εμφανίζει μια εγγραφή εάν ΟΛΕΣ οι αναφερόμενες συνθήκες είναι αληθείς', 'False    ', 'True  ', '.', '.', 'b', 5, 'easy'),
	(26, 'Με την SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα "Persons" όπου το "FirstName" είναι "Peter" και το "LastName" είναι "Jackson";', 'SELECT * FROM Persons WHERE FirstName=\'Peter\' AND LastName=\'Jackson\'  ', 'SELECT * FROM Persons WHERE FirstName<>\'Peter\' AND LastName<>\'Jackson\'', 'SELECT FirstName=\'Peter\', LastName=\'Jackson\' FROM Persons', 'SELECT * FROM Persons WHERE LastName>\'Hansen\' AND LastName<\'Pettersen\'  ', 'a', 5, 'easy'),
	(27, 'Με την SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα "Persons" όπου το "LastName" βρίσκεται αλφαβητικά μεταξύ (και περιλαμβάνει) "Hansen" και "Pettersen";', 'SELECT * FROM Persons WHERE LastName>\'Hansen\' AND LastName<\'Pettersen\'  ', 'SELECT * FROM Persons WHERE LastName BETWEEN \'Hansen\' AND \'Pettersen\'  ', 'SELECT LastName>\'Hansen\' AND LastName<\'Pettersen\' FROM Persons', 'SELECT FirstName=\'Peter\', LastName=\'Jackson\' FROM Persons', 'b', 5, 'easy'),
	(28, 'Ποια δήλωση SQL χρησιμοποιείται για την επιστροφή μόνο διαφορετικών τιμών;', 'SELECT DIFFERENT  ', 'SELECT UNIQUE', 'SELECT DISTINCT  ', 'SELECT * FROM Persons WHERE LastName BETWEEN \'Hansen\' AND \'Pettersen\'  ', 'c', 5, 'easy'),
	(29, 'Ποια λέξη-κλειδί SQL χρησιμοποιείται για την ταξινόμηση του συνόλου αποτελεσμάτων;', 'SORT  ', 'ORDER BY  ', 'ORDER', 'SORT BY', 'b', 5, 'easy'),
	(30, 'Με την SQL, πώς μπορείτε να επιστρέψετε όλες τις εγγραφές από έναν πίνακα με το όνομα Persons ταξινομημένο κατά φθίνουσα κατά "FirstName";', 'SELECT * FROM Persons SORT \'FirstName\' DESC  ', 'SELECT * FROM Persons SORT BY \'FirstName\' DESC', 'SELECT * FROM Persons ORDER BY FirstName DESC  ', 'SELECT * FROM Persons ORDER FirstName DESC', 'c', 5, 'easy'),
	(31, 'Με την SQL, πώς μπορείτε να εισαγάγετε μια νέα εγγραφή στον πίνακα Persons;', 'INSERT VALUES (\'Jimmy\', \'Jackson\') INTO Persons', 'INSERT (\'Jimmy\', \'Jackson\') INTO Persons', 'INSERT INTO Persons VALUES (\'Jimmy\', \'Jackson\')  ', 'INSERT (\'Olsen\') INTO Persons (LastName)', 'c', 5, 'easy'),
	(32, 'Με την SQL, πώς μπορείτε να εισαγάγετε το "Olsen" ως "LastName" στον πίνακα "Persons";', 'INSERT INTO Persons (LastName) VALUES (\'Olsen\')  ', 'INSERT (\'Olsen\') INTO Persons (LastName)', 'INSERT INTO Persons (\'Olsen\') INTO LastName', 'INSERT (\'Jimmy\', \'Jackson\') INTO Persons', 'a', 5, 'easy'),
	(33, 'Πώς μπορείτε να αλλάξετε το "Hansen" σε "Nilsen" στη στήλη "LastName" στον πίνακα Persons;', 'MODIFY Persons SET LastName=\'Nilsen\' WHERE LastName=\'Hansen\'  ', 'UPDATE Persons SET LastName=\'Nilsen\' WHERE LastName=\'Hansen\'  ', 'MODIFY Persons SET LastName=\'Hansen\' INTO LastName=\'Nilsen', 'UPDATE Persons SET LastName=\'Hansen\' INTO LastName=\'Nilsen\'', 'b', 12, 'hard'),
	(34, 'Με την SQL, πώς μπορείτε να διαγράψετε τις εγγραφές όπου το "FirstName" είναι "Peter" στον πίνακα Persons;', 'DELETE ROW FirstName=\'Peter\' FROM Persons', 'DELETE FirstName=\'Peter\' FROM Persons', 'DELETE FROM Persons WHERE FirstName = \'Peter\'  ', '.', 'c', 11, 'hard'),
	(35, 'Με την SQL, πώς μπορείτε να επιστρέψετε τον αριθμό των εγγραφών στον πίνακα Persons;', 'SELECT NO(*) FROM Persons', 'SELECT COUNT(*) FROM Persons  ', 'SELECT LEN(*) FROM Persons', 'SELECT COLUMNS(*) FROM Persons', 'b', 20, 'hard'),
	(36, 'Ποιος είναι ο πιο κοινός τύπος συμμετοχής;', 'JOINED', 'INSIDE JOIN', 'INNER JOIN  ', 'JOINED TABLE', 'c', 11, 'hard'),
	(37, 'Ποιος χειριστής χρησιμοποιείται για την επιλογή τιμών εντός ενός εύρους;', 'WITHIN', 'BETWEEN    ', 'RANGE', 'JOINED', 'b', 11, 'hard'),
	(38, 'Ποιος χειριστής χρησιμοποιείται για την επιλογή τιμών εντός ενός εύρους;', 'WITHIN', 'BETWEEN    ', 'RANGE', 'JOINED TABLE', 'b', 11, 'hard'),
	(39, 'Ο περιορισμός NOT NULL επιβάλλει μια στήλη για να μην δέχεται τιμές NULL.', 'True', 'False', '.', '.', 'b', 11, 'hard'),
	(40, 'Ποιος χειριστής χρησιμοποιείται για την αναζήτηση ενός συγκεκριμένου μοτίβου σε μια στήλη;', 'FROM    ', 'GET', 'LIKE    ', 'RANGE', 'c', 11, 'hard'),
	(41, 'Ποιος είναι ο πιο κοινός τύπος συμμετοχής;', 'JOINED', 'INSIDE JOIN', 'INNER JOIN  ', 'JOINED TABLE', 'c', 11, 'hard'),
	(42, 'Πώς μπορείτε να προσθέσετε μια σειρά χρησιμοποιώντας SQL σε μια βάση δεδομένων με ποιο από τα παρακάτω;', 'ADD', 'CREATE', 'INSERT', 'MAKE', 'c', 5, 'easy'),
	(43, 'Η εντολή για την κατάργηση σειρών από τον πίνακα "CUSTOMER" είναι:', 'REMOVE FROM CUSTOMER ...', 'DROP FROM CUSTOMER ...', 'DELETE FROM CUSTOMER WHERE ...', 'UPDATE FROM CUSTOMER ...', 'c', 5, 'easy'),
	(44, 'Η ρήτρα SQL WHERE:', 'περιορίζει τα δεδομένα της στήλης που επιστρέφονται.', 'περιορίζει τα δεδομένα γραμμής που επιστρέφονται..', 'Α και Β σωστά', 'Ούτε το Α ούτε το Β σωστά', 'b', 10, 'hard'),
	(45, 'Ποιο από τα παρακάτω είναι ο αρχικός σκοπός του SQL;', 'Για να καθορίσετε τη σύνταξη και τη σημασιολογία της γλώσσας ορισμού δεδομένων SQL', 'Για να καθορίσετε τη σύνταξη και τη σημασιολογία της γλώσσας χειρισμού SQL', 'Για να ορίσετε τις δομές δεδομένων', 'Ολα τα παραπανω.', 'd', 10, 'hard'),
	(46, 'Η wildcard σε μια ρήτρα WHERE είναι χρήσιμη πότε;', 'Απαιτείται ακριβής αντιστοίχιση σε μια δήλωση SELECT.', 'Δεν είναι δυνατή η ακριβής αντιστοίχιση σε μια δήλωση SELECT.', 'Απαιτείται ακριβής αντιστοίχιση σε μια δήλωση CREATE.', 'Δεν είναι δυνατή η ακριβής αντιστοίχιση σε μια δήλωση CREATE.', 'b', 7, 'easy'),
	(47, 'Μια πρόταση από τις παρακάτω είναι σωστή.', 'Ένας εικονικός πίνακας στον οποίο μπορείτε να έχετε πρόσβαση μέσω εντολών SQL', 'Ένας εικονικός πίνακας στον οποίο δεν είναι δυνατή η πρόσβαση μέσω εντολών SQL', 'Ένας βασικός πίνακας στον οποίο μπορείτε να έχετε πρόσβαση μέσω εντολών SQL', 'Ένας βασικός πίνακας στον οποίο δεν είναι δυνατή η πρόσβαση μέσω εντολών SQL', 'a', 5, 'easy'),
	(48, 'Η εντολή για την εξάλειψη ενός πίνακα από μια βάση δεδομένων είναι:', 'REMOVE TABLE CUSTOMER;', 'DROP TABLE CUSTOMER;', 'DELETE TABLE CUSTOMER;', 'UPDATE TABLE CUSTOMER;', 'b', 5, 'easy'),
	(49, 'ON UPDATE CASCADE εξασφαλίζει ποιο από τα παρακάτω;', 'Normalization', 'Data Integrity', 'Materialized Views', 'All of the above.', 'b', 5, 'easy'),
	(50, 'ON UPDATE CASCADE εξασφαλίζει ποιο από τα παρακάτω;', 'DDL', 'DML', 'HTML', 'XML', 'a', 7, 'hard'),
	(51, 'Ποιο από τα παρακάτω είναι έγκυρο SQL για ευρετήριο;', 'CREATE INDEX ID;', 'CHANGE INDEX ID;', 'ADD INDEX ID;', 'REMOVE INDEX ID;', 'a', 5, 'hard'),
	(52, 'Η λέξη-κλειδί SQL ________ χρησιμοποιείται με χαρακτήρες μπαλαντέρ.', 'LIKE only', 'IN only', 'NOT IN only', 'IN and NOT IN', 'a', 5, 'hard'),
	(53, 'Ποιο από τα παρακάτω είναι η σωστή σειρά λέξεων-κλειδιών για δηλώσεις SQL SELECT;', 'SELECT, FROM, WHERE', 'FROM, WHERE, SELECT', 'WHERE, FROM,SELECT', 'SELECT,WHERE,FROM', 'a', 5, 'hard'),
	(54, 'Το αποτέλεσμα μιας δήλωσης SQL SELECT είναι ένα α(n) ________.', 'report', 'form', 'file', 'table', 'd', 5, 'easy'),
	(55, 'Η λέξη-κλειδί SQL  BETWEEN  χρησιμοποιείται:', 'για διαστήματα', 'για να περιορίσετε τις εμφανιζόμενες στήλες.', 'ως wildcard.', 'Κανένα από τα παραπάνω δεν είναι σωστό.', 'a', 7, 'hard'),
	(56, 'Το ________ υιοθετήθηκε ως εθνικό πρότυπο από την ANSI το 1992.', 'Oracle', 'SQL', 'Microsoft Access', 'DBase', 'b', 5, 'easy'),
	(57, 'Ποιο από τα παρακάτω πρέπει να λάβετε υπόψη όταν δημιουργείτε έναν πίνακα σε SQL;', 'Data types', 'Primary keys', 'Default values', 'All of the above.', 'd', 7, 'hard'),
	(58, 'Ποια από τις παρακάτω σειρές ταξινομεί στο SQL;', 'SORT BY', 'ALIGN BY', 'ORDER BY', 'GROUP BY', 'c', 7, 'hard'),
	(59, 'Για να ορίσετε ποιες στήλες πρέπει να εμφανίζονται σε μια δήλωση SQL SELECT:', 'Χρησιμοποιήστε το FROM για να ονομάσετε τους πίνακες (ες) προέλευσης και να απαριθμήσετε τις στήλες που θα εμφανίζονται μετά την επιλογή.', 'χρησιμοποιήστε το USING για να ονομάσετε τους πίνακες (ες) προέλευσης και να αναφέρετε τις στήλες που θα εμφανίζονται μετά την επιλογή.', 'Χρησιμοποιήστε το SELECT για να ονομάσετε τους πίνακες προέλευσης και να αναφέρετε τις στήλες που θα εμφανίζονται μετά τη χρήση.', 'Χρησιμοποιήστε το USING για να ονομάσετε τους πίνακες (ες) προέλευσης και να αναφέρετε τις στήλες που θα εμφανίζονται μετά το WHERE.', 'a', 7, 'hard'),
	(60, 'Το SQL μπορεί να χρησιμοποιηθεί για:', 'δημιουργία μόνο δομές βάσεων δεδομένων.', 'μόνο δεδομένα βάσης δεδομένων ερωτήματος.', 'τροποποίηση δεδομένων βάσης δεδομένων μόνο.', 'Όλα τα παραπάνω μπορούν να γίνουν με SQL.', 'd', 9, 'hard'),
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
  `sql_query` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `hideWord` varchar(200) COLLATE utf8_bin NOT NULL,
  `table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `table_id_idx` (`table_id`),
  CONSTRAINT `table_id` FOREIGN KEY (`table_id`) REFERENCES `excersice_tables` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=769 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.sql_random_queries: ~30 rows (approximately)
/*!40000 ALTER TABLE `sql_random_queries` DISABLE KEYS */;
REPLACE INTO `sql_random_queries` (`id`, `sql_query`, `hideWord`, `table_id`) VALUES
	(709, 'SELECT * FROM players', '*,players', 166),
	(710, 'SELECT id, name FROM players', 'id,name', 166),
	(711, 'SELECT DISTINCT surname FROM players', 'DISTINCT', 166),
	(712, 'SELECT COUNT(score) FROM players', 'COUNT,FROM', 166),
	(713, 'SELECT COUNT(DISTINCT surname) FROM players', 'DISTINCT', 166),
	(714, 'SELECT * FROM players WHERE id=7', 'WHERE,id', 166),
	(715, 'SELECT * FROM players WHERE id IN ("1","4")', 'IN', 166),
	(716, 'SELECT * FROM players WHERE id BETWEEN 2 AND 7', 'BETWEEN,AND', 166),
	(717, 'SELECT * FROM players ORDER BY score', 'ORDER BY', 166),
	(718, 'SELECT * FROM players ORDER BY surname DESC', 'ORDER BY,DESC', 166),
	(719, 'SELECT * FROM players ORDER BY surname ASC, score DESC', 'ORDER BY,ASC,DESC', 166),
	(720, 'SELECT * FROM players LIMIT 3', 'LIMIT', 166),
	(721, 'SELECT MIN(id) FROM players', 'MIN', 166),
	(722, 'SELECT MAX(id) FROM players', 'MAX', 166),
	(723, 'SELECT COUNT(surname), score FROM players GROUP BY score', 'COUNT,GROUP BY', 166),
	(724, 'SELECT COUNT(id), name FROM players GROUP BY name ORDER BY COUNT(id) DESC', 'ORDER BY,DESC', 166),
	(725, 'SELECT COUNT(surname) FROM players GROUP BY score HAVING COUNT(surname) >3', 'GROUP BY,HAVING COUNT', 166),
	(726, 'SELECT SUM(id) FROM players', 'SUM', 166),
	(727, 'SELECT AVG(id) FROM players', 'AVG', 166),
	(728, 'SELECT * FROM players WHERE score IS NULL', 'IS NULL', 166),
	(729, 'SELECT players.id, players.name, location.city, location.idlocation FROM players, location WHERE players.id=location.player_id', 'players,id,=', 167),
	(730, 'SELECT players.id, players.name, location.city FROM players INNER JOIN location ON players.id=location.player_id', 'INNER,JOIN', 167),
	(731, 'SELECT players.name, location.player_id FROM players LEFT JOIN location ON players.id=location.player_id ORDER BY players.name', 'LEFT,ORDER BY', 167),
	(732, 'SELECT players.id, location.city, location.idlocation FROM players RIGHT JOIN location ON players.id=location.player_id ORDER BY players.id DESC', 'RIGHT,DESC', 167),
	(733, 'SELECT players.id, players.name, location.city FROM players INNER JOIN location ON players.id=location.player_id WHERE players.id>3', 'WHERE,>', 167),
	(734, 'SELECT * FROM location CROSS JOIN players', 'CROSS', 167),
	(735, 'SELECT id FROM players UNION SELECT player_id FROM location', 'UNION', 167),
	(736, 'SELECT surname FROM players WHERE id = ANY ( SELECT player_id FROM location WHERE player_id>3 )', 'ANY', 167),
	(737, 'SELECT id FROM players WHERE id = ALL ( SELECT player_id FROM location WHERE player_id=3 )', 'ALL', 167),
	(738, 'SELECT score FROM players WHERE id IN ( SELECT player_id FROM location WHERE player_id>2 )', 'IN', 167),
	(739, 'SELECT * FROM writers', '*,writers', 172),
	(740, 'SELECT idwriter, name FROM writers', 'idwriter,name', 172),
	(741, 'SELECT DISTINCT surname FROM writers', 'DISTINCT', 172),
	(742, 'SELECT COUNT(age) FROM writers', 'COUNT,FROM', 172),
	(743, 'SELECT COUNT(DISTINCT surname) FROM writers', 'DISTINCT', 172),
	(744, 'SELECT * FROM writers WHERE idwriter=7', 'WHERE,idwriter', 172),
	(745, 'SELECT * FROM writers WHERE idwriter IN ("1","4")', 'IN', 172),
	(746, 'SELECT * FROM writers WHERE idwriter BETWEEN 2 AND 7', 'BETWEEN,AND', 172),
	(747, 'SELECT * FROM writers ORDER BY age', 'ORDER BY', 172),
	(748, 'SELECT * FROM writers ORDER BY surname DESC', 'ORDER BY,DESC', 172),
	(749, 'SELECT * FROM writers ORDER BY surname ASC, age DESC', 'ORDER BY,ASC,DESC', 172),
	(750, 'SELECT * FROM writers LIMIT 3', 'LIMIT', 172),
	(751, 'SELECT MIN(idwriter) FROM writers', 'MIN', 172),
	(752, 'SELECT MAX(idwriter) FROM writers', 'MAX', 172),
	(753, 'SELECT COUNT(surname), age FROM writers GROUP BY age', 'COUNT,GROUP BY', 172),
	(754, 'SELECT COUNT(idwriter), name FROM writers GROUP BY name ORDER BY COUNT(idwriter) DESC', 'ORDER BY,DESC', 172),
	(755, 'SELECT COUNT(surname) FROM writers GROUP BY age HAVING COUNT(surname) >3', 'GROUP BY,HAVING COUNT', 172),
	(756, 'SELECT SUM(idwriter) FROM writers', 'SUM', 172),
	(757, 'SELECT AVG(idwriter) FROM writers', 'AVG', 172),
	(758, 'SELECT * FROM writers WHERE age IS NULL', 'IS NULL', 172),
	(759, 'SELECT writers.idwriter, writers.name, books.title, books.releasedDate FROM writers, books WHERE writers.idwriter=books.idwriter', 'writers,idwriter,=', 173),
	(760, 'SELECT writers.idwriter, writers.name, books.title FROM writers INNER JOIN books ON writers.idwriter=books.idwriter', 'INNER,JOIN', 173),
	(761, 'SELECT writers.name, books.idwriter FROM writers LEFT JOIN books ON writers.idwriter=books.idwriter ORDER BY writers.name', 'LEFT,ORDER BY', 173),
	(762, 'SELECT writers.idwriter, books.title, books.releasedDate FROM writers RIGHT JOIN books ON writers.idwriter=books.idwriter ORDER BY writers.idwriter DESC', 'RIGHT,DESC', 173),
	(763, 'SELECT writers.idwriter, writers.name, books.title FROM writers INNER JOIN books ON writers.idwriter=books.idwriter WHERE writers.idwriter>3', 'WHERE,>', 173),
	(764, 'SELECT * FROM books CROSS JOIN writers', 'CROSS', 173),
	(765, 'SELECT idwriter FROM writers UNION SELECT idwriter FROM books', 'UNION', 173),
	(766, 'SELECT age FROM writers WHERE idwriter = ANY ( SELECT idwriter FROM books WHERE idwriter>3 )', 'ANY', 173),
	(767, 'SELECT idwriter FROM writers WHERE idwriter = ALL ( SELECT idwriter FROM books WHERE idwriter=3 )', 'ALL', 173),
	(768, 'SELECT surname FROM writers WHERE idwriter IN ( SELECT idwriter FROM books WHERE idwriter>2 )', 'IN', 173);
/*!40000 ALTER TABLE `sql_random_queries` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.success_rate
DROP TABLE IF EXISTS `success_rate`;
CREATE TABLE IF NOT EXISTS `success_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_student` int(11) NOT NULL,
  `rate` varchar(100) COLLATE utf8_bin NOT NULL,
  `time` varchar(100) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_student_idx` (`id_student`),
  CONSTRAINT `id_student` FOREIGN KEY (`id_student`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.success_rate: ~8 rows (approximately)
/*!40000 ALTER TABLE `success_rate` DISABLE KEYS */;
REPLACE INTO `success_rate` (`id`, `id_student`, `rate`, `time`, `table_name`, `created_at`, `updated_at`) VALUES
	(9, 5, 'Σωστές 1 στις 5', '00:00:20', 'players', '2021-02-22 16:30:52', '2021-02-22 16:30:52'),
	(10, 16, 'Σωστές 1 στις 5', '00:00:11', 'okok', '2021-02-22 16:32:11', '2021-02-22 16:32:11'),
	(11, 16, 'Σωστές 3 στις 5', '00:00:21', 'scores', '2021-02-22 16:32:40', '2021-02-22 16:32:40'),
	(44, 5, 'Σωστές 1 στις 10', '00:02:31', 'test20', '2021-03-06 15:02:53', '2021-03-06 15:02:53'),
	(45, 5, 'Σωστές 13 στις 20', '00:02:13', 'table1', '2021-03-08 18:09:57', '2021-03-08 18:09:57'),
	(46, 5, 'Σωστές 2 στις 10', '00:01:45', 'table11', '2021-03-08 18:11:59', '2021-03-08 18:11:59'),
	(47, 5, 'Σωστές 0 στις 10', '00:01:21', 'test33', '2021-03-16 21:50:48', '2021-03-16 21:50:48'),
	(48, 5, 'Σωστές 8 στις 10', '00:01:51', 'location', '2021-03-18 21:58:29', '2021-03-18 21:58:29'),
	(49, 26, 'Σωστές 3 στις 10', '00:00:54', 'location', '2021-03-20 01:14:49', '2021-03-20 01:14:49');
/*!40000 ALTER TABLE `success_rate` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.user_table
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE IF NOT EXISTS `user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sex` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `verification_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.user_table: ~7 rows (approximately)
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
REPLACE INTO `user_table` (`id`, `first_name`, `last_name`, `sex`, `phone`, `email`, `username`, `password`, `role`, `verification_code`) VALUES
	(3, 'dimitris', 'motsios', 'male', '6312546987', 'www.motsios@hotmail.com', 'motsios', '$2a$10$SP3LpvxK6ZJ0NVmDgX9Tb.UWKZAsYBTqcHB1EIaa2LNjgQVnbXT2u', 'teacher', ''),
	(4, 'giorgos', 'pappas', 'male', '6935146987', 'giorgos@gmail.com', 'giorgos', '$2a$10$1X8vht1REou23F.xMl51reymvMVky653wd7ElT5q/JEHGRpuZOFxy', 'teacher', NULL),
	(5, 'kostas', 'kakkos', 'male', '6935123697', 'kostas@gmail.com', 'kostas', '$2a$10$mezTsIwg.Md7Guklprtk6uLrxmIQy4iUfsu5LxD15DutxhIM9yldq', 'student', '4c2b079d-42bf-4d14-b541-cfd688f22f5c'),
	(16, 'dionisis', 'papakwstas', 'male', '6936547892', 'dionisis@gmail.com', 'dioni', '$2a$10$AJQJhxAZVVTDbJwU75qGm.BW9LDld1qvaGy/n7dkU9Jw2j9jDSMbq', 'student', NULL),
	(22, 'aleksis', 'koumasis', 'male', '6932156941', 'aleksis@gmail.com', 'aleksis', '$2a$10$4kT52oOxyPwuXXU6LCSMY.OkC8uZOKrZXX2NXIdb7/6/N5GQuO9u.', 'student', NULL),
	(23, 'georgia', 'kali', 'female', '6932569515', 'georgia@gmail.com', 'georgia', '$2a$10$jGKcviqvwK3RqFy/kmUvfe3ofLmHU2HiYQw1G0uWjh.8ItYqZB7G.', 'student', NULL),
	(24, 'Iliana', 'papanikou', 'female', '6945611212', 'Iliana@gmail.com', 'iliana', '$2a$10$kaBhe10ytWP.RhUxuYwgbe3x1cSG6/R0TUe.MsoMZf77BPAHwJyyi', 'student', NULL),
	(26, 'George', 'Andreou', 'male', '6354567891', 'George', 'giorgos93', '$2a$10$m9YdINIylv4V6Rs0NSim3uJJhgGlPb89rRfbMd9SsRXFZU9T14xKa', 'student', NULL);
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.writers
DROP TABLE IF EXISTS `writers`;
CREATE TABLE IF NOT EXISTS `writers` (
  `idwriter` int(12) NOT NULL,
  `name` varchar(22) COLLATE utf8_bin NOT NULL,
  `surname` varchar(22) COLLATE utf8_bin NOT NULL,
  `age` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idwriter`),
  KEY `idwriter` (`idwriter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.writers: ~0 rows (approximately)
/*!40000 ALTER TABLE `writers` DISABLE KEYS */;
REPLACE INTO `writers` (`idwriter`, `name`, `surname`, `age`) VALUES
	(1, 'Dimitris', 'Motsios', '22'),
	(2, 'Georgia', 'Pappandreou', '36'),
	(3, 'Kostas', 'Mixas', '44'),
	(4, 'Ilianna', 'Pappagewrgiou', '42'),
	(5, 'Eleonora', 'Meleti', '36'),
	(6, 'Xristos', 'Sarris', '36'),
	(7, 'Kostas', 'Pappas', '23'),
	(8, 'Panos', 'Panou', '36');
/*!40000 ALTER TABLE `writers` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
