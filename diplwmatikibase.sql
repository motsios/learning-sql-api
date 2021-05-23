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

-- Dumping structure for table diplwmatiki.actors
DROP TABLE IF EXISTS `actors`;
CREATE TABLE IF NOT EXISTS `actors` (
  `idactor` int(12) NOT NULL,
  `name` varchar(22) COLLATE utf8_bin NOT NULL,
  `surname` varchar(22) COLLATE utf8_bin NOT NULL,
  `address` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idactor`),
  KEY `idactor` (`idactor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.actors: ~13 rows (approximately)
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
REPLACE INTO `actors` (`idactor`, `name`, `surname`, `address`) VALUES
	(1, 'dimitris', 'motsios', 'ad1'),
	(2, 'kostas', 'mixas', 'ad2'),
	(3, 'giannis', 'mixas ', 'ad3'),
	(4, 'ilias', 'pappas', 'ad4'),
	(5, 'panorea', 'pappas', 'ad5'),
	(6, 'ilianna', 'pappas', NULL),
	(7, 'kostas', 'pappas', 'ad6'),
	(8, 'giogos', 'apostolakis', 'as'),
	(11, 'name11', 'surname11', 'ad5'),
	(12, 'name12', 'surname12', NULL),
	(13, 'name12', 'surname12', 'ad5'),
	(14, 'name14', 'surnae14', 'ad5'),
	(15, 'name15', 'surnam15', NULL);
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.books
DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `idbook` int(12) NOT NULL,
  `title` varchar(22) COLLATE utf8_bin NOT NULL,
  `views` int(22) NOT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `writterid` int(12) DEFAULT NULL,
  PRIMARY KEY (`idbook`),
  KEY `writterid` (`writterid`),
  CONSTRAINT `writterid` FOREIGN KEY (`writterid`) REFERENCES `writters` (`idwritter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.books: ~6 rows (approximately)
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
REPLACE INTO `books` (`idbook`, `title`, `views`, `releaseDate`, `writterid`) VALUES
	(1, 'title1', 34, NULL, NULL),
	(2, 'title2', 55, '2001-02-02 00:00:00', 10),
	(3, 'title3', 32, '1999-03-03 00:00:00', 3),
	(4, 'title4', 20, '1999-03-03 00:00:00', 2),
	(5, 'title5', 1, '1665-03-03 00:00:00', 5),
	(6, 'title6', 25, '1995-03-03 00:00:00', NULL),
	(7, 'title7', 12, '1997-02-02 00:00:00', 6);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.cafe
DROP TABLE IF EXISTS `cafe`;
CREATE TABLE IF NOT EXISTS `cafe` (
  `idcafe` int(12) NOT NULL,
  `name_cafe` varchar(22) COLLATE utf8_bin NOT NULL,
  `cafesize` int(50) DEFAULT NULL,
  `coffeeid` int(12) DEFAULT NULL,
  PRIMARY KEY (`idcafe`),
  KEY `coffeeid` (`coffeeid`),
  CONSTRAINT `coffeeid` FOREIGN KEY (`coffeeid`) REFERENCES `coffee` (`idCoffee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.cafe: ~11 rows (approximately)
/*!40000 ALTER TABLE `cafe` DISABLE KEYS */;
REPLACE INTO `cafe` (`idcafe`, `name_cafe`, `cafesize`, `coffeeid`) VALUES
	(1, 'City Stacks Coffee', 150, 5),
	(2, 'The Beanery', 60, 5),
	(3, 'Aroma Mocha', 585, 6),
	(4, 'Cheers Cafe', 120, 8),
	(5, 'The Teabar', 50, 3),
	(6, 'Bistro at the Point', 502, 6),
	(7, 'Flavored Cafeteria', 660, 5),
	(8, 'Heavenly Coffee', 550, NULL),
	(9, 'Love You a Latte', 604, NULL),
	(10, 'Brew Together', NULL, NULL),
	(11, 'Espresso Love', NULL, 6),
	(12, 'Caffeine Machine', NULL, 7);
/*!40000 ALTER TABLE `cafe` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.coffee
DROP TABLE IF EXISTS `coffee`;
CREATE TABLE IF NOT EXISTS `coffee` (
  `idCoffee` int(12) NOT NULL,
  `brand` varchar(22) COLLATE utf8_bin NOT NULL,
  `productiondate` datetime NOT NULL,
  `kg` int(50) DEFAULT NULL,
  PRIMARY KEY (`idCoffee`),
  KEY `idCoffee` (`idCoffee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.coffee: ~11 rows (approximately)
/*!40000 ALTER TABLE `coffee` DISABLE KEYS */;
REPLACE INTO `coffee` (`idCoffee`, `brand`, `productiondate`, `kg`) VALUES
	(1, 'arabica', '1995-05-05 00:00:00', 50),
	(2, 'Arusha', '1995-06-03 00:00:00', 60),
	(3, 'Bergendal', '1999-03-03 00:00:00', 22),
	(4, 'Bernardina', '2005-03-11 00:00:00', 10),
	(5, 'Catuai', '2000-01-02 00:00:00', 60),
	(6, 'K7', '2003-01-05 00:00:00', 30),
	(7, 'Pacas', '2003-03-03 00:00:00', 60),
	(8, 'Pache Colis', '2005-08-08 00:00:00', 50),
	(9, 'Ruiru 11	', '2005-01-02 00:00:00', 50),
	(10, 'Sarchimor', '2000-03-03 00:00:00', 50),
	(11, 'SL34	', '1999-02-02 00:00:00', 50);
/*!40000 ALTER TABLE `coffee` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.excersice_tables
DROP TABLE IF EXISTS `excersice_tables`;
CREATE TABLE IF NOT EXISTS `excersice_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.excersice_tables: ~9 rows (approximately)
/*!40000 ALTER TABLE `excersice_tables` DISABLE KEYS */;
REPLACE INTO `excersice_tables` (`id`, `table_name`) VALUES
	(116, 'asdsad'),
	(201, 'actors'),
	(203, 'movies'),
	(206, 'games'),
	(207, 'gamers'),
	(220, 'coffee'),
	(221, 'cafe'),
	(222, 'writters'),
	(223, 'books');
/*!40000 ALTER TABLE `excersice_tables` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.fill_fields_questions
DROP TABLE IF EXISTS `fill_fields_questions`;
CREATE TABLE IF NOT EXISTS `fill_fields_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fill_field_question` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `hideWord` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.fill_fields_questions: ~31 rows (approximately)
/*!40000 ALTER TABLE `fill_fields_questions` DISABLE KEYS */;
REPLACE INTO `fill_fields_questions` (`id`, `question`, `fill_field_question`, `hideWord`) VALUES
	(1, 'Εισάγετε τη δήλωση που λείπει για να λάβετε όλες τις στήλες από τον πίνακα Customers.', 'SELECT * FROM Customers', 'SELECT,*'),
	(2, 'Γράψτε μια δήλωση που θα επιλέξει τη στήλη City από τον πίνακα Customers.', 'SELECT City FROM Customers', 'SELECT,City,FROM'),
	(15, 'Επιλέξτε όλες τις διαφορετικές τιμές από τη στήλη Country στον πίνακα Customers.', 'SELECT DISTINCT Country FROM Customers;', 'SELECT,DISTINCT'),
	(16, 'Επιλέξτε όλες τις εγγραφές όπου η στήλη City έχει την τιμή \'Berlin\'.', 'SELECT * FROM Customers WHERE City = \'Berlin\'', 'WHERE,City,\'Berlin\''),
	(17, 'Χρησιμοποιήστε τη λέξη-κλειδί NOT για να επιλέξετε όλες τις εγγραφές όπου η στήλη City ΔΕΝ είναι \'Berlin\'.', 'SELECT * FROM Customers WHERE NOT City =  \'Berlin\'', 'WHERE,NOT,City,\'Berlin\''),
	(18, 'Επιλέξτε όλες τις εγγραφές όπου η στήλη CustomerID έχει την τιμή 32.', 'SELECT * FROM Customers WHERE CustomerID = 32', 'WHERE,=,32'),
	(19, 'Επιλέξτε όλες τις εγγραφές από τον πίνακα Customers, ταξινομήστε το αποτέλεσμα που αντιστρέφεται αλφαβητικά από τη στήλη City.', 'SELECT * FROM Customers ORDER BY City DESC', 'ORDER BY,City,DESC'),
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
	(40, 'Αναφέρετε πρώτα τον αριθμό των Customers σε κάθε Country, εμφανίζοντας πάνω-πάνω τους περισσότερους Customers.', 'SELECT COUNT (CustomerID),Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC', 'COUNT,GROUP BY,Country,COUNT(CustomerID),DESC'),
	(41, 'Κατά την εμφάνιση του πίνακα Customers, δημιουργήστε ένα ALIAS της στήλης PostalCode, η στήλη θα πρέπει να ονομάζεται Pno.', 'SELECT CustomerName,Address,PostalCode AS Pno FROM Customers;', 'AS Pno'),
	(43, 'Εμφάνισε όλα τα δεδομένα του πίνακα Scores', 'SELECT * FROM Scores', 'SELECT,FROM'),
	(44, 'Διαγράψτε από τον πίνακα users όσες εγγραφές έχουν id μεγαλύτερο του 5', 'DELETE FROM users WHERE id>5', 'DELETE,FROM,>');
/*!40000 ALTER TABLE `fill_fields_questions` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.gamers
DROP TABLE IF EXISTS `gamers`;
CREATE TABLE IF NOT EXISTS `gamers` (
  `idgamer` int(12) NOT NULL,
  `name` varchar(22) COLLATE utf8_bin NOT NULL,
  `surname` varchar(22) COLLATE utf8_bin NOT NULL,
  `gameid` int(12) DEFAULT NULL,
  PRIMARY KEY (`idgamer`),
  KEY `gameid` (`gameid`),
  CONSTRAINT `gameid` FOREIGN KEY (`gameid`) REFERENCES `games` (`idgame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.gamers: ~8 rows (approximately)
/*!40000 ALTER TABLE `gamers` DISABLE KEYS */;
REPLACE INTO `gamers` (`idgamer`, `name`, `surname`, `gameid`) VALUES
	(1, 'Dimitris', 'Motsios', 2),
	(2, 'Kostas', 'Mixas', NULL),
	(3, 'Ilias', 'Pappas', 4),
	(4, 'Ilianna', 'pappa', 9),
	(5, 'Kostas', 'Kefis', 2),
	(6, 'Dionisis', 'Katsimixas', NULL),
	(7, 'Elpida', 'Koyti', 4),
	(8, 'Makis', 'Kotsampasis', 10),
	(9, 'Elpida', 'Bert', 10);
/*!40000 ALTER TABLE `gamers` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.games
DROP TABLE IF EXISTS `games`;
CREATE TABLE IF NOT EXISTS `games` (
  `idgame` int(12) NOT NULL,
  `title` varchar(22) COLLATE utf8_bin NOT NULL,
  `multiplayer` tinyint(4) DEFAULT NULL,
  `released` datetime DEFAULT NULL,
  PRIMARY KEY (`idgame`),
  KEY `idgame` (`idgame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.games: ~17 rows (approximately)
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
REPLACE INTO `games` (`idgame`, `title`, `multiplayer`, `released`) VALUES
	(1, 'Lol', 1, '2000-02-02 00:00:00'),
	(2, 'Battlefield', 1, '1995-03-03 00:00:00'),
	(3, 'Pro evolution 2010', 0, '2010-01-01 00:00:00'),
	(4, 'Game4', 0, '2000-02-02 00:00:00'),
	(5, 'The last of us', 1, '2000-02-02 00:00:00'),
	(6, 'Amnisia 1', 0, '2000-02-12 00:00:00'),
	(7, 'Amnisia 2', 0, '2005-03-03 00:00:00'),
	(8, 'NBA', 1, '2021-02-02 00:00:00'),
	(9, 'Fifa 2021', 1, '2021-06-11 00:00:00'),
	(10, 'The sims 1', 0, '2000-05-05 00:00:00'),
	(11, 'The sims 2', 0, '2000-02-01 00:00:00'),
	(12, 'The sims 3', 1, '2000-02-01 00:00:00'),
	(13, 'Hearthstone', 1, '2000-02-01 00:00:00'),
	(14, 'Rocket Leage', 1, '2000-02-01 00:00:00'),
	(15, 'Game 2024', 1, NULL),
	(16, 'Game 2029', 0, NULL),
	(17, 'amnisia', 0, '2000-02-01 00:00:00');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.movies
DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `idmovie` int(12) NOT NULL,
  `title` varchar(22) COLLATE utf8_bin NOT NULL,
  `released` datetime DEFAULT NULL,
  `actorid` int(12) DEFAULT NULL,
  PRIMARY KEY (`idmovie`),
  KEY `actorid` (`actorid`),
  CONSTRAINT `actorid` FOREIGN KEY (`actorid`) REFERENCES `actors` (`idactor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.movies: ~6 rows (approximately)
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
REPLACE INTO `movies` (`idmovie`, `title`, `released`, `actorid`) VALUES
	(1, 'title1', '2005-01-01 00:00:00', 2),
	(2, 'title2', '1999-01-05 00:00:00', NULL),
	(3, 'title3', '2336-05-12 00:00:00', 2),
	(4, 'title44', '1996-02-03 00:00:00', 5),
	(5, 'title5', '1236-11-11 00:00:00', 6),
	(7, 'title7', '2003-12-22 00:00:00', 3);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.score_table
DROP TABLE IF EXISTS `score_table`;
CREATE TABLE IF NOT EXISTS `score_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `time` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `category` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `difficulty` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id_idx` (`student_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.score_table: ~40 rows (approximately)
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
	(203, 26, 72, '00:00:35', '25 Questions', 'easy', '2021-03-20 01:13:14', '2021-03-20 01:13:14'),
	(204, 5, 5, '00:00:17', '15 Questions', 'easy', '2021-04-10 19:00:15', '2021-04-10 19:00:15'),
	(205, 5, 65, '00:00:31', '15 Questions', 'hard', '2021-04-11 18:35:27', '2021-04-11 18:35:27'),
	(206, 5, 69, '00:00:39', '15 Questions', 'hard', '2021-04-18 13:17:29', '2021-04-18 13:17:29'),
	(207, 5, 0, '00:00:17', '15 Questions', 'hard', '2021-04-25 15:46:17', '2021-04-25 15:46:17'),
	(208, 5, 0, '00:00:04', '15 Questions', 'easy', '2021-04-26 14:37:17', '2021-04-26 14:37:17'),
	(209, 5, 36, '00:00:17', '15 Questions', 'hard', '2021-04-27 21:46:11', '2021-04-27 21:46:11'),
	(210, 5, 213, '00:06:49', '25 Questions', 'hard', '2021-04-27 21:54:34', '2021-04-27 21:54:34'),
	(211, 5, 17, '00:00:34', '15 Questions', 'hard', '2021-04-28 16:12:43', '2021-04-28 16:12:43'),
	(212, 5, 0, '00:00:00', '25 Questions', 'easy', '2021-04-28 22:02:15', '2021-04-28 22:02:15'),
	(213, 5, 79, '00:00:58', '15 Questions', 'hard', '2021-05-01 16:28:18', '2021-05-01 16:28:18'),
	(214, 22, 30, '00:00:37', '15 Questions', 'easy', '2021-05-10 14:34:52', '2021-05-10 14:34:52'),
	(215, 22, 45, '00:00:59', '25 Questions', 'easy', '2021-05-10 14:48:45', '2021-05-10 14:48:45'),
	(216, 5, 51, '00:00:33', '15 Questions', 'hard', '2021-05-15 18:01:22', '2021-05-15 18:01:22'),
	(217, 28, 15, '00:00:19', '15 Questions', 'easy', '2021-05-19 18:12:12', '2021-05-19 18:12:12');
/*!40000 ALTER TABLE `score_table` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.sql_questions
DROP TABLE IF EXISTS `sql_questions`;
CREATE TABLE IF NOT EXISTS `sql_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `a` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `b` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `c` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `d` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `correct_answer` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `score` int(11) NOT NULL,
  `difficulty` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.sql_questions: ~58 rows (approximately)
/*!40000 ALTER TABLE `sql_questions` DISABLE KEYS */;
REPLACE INTO `sql_questions` (`id`, `question`, `a`, `b`, `c`, `d`, `correct_answer`, `score`, `difficulty`) VALUES
	(4, 'Ποια δήλωση SQL χρησιμοποιείται για τη διαγραφή δεδομένων από μια βάση δεδομένων;', 'DELETE', 'COLAPSE', 'REMOVE', 'REMOVE', 'a', 5, 'easy'),
	(8, 'Ποια δήλωση SQL χρησιμοποιείται για την ενημέρωση δεδομένων σε μια βάση δεδομένων;', 'SAVE AS  ', 'SAVE', 'UPDATE', 'MODIFY', 'c', 5, 'easy'),
	(12, 'Ποια δήλωση SQL χρησιμοποιείται για την εξαγωγή δεδομένων από μια βάση δεδομένων;', 'GET', 'OPEN', 'SELECT    ', 'EXTRACT  ', 'c', 5, 'easy'),
	(13, 'Τι σημαίνει η SQL;', 'Structured Query Language  ', 'Structured Question Language', 'Strong Question Language', 'Strong Question Language', 'a', 5, 'easy'),
	(21, 'Ποια δήλωση SQL χρησιμοποιείται για την εισαγωγή νέων δεδομένων σε μια βάση δεδομένων;', 'INSERT INTO  ', 'ADD RECORD', 'ADD NEW', 'INSERT NEW', 'a', 5, 'easy'),
	(22, 'Με την SQL, πώς επιλέγετε μια στήλη με το όνομα "FirstName" από έναν πίνακα με το όνομα "Persons";', 'SELECT FirstName FROM Persons  ', 'SELECT Persons.FirstName', 'EXTRACT FirstName FROM Persons', 'SELECT *.Persons', 'a', 5, 'easy'),
	(23, 'Με την SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα Persons όπου η τιμή της στήλης "FirstName" είναι "Peter";', 'SELECT [all] FROM Persons WHERE FirstName LIKE \'Peter\'  ', 'SELECT * FROM Persons WHERE FirstName=\'Peter\'  ', 'SELECT [all] FROM Persons WHERE FirstName=\'Peter\'', 'SELECT * FROM Persons WHERE FirstName<>\'Peter\'', 'b', 5, 'easy'),
	(24, 'Με την SQL, πώς επιλέγετε όλες τις εγγραφές από έναν πίνακα με το όνομα Persons όπου η τιμή της στήλης "FirstName" ξεκινά με "a";', 'SELECT * FROM Persons WHERE FirstName LIKE \'%a\'  ', 'SELECT * FROM Persons WHERE FirstName=\'%a%\'', 'SELECT * FROM Persons WHERE FirstName=\'a\'', 'SELECT * FROM Persons WHERE FirstName LIKE \'a%\'  ', 'd', 5, 'easy'),
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
	(39, 'Ο περιορισμός NOT NULL επιβάλλει μια στήλη για να μην δέχεται τιμές NULL.', 'Αληθής', 'Ψευδής', '.', '.', 'a', 11, 'hard'),
	(40, 'Ποιος χειριστής χρησιμοποιείται για την αναζήτηση ενός συγκεκριμένου μοτίβου σε μια στήλη;', 'FROM    ', 'GET', 'LIKE    ', 'RANGE', 'c', 11, 'hard'),
	(42, 'Πώς μπορείτε να προσθέσετε μια σειρά χρησιμοποιώντας SQL σε μια βάση δεδομένων;', 'ADD', 'CREATE', 'INSERT', 'MAKE', 'c', 5, 'easy'),
	(43, 'Η εντολή για την κατάργηση σειρών από τον πίνακα "CUSTOMER" είναι:', 'REMOVE FROM CUSTOMER ...', 'DROP FROM CUSTOMER ...', 'DELETE FROM CUSTOMER WHERE ...', 'UPDATE FROM CUSTOMER ...', 'c', 5, 'easy'),
	(44, 'Η ρήτρα SQL WHERE:', 'περιορίζει τα δεδομένα της στήλης που επιστρέφονται.', 'περιορίζει τα δεδομένα γραμμής που επιστρέφονται..', 'Α και Β σωστά', 'Ούτε το Α ούτε το Β σωστά', 'b', 10, 'hard'),
	(45, 'Ποιο από τα παρακάτω είναι ο αρχικός σκοπός του SQL;', 'Για να καθορίσετε τη σύνταξη και τη σημασιολογία της γλώσσας ορισμού δεδομένων SQL', 'Για να καθορίσετε τη σύνταξη και τη σημασιολογία της γλώσσας χειρισμού SQL', 'Για να ορίσετε τις δομές δεδομένων', 'Ολα τα παραπανω.', 'd', 10, 'hard'),
	(47, 'Μια πρόταση από τις παρακάτω είναι σωστή.', 'Ένας εικονικός πίνακας στον οποίο μπορείτε να έχετε πρόσβαση μέσω εντολών SQL', 'Ένας εικονικός πίνακας στον οποίο δεν είναι δυνατή η πρόσβαση μέσω εντολών SQL', 'Ένας βασικός πίνακας στον οποίο μπορείτε να έχετε πρόσβαση μέσω εντολών SQL', 'Ένας βασικός πίνακας στον οποίο δεν είναι δυνατή η πρόσβαση μέσω εντολών SQL', 'a', 5, 'easy'),
	(48, 'Η εντολή για την εξάλειψη ενός πίνακα από μια βάση δεδομένων είναι:', 'REMOVE TABLE CUSTOMER;', 'DROP TABLE CUSTOMER;', 'DELETE TABLE CUSTOMER;', 'UPDATE TABLE CUSTOMER;', 'b', 5, 'easy'),
	(52, 'Η λέξη-κλειδί SQL ________ χρησιμοποιείται με wildcards.', 'LIKE only', 'IN only', 'NOT IN only', 'IN and NOT IN', 'a', 5, 'hard'),
	(53, 'Ποιο από τα παρακάτω είναι η σωστή σειρά λέξεων-κλειδιών για δηλώσεις SQL SELECT;', 'SELECT, FROM, WHERE', 'FROM, WHERE, SELECT', 'WHERE, FROM,SELECT', 'SELECT,WHERE,FROM', 'a', 5, 'hard'),
	(54, 'Το αποτέλεσμα μιας δήλωσης SQL SELECT είναι ένας-μία ________.', 'αναφορά', 'φόρμα', 'αρχείο', 'πίνακας', 'd', 5, 'easy'),
	(55, 'Η λέξη-κλειδί SQL  BETWEEN  χρησιμοποιείται:', 'για διαστήματα', 'για να περιορίσετε τις εμφανιζόμενες στήλες.', 'ως wildcard.', 'Κανένα από τα παραπάνω δεν είναι σωστό.', 'a', 7, 'hard'),
	(56, 'Το ________ υιοθετήθηκε ως εθνικό πρότυπο από την ANSI το 1992.', 'Oracle', 'SQL', 'Microsoft Access', 'DBase', 'b', 5, 'easy'),
	(57, 'Ποιο από τα παρακάτω πρέπει να λάβετε υπόψη όταν δημιουργείτε έναν πίνακα σε SQL;', 'Τύποι δεδομένων', 'πρωτεύοντα κλειδιά', 'Default τιμές', 'Όλα τα παραπάνω', 'd', 7, 'hard'),
	(58, 'Ποια από τις παρακάτω ταξινομεί στην SQL;', 'SORT BY', 'ALIGN BY', 'ORDER BY', 'GROUP BY', 'c', 7, 'hard'),
	(59, 'Για να ορίσετε ποιες στήλες πρέπει να εμφανίζονται σε μια δήλωση SQL SELECT:', 'Χρησιμοποιήστε το FROM για να ονομάσετε τους πίνακες  προέλευσης και να απαριθμήσετε τις στήλες που θα εμφανίζονται μετά την επιλογή.', 'χρησιμοποιήστε το USING για να ονομάσετε τους πίνακες προέλευσης και να αναφέρετε τις στήλες που θα εμφανίζονται μετά την επιλογή.', 'Χρησιμοποιήστε το SELECT για να ονομάσετε τους πίνακες προέλευσης και να αναφέρετε τις στήλες που θα εμφανίζονται μετά τη χρήση.', 'Χρησιμοποιήστε το USING για να ονομάσετε τους πίνακες (ες) προέλευσης και να αναφέρετε τις στήλες που θα εμφανίζονται μετά το WHERE.', 'a', 7, 'hard'),
	(60, 'Το SQL μπορεί να χρησιμοποιηθεί για:', 'δημιουργία μόνο δομές βάσεων δεδομένων.', 'μόνο δεδομένα βάσης δεδομένων ερωτήματος.', 'τροποποίηση δεδομένων βάσης δεδομένων μόνο.', 'Όλα τα παραπάνω μπορούν να γίνουν με SQL.', 'd', 9, 'hard'),
	(61, 'Ποιο από τα παρακάτω είναι μια νομική έκφραση στο SQL;', 'SELECT NULL FROM SALES;', 'SELECT NAME FROM SALES;', 'SELECT * FROM SALES WHEN PRICE = NULL;', 'SELECT # FROM SALES;', 'b', 10, 'hard'),
	(63, 'Η συνάρτηση COUNT στο SQL επιστρέφει τον αριθμό ______________', 'των τιμών', 'των μεμονωμένων τιμών', 'των ομαδοποιημένων τιμών', 'των στηλών', 'a', 10, 'hard'),
	(64, 'Ποιος τύπος δεδομένων μπορεί να αποθηκεύσει μη δομημένα δεδομένα σε μια στήλη;', 'RAW', 'CHAR', 'NUMERIC', 'VARCHAR', 'a', 15, 'hard'),
	(65, 'Ποια συνάρτηση χρησιμοποιείται για να διαιρέσει μια αριθμητική έκφραση  και να πάρει το υπόλοιπο;', 'POWER', 'MOD', 'ROUND', 'REMAINDER', 'b', 9, 'hard'),
	(66, 'Ποια είναι η πλήρης μορφή του DDL;', 'Dynamic Data Language', 'Detailed Data Language', 'Data Definition Language', 'Data Derivation Language', 'c', 8, 'hard'),
	(67, 'Μια γλώσσα βάσης δεδομένων που χρησιμοποιείται για τον ορισμό ολόκληρης της βάσης δεδομένων και του σχήματος ονομάζεται:', 'DCL', 'DML', 'DDL', 'All Of Above', 'c', 6, 'easy'),
	(68, 'Ποια δήλωση στο SQL μας επιτρέπει να αλλάξουμε τον ορισμό ενός πίνακα;', 'ALTER', 'UPDATE', 'CREATE', 'SELECT', 'a', 8, 'hard'),
	(69, 'Το SQL που χρησιμοποιείται από προγράμματα εφαρμογών front-end για να ζητήσει δεδομένα από το DBMS ονομάζεται _______', 'DML', 'DDL', 'VDL', 'SDL', 'a', 10, 'easy'),
	(70, 'Η εντολή που χρησιμοποιείται για τη διαγραφή μιας συγκεκριμένης στήλης σε μια σχέση είναι ____________', 'UPDATE TABLE', 'TRUNCATE COLUMN', 'ALTER , DROP', 'DELETE COLUMN', 'c', 7, 'hard'),
	(71, 'Ποια από τις παρακάτω ενέργειες απαιτεί οι σχέσεις να είναι συμβατές με την ένωση;', 'UNION', 'INTERSECTION', 'DIFFERENCE', 'Όλες οι παραπάνω', 'd', 7, 'easy'),
	(72, 'Ποιο από τα παρακάτω είναι χειριστής σύγκρισης στο SQL;', 'Double equal sign ( == )', 'LIKE', 'BETWEEN', 'Single equal sign ( = )', 'a', 12, 'easy'),
	(73, 'Ποιος χειριστής χρησιμοποιείται για να συγκρίνει μια τιμή με μια καθορισμένη λίστα τιμών;', 'BETWEEN', 'ANY', 'IN', 'ALL', 'c', 9, 'easy'),
	(84, 'STUDENTS (student_code, first_name, last_name, email, phone_no, date_of_birth, honours_subject, percentage_of_marks); Ποιο από τα ακόλουθα ερωτήματα θα εμφανίσει όλους τους μαθητές των οποίων το όνομα ξεκινά με τον χαρακτήρα «Α»;', 'select first_name from students where first_name like ‘A%’;', 'select first_name from students where first_name like ‘%A’;', 'select first_name from students where first_name like ‘%A%’;', 'select first_name from students where first_name like ‘A’;', 'a', 10, 'hard'),
	(86, 'Ποιο από τα παρακάτω δεν αποτελεί εντολή στην SQL;', 'SUM', 'AVG', 'COUNT', 'FIND', 'd', 5, 'easy'),
	(87, 'Ποια λέξη-κλειδί μας επιτρέπει να βρούμε τις μοναδικές τιμές στη βάση δεδομένων;', 'DISTINCT', 'UNIQUE', 'FIND', 'DIFF', 'a', 6, 'easy'),
	(88, 'Ποιο από τα ακόλουθα ερωτήματα θα περιορίσει την έξοδο σε 5 σειρές;', ' SELECT * FROM DataFlair 5;', ' SELECT * FROM DataFlair LIMIT 5;', ' SELECT * FROM DataFlair 5 LIMIT;', ' SELECT LIMIT(5) * FROM DataFlair ;', 'b', 9, 'hard'),
	(89, 'Πόσα πρωτεύοντα κλειδιά μπορούν να δημιουργηθούν σε έναν πίνακα;', 'Άπειρα', '2', '1', '24', 'c', 3, 'easy'),
	(90, 'Ποιος τύπος δεδομένων SQL χρησιμοποιείται για την αποθήκευση ενός αντικειμένου JSON;', 'NVarchar', 'BLOB', 'Char', 'Int', 'a', 8, 'hard'),
	(91, 'Ποιο από τα παρακάτω δείχνει σχόλιο στο SQL;', ' /* This is a comment. */', ' # This is a comment.', ' % This is a comment. %', '//This is a comment.', 'a', 6, 'easy'),
	(92, 'Ποια από τις ακόλουθες συνδέσεις εξάγει δεδομένα αντίστοιχων σειρών και από τους δύο πίνακες;', ' Full Outer Join', ' Left Join', ' Right Join', 'Κανένα από τα παραπάνω', 'a', 12, 'hard');
/*!40000 ALTER TABLE `sql_questions` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.sql_random_queries
DROP TABLE IF EXISTS `sql_random_queries`;
CREATE TABLE IF NOT EXISTS `sql_random_queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql_query` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `hideWord` varchar(500) COLLATE utf8_bin NOT NULL,
  `table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `table_id_idx` (`table_id`),
  CONSTRAINT `table_id` FOREIGN KEY (`table_id`) REFERENCES `excersice_tables` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1500 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.sql_random_queries: ~115 rows (approximately)
/*!40000 ALTER TABLE `sql_random_queries` DISABLE KEYS */;
REPLACE INTO `sql_random_queries` (`id`, `sql_query`, `hideWord`, `table_id`) VALUES
	(1179, 'SELECT * FROM actors', '*,actors', 201),
	(1180, 'SELECT idactor, name FROM actors', 'idactor,name', 201),
	(1181, 'SELECT DISTINCT surname FROM actors', 'DISTINCT', 201),
	(1182, 'SELECT COUNT(address) FROM actors', 'COUNT,FROM', 201),
	(1183, 'SELECT COUNT(DISTINCT surname) FROM actors', 'DISTINCT', 201),
	(1184, 'SELECT * FROM actors WHERE idactor=7', 'WHERE,idactor', 201),
	(1185, 'SELECT * FROM actors WHERE idactor IN ("1","4")', 'IN', 201),
	(1186, 'SELECT * FROM actors WHERE idactor BETWEEN 2 AND 7', 'BETWEEN,AND', 201),
	(1187, 'SELECT * FROM actors ORDER BY address', 'ORDER BY', 201),
	(1188, 'SELECT * FROM actors ORDER BY surname DESC', 'ORDER BY,DESC', 201),
	(1189, 'SELECT * FROM actors ORDER BY surname ASC, address DESC', 'ORDER BY,ASC,DESC', 201),
	(1190, 'SELECT * FROM actors LIMIT 3', 'LIMIT', 201),
	(1191, 'SELECT MIN(idactor) FROM actors', 'MIN', 201),
	(1192, 'SELECT MAX(idactor) FROM actors', 'MAX', 201),
	(1193, 'SELECT COUNT(surname), address FROM actors GROUP BY address', 'COUNT,GROUP BY', 201),
	(1194, 'SELECT COUNT(idactor), name FROM actors GROUP BY name ORDER BY COUNT(idactor) DESC', 'ORDER BY,DESC', 201),
	(1195, 'SELECT COUNT(surname) FROM actors GROUP BY address HAVING COUNT(surname) >3', 'GROUP BY,HAVING COUNT', 201),
	(1196, 'SELECT SUM(idactor) FROM actors', 'SUM', 201),
	(1197, 'SELECT AVG(idactor) FROM actors', 'AVG', 201),
	(1198, 'SELECT * FROM actors WHERE address IS NULL', 'IS NULL', 201),
	(1209, 'SELECT actors.idactor, actors.name, movies.title, movies.released FROM actors, movies WHERE actors.idactor=movies.actorid', 'actors,idactor,=', 203),
	(1210, 'SELECT actors.idactor, actors.name, movies.title FROM actors INNER JOIN movies ON actors.idactor=movies.actorid', 'INNER,JOIN', 203),
	(1211, 'SELECT actors.name, movies.actorid FROM actors LEFT JOIN movies ON actors.idactor=movies.actorid ORDER BY actors.name', 'LEFT,ORDER BY', 203),
	(1212, 'SELECT actors.idactor, movies.title, movies.released FROM actors RIGHT JOIN movies ON actors.idactor=movies.actorid ORDER BY actors.idactor DESC', 'RIGHT,DESC', 203),
	(1213, 'SELECT actors.idactor, actors.name, movies.title FROM actors INNER JOIN movies ON actors.idactor=movies.actorid WHERE actors.idactor>3', 'WHERE,>', 203),
	(1214, 'SELECT * FROM movies CROSS JOIN actors', 'CROSS', 203),
	(1215, 'SELECT idactor FROM actors UNION SELECT actorid FROM movies', 'UNION', 203),
	(1216, 'SELECT address FROM actors WHERE idactor = ANY ( SELECT actorid FROM movies WHERE actorid>3 )', 'ANY', 203),
	(1217, 'SELECT idactor FROM actors WHERE idactor = ALL ( SELECT actorid FROM movies WHERE actorid=3 )', 'ALL', 203),
	(1218, 'SELECT surname FROM actors WHERE idactor IN ( SELECT actorid FROM movies WHERE actorid>2 )', 'IN', 203),
	(1249, 'SELECT * FROM games', '*,games', 206),
	(1250, 'SELECT idgame, title FROM games', 'idgame,title', 206),
	(1251, 'SELECT DISTINCT multiplayer FROM games', 'DISTINCT', 206),
	(1252, 'SELECT COUNT(released) FROM games', 'COUNT,FROM', 206),
	(1253, 'SELECT COUNT(DISTINCT multiplayer) FROM games', 'DISTINCT', 206),
	(1254, 'SELECT * FROM games WHERE idgame=7', 'WHERE,idgame', 206),
	(1255, 'SELECT * FROM games WHERE idgame IN ("1","4")', 'IN', 206),
	(1256, 'SELECT * FROM games WHERE idgame BETWEEN 2 AND 7', 'BETWEEN,AND', 206),
	(1257, 'SELECT * FROM games ORDER BY released', 'ORDER BY', 206),
	(1258, 'SELECT * FROM games ORDER BY multiplayer DESC', 'ORDER BY,DESC', 206),
	(1259, 'SELECT * FROM games ORDER BY multiplayer ASC, released DESC', 'ORDER BY,ASC,DESC', 206),
	(1260, 'SELECT * FROM games LIMIT 3', 'LIMIT', 206),
	(1261, 'SELECT MIN(idgame) FROM games', 'MIN', 206),
	(1262, 'SELECT MAX(idgame) FROM games', 'MAX', 206),
	(1263, 'SELECT COUNT(multiplayer), released FROM games GROUP BY released', 'COUNT,GROUP BY', 206),
	(1264, 'SELECT COUNT(idgame), title FROM games GROUP BY title ORDER BY COUNT(idgame) DESC', 'ORDER BY,DESC', 206),
	(1265, 'SELECT COUNT(multiplayer) FROM games GROUP BY released HAVING COUNT(multiplayer) >3', 'GROUP BY,HAVING COUNT', 206),
	(1266, 'SELECT SUM(idgame) FROM games', 'SUM', 206),
	(1267, 'SELECT AVG(idgame) FROM games', 'AVG', 206),
	(1268, 'SELECT * FROM games WHERE released IS NULL', 'IS NULL', 206),
	(1269, 'SELECT games.idgame, games.title, gamers.name, gamers.surname FROM games, gamers WHERE games.idgame=gamers.gameid', 'games,idgame,=', 207),
	(1270, 'SELECT games.idgame, games.title, gamers.name FROM games INNER JOIN gamers ON games.idgame=gamers.gameid', 'INNER,JOIN', 207),
	(1271, 'SELECT games.title, gamers.gameid FROM games LEFT JOIN gamers ON games.idgame=gamers.gameid ORDER BY games.title', 'LEFT,ORDER BY', 207),
	(1272, 'SELECT games.idgame, gamers.name, gamers.surname FROM games RIGHT JOIN gamers ON games.idgame=gamers.gameid ORDER BY games.idgame DESC', 'RIGHT,DESC', 207),
	(1273, 'SELECT games.idgame, games.title, gamers.name FROM games INNER JOIN gamers ON games.idgame=gamers.gameid WHERE games.idgame>3', 'WHERE,>', 207),
	(1274, 'SELECT * FROM gamers CROSS JOIN games', 'CROSS', 207),
	(1275, 'SELECT idgame FROM games UNION SELECT gameid FROM gamers', 'UNION', 207),
	(1276, 'SELECT released FROM games WHERE idgame = ANY ( SELECT gameid FROM gamers WHERE gameid>3 )', 'ANY', 207),
	(1277, 'SELECT idgame FROM games WHERE idgame = ALL ( SELECT gameid FROM gamers WHERE gameid=3 )', 'ALL', 207),
	(1278, 'SELECT multiplayer FROM games WHERE idgame IN ( SELECT gameid FROM gamers WHERE gameid>2 )', 'IN', 207),
	(1439, 'SELECT * FROM coffee', '*,coffee', 220),
	(1440, 'SELECT idCoffee, brand FROM coffee', 'idCoffee,brand', 220),
	(1441, 'SELECT DISTINCT productiondate FROM coffee', 'DISTINCT', 220),
	(1442, 'SELECT COUNT(kg) FROM coffee', 'COUNT,FROM', 220),
	(1443, 'SELECT COUNT(DISTINCT productiondate) FROM coffee', 'DISTINCT', 220),
	(1444, 'SELECT * FROM coffee WHERE idCoffee=7', 'WHERE,idCoffee', 220),
	(1445, 'SELECT * FROM coffee WHERE idCoffee IN ("1","4")', 'IN', 220),
	(1446, 'SELECT * FROM coffee WHERE idCoffee BETWEEN 2 AND 7', 'BETWEEN,AND', 220),
	(1447, 'SELECT * FROM coffee ORDER BY kg', 'ORDER BY', 220),
	(1448, 'SELECT * FROM coffee ORDER BY productiondate DESC', 'ORDER BY,DESC', 220),
	(1449, 'SELECT * FROM coffee ORDER BY productiondate ASC, kg DESC', 'ORDER BY,ASC,DESC', 220),
	(1450, 'SELECT * FROM coffee LIMIT 3', 'LIMIT', 220),
	(1451, 'SELECT MIN(idCoffee) FROM coffee', 'MIN', 220),
	(1452, 'SELECT MAX(idCoffee) FROM coffee', 'MAX', 220),
	(1453, 'SELECT COUNT(productiondate), kg FROM coffee GROUP BY kg', 'COUNT,GROUP BY', 220),
	(1454, 'SELECT COUNT(idCoffee), brand FROM coffee GROUP BY brand ORDER BY COUNT(idCoffee) DESC', 'ORDER BY,DESC', 220),
	(1455, 'SELECT COUNT(productiondate) FROM coffee GROUP BY kg HAVING COUNT(productiondate) >3', 'GROUP BY,HAVING COUNT', 220),
	(1456, 'SELECT SUM(idCoffee) FROM coffee', 'SUM', 220),
	(1457, 'SELECT AVG(idCoffee) FROM coffee', 'AVG', 220),
	(1458, 'SELECT * FROM coffee WHERE kg IS NULL', 'IS NULL', 220),
	(1459, 'SELECT coffee.idCoffee, coffee.brand, cafe.name_cafe, cafe.cafesize FROM coffee, cafe WHERE coffee.idCoffee=cafe.coffeeid', 'coffee,idCoffee,=', 221),
	(1460, 'SELECT coffee.idCoffee, coffee.brand, cafe.name_cafe FROM coffee INNER JOIN cafe ON coffee.idCoffee=cafe.coffeeid', 'INNER,JOIN', 221),
	(1461, 'SELECT coffee.brand, cafe.coffeeid FROM coffee LEFT JOIN cafe ON coffee.idCoffee=cafe.coffeeid ORDER BY coffee.brand', 'LEFT,ORDER BY', 221),
	(1462, 'SELECT coffee.idCoffee, cafe.name_cafe, cafe.cafesize FROM coffee RIGHT JOIN cafe ON coffee.idCoffee=cafe.coffeeid ORDER BY coffee.idCoffee DESC', 'RIGHT,DESC', 221),
	(1463, 'SELECT coffee.idCoffee, coffee.brand, cafe.name_cafe FROM coffee INNER JOIN cafe ON coffee.idCoffee=cafe.coffeeid WHERE coffee.idCoffee>3', 'WHERE,>', 221),
	(1464, 'SELECT * FROM cafe CROSS JOIN coffee', 'CROSS', 221),
	(1465, 'SELECT idCoffee FROM coffee UNION SELECT coffeeid FROM cafe', 'UNION', 221),
	(1466, 'SELECT kg FROM coffee WHERE idCoffee = ANY ( SELECT coffeeid FROM cafe WHERE coffeeid>3 )', 'ANY', 221),
	(1467, 'SELECT idCoffee FROM coffee WHERE idCoffee = ALL ( SELECT coffeeid FROM cafe WHERE coffeeid=3 )', 'ALL', 221),
	(1468, 'SELECT productiondate FROM coffee WHERE idCoffee IN ( SELECT coffeeid FROM cafe WHERE coffeeid>2 )', 'IN', 221),
	(1470, 'SELECT * FROM writters', '*,writters', 222),
	(1471, 'SELECT idwritter, name FROM writters', 'idwritter,name', 222),
	(1472, 'SELECT DISTINCT surname FROM writters', 'DISTINCT', 222),
	(1473, 'SELECT COUNT(gender) FROM writters', 'COUNT,FROM', 222),
	(1474, 'SELECT COUNT(DISTINCT surname) FROM writters', 'DISTINCT', 222),
	(1475, 'SELECT * FROM writters WHERE idwritter=7', 'WHERE,idwritter', 222),
	(1476, 'SELECT * FROM writters WHERE idwritter IN ("1","4")', 'IN', 222),
	(1477, 'SELECT * FROM writters WHERE idwritter BETWEEN 2 AND 7', 'BETWEEN,AND', 222),
	(1478, 'SELECT * FROM writters ORDER BY gender', 'ORDER BY', 222),
	(1479, 'SELECT * FROM writters ORDER BY surname DESC', 'ORDER BY,DESC', 222),
	(1480, 'SELECT * FROM writters ORDER BY surname ASC, gender DESC', 'ORDER BY,ASC,DESC', 222),
	(1481, 'SELECT * FROM writters LIMIT 3', 'LIMIT', 222),
	(1482, 'SELECT MIN(idwritter) FROM writters', 'MIN', 222),
	(1483, 'SELECT MAX(idwritter) FROM writters', 'MAX', 222),
	(1484, 'SELECT COUNT(idwritter), name FROM writters GROUP BY name', 'COUNT,GROUP BY', 222),
	(1485, 'SELECT COUNT(birthdate), isAlive FROM writters GROUP BY isAlive ORDER BY COUNT(birthdate) DESC', 'ORDER BY,DESC', 222),
	(1486, 'SELECT COUNT(surname) FROM writters GROUP BY gender HAVING COUNT(surname) >3', 'GROUP BY,HAVING COUNT', 222),
	(1487, 'SELECT SUM(idwritter) FROM writters', 'SUM', 222),
	(1488, 'SELECT AVG(idwritter) FROM writters', 'AVG', 222),
	(1489, 'SELECT * FROM writters WHERE gender IS NULL', 'IS NULL', 222),
	(1490, 'SELECT writters.idwritter, writters.name, books.title, books.views FROM writters, books WHERE writters.idwritter=books.writterid', 'writters,idwritter,=', 223),
	(1491, 'SELECT writters.idwritter, writters.name, books.title FROM writters INNER JOIN books ON writters.idwritter=books.writterid', 'INNER,JOIN', 223),
	(1492, 'SELECT writters.name, books.writterid FROM writters LEFT JOIN books ON writters.idwritter=books.writterid ORDER BY writters.name', 'LEFT,ORDER BY', 223),
	(1493, 'SELECT writters.idwritter, books.title, books.views FROM writters RIGHT JOIN books ON writters.idwritter=books.writterid ORDER BY writters.idwritter DESC', 'RIGHT,DESC', 223),
	(1494, 'SELECT writters.idwritter, writters.name, books.title FROM writters INNER JOIN books ON writters.idwritter=books.writterid WHERE writters.idwritter>3', 'WHERE,>', 223),
	(1495, 'SELECT * FROM books CROSS JOIN writters', 'CROSS', 223),
	(1496, 'SELECT birthdate FROM writters UNION SELECT releaseDate FROM books', 'UNION', 223),
	(1497, 'SELECT gender FROM writters WHERE idwritter = ANY ( SELECT writterid FROM books WHERE writterid>3 )', 'ANY', 223),
	(1498, 'SELECT birthdate FROM writters WHERE idwritter = ALL ( SELECT writterid FROM books WHERE writterid=3 )', 'ALL', 223),
	(1499, 'SELECT surname FROM writters WHERE idwritter IN ( SELECT writterid FROM books WHERE writterid>2 )', 'IN', 223);
/*!40000 ALTER TABLE `sql_random_queries` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.sql_random_queries_true_or_false
DROP TABLE IF EXISTS `sql_random_queries_true_or_false`;
CREATE TABLE IF NOT EXISTS `sql_random_queries_true_or_false` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sql_query_true_or_false` varchar(2000) COLLATE utf8_bin NOT NULL,
  `exersice_table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exersice_table_id_idx` (`exersice_table_id`),
  CONSTRAINT `exersice_table_id` FOREIGN KEY (`exersice_table_id`) REFERENCES `excersice_tables` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.sql_random_queries_true_or_false: ~115 rows (approximately)
/*!40000 ALTER TABLE `sql_random_queries_true_or_false` DISABLE KEYS */;
REPLACE INTO `sql_random_queries_true_or_false` (`id`, `sql_query_true_or_false`, `exersice_table_id`) VALUES
	(60, 'SELECT * FROM actors', 201),
	(61, 'SELECT * FROM actors WHERE idactor>1', 201),
	(62, 'SELECT DISTINCT address FROM actors', 201),
	(63, 'SELECT address FROM actors WHERE idactor=2', 201),
	(64, 'SELECT MIN(idactor) FROM actors', 201),
	(65, 'SELECT COUNT(name) FROM actors', 201),
	(66, 'SELECT COUNT(name) FROM actors WHERE idactor BETWEEN 1 AND 5', 201),
	(67, 'SELECT name, surname FROM actors WHERE idactor=6 OR idactor=3', 201),
	(68, 'SELECT * FROM actors ORDER BY idactor ASC', 201),
	(69, 'SELECT * FROM actors ORDER BY idactor DESC', 201),
	(70, 'SELECT * FROM actors ORDER BY address ASC, name DESC', 201),
	(71, 'SELECT * FROM actors GROUP BY surname', 201),
	(72, 'SELECT AVG(idactor) FROM actors WHERE idactor>2', 201),
	(73, 'SELECT SUM(idactor) FROM actors WHERE idactor>2', 201),
	(74, 'SELECT address, idactor FROM actors WHERE NOT idactor>2', 201),
	(75, 'SELECT COUNT(DISTINCT address)  FROM actors', 201),
	(76, 'SELECT address FROM actors WHERE surname LIKE \'a%\'', 201),
	(77, 'SELECT MAX(idactor)  FROM actors WHERE idactor<3', 201),
	(78, 'SELECT surname AS test FROM actors', 201),
	(79, 'SELECT * FROM actors WHERE surname LIKE \'%a%\'', 201),
	(90, 'SELECT actors.name, movies.title, movies.released FROM actors INNER JOIN movies ON actors.idactor=movies.actorid ORDER BY actors.idactor DESC', 203),
	(91, 'SELECT actors.name, movies.title, movies.released FROM actors INNER JOIN movies ON actors.idactor=movies.actorid ORDER BY actors.idactor ASC, actors.address DESC', 203),
	(92, 'SELECT actors.name, movies.title, movies.released FROM actors RIGHT JOIN movies ON actors.idactor=movies.actorid WHERE actors.idactor>3', 203),
	(93, 'SELECT actors.name, movies.title, movies.released FROM actors RIGHT JOIN movies ON actors.idactor=movies.actorid WHERE actors.idactor<5', 203),
	(94, 'SELECT actors.name, movies.title, movies.released FROM actors LEFT JOIN movies ON actors.idactor=movies.actorid WHERE movies.title LIKE \'%3%\'', 203),
	(95, 'SELECT * FROM movies CROSS JOIN actors WHERE movies.actorid>1 AND movies.actorid<7', 203),
	(96, 'SELECT actors.name, movies.title, movies.released FROM actors LEFT JOIN movies ON actors.idactor=movies.actorid', 203),
	(97, 'SELECT name FROM actors WHERE idactor IN ( SELECT actorid FROM movies WHERE actorid<4 )', 203),
	(98, 'SELECT surname, address FROM actors UNION SELECT released, actorid FROM movies', 203),
	(99, 'SELECT actors.surname, actors.address FROM actors RIGHT JOIN movies ON actors.idactor=movies.actorid WHERE NOT movies.actorid=5', 203),
	(132, 'SELECT * FROM games', 206),
	(133, 'SELECT * FROM games WHERE idgame>1', 206),
	(134, 'SELECT DISTINCT released FROM games', 206),
	(135, 'SELECT released FROM games WHERE idgame=2', 206),
	(136, 'SELECT MIN(idgame) FROM games', 206),
	(137, 'SELECT COUNT(title) FROM games', 206),
	(138, 'SELECT COUNT(title) FROM games WHERE idgame BETWEEN 1 AND 5', 206),
	(139, 'SELECT title, multiplayer FROM games WHERE idgame=6 OR idgame=3', 206),
	(140, 'SELECT * FROM games ORDER BY idgame ASC', 206),
	(141, 'SELECT * FROM games ORDER BY idgame DESC', 206),
	(142, 'SELECT * FROM games ORDER BY released ASC, title DESC', 206),
	(143, 'SELECT * FROM games GROUP BY multiplayer', 206),
	(144, 'SELECT AVG(idgame) FROM games WHERE idgame>2', 206),
	(145, 'SELECT SUM(idgame) FROM games WHERE idgame>2', 206),
	(146, 'SELECT released, idgame FROM games WHERE NOT idgame>2', 206),
	(147, 'SELECT COUNT(DISTINCT released)  FROM games', 206),
	(148, 'SELECT released FROM games WHERE title LIKE \'a%\'', 206),
	(149, 'SELECT MAX(idgame)  FROM games WHERE idgame<3', 206),
	(150, 'SELECT multiplayer AS test FROM games', 206),
	(151, 'SELECT * FROM games WHERE title LIKE \'%a%\'', 206),
	(152, 'SELECT games.title, gamers.name, gamers.surname FROM games INNER JOIN gamers ON games.idgame=gamers.gameid ORDER BY games.idgame DESC', 207),
	(153, 'SELECT games.title, gamers.name, gamers.surname FROM games INNER JOIN gamers ON games.idgame=gamers.gameid ORDER BY games.idgame ASC, games.released DESC', 207),
	(154, 'SELECT games.title, gamers.name, gamers.surname FROM games RIGHT JOIN gamers ON games.idgame=gamers.gameid WHERE games.idgame>3', 207),
	(155, 'SELECT games.title, gamers.name, gamers.surname FROM games RIGHT JOIN gamers ON games.idgame=gamers.gameid WHERE games.idgame<5', 207),
	(156, 'SELECT games.title, gamers.name, gamers.surname FROM games LEFT JOIN gamers ON games.idgame=gamers.gameid WHERE gamers.surname LIKE \'%e%\'', 207),
	(157, 'SELECT * FROM gamers CROSS JOIN games WHERE gamers.gameid>1 AND gamers.gameid<7', 207),
	(158, 'SELECT games.title, gamers.name, gamers.surname FROM games LEFT JOIN gamers ON games.idgame=gamers.gameid', 207),
	(159, 'SELECT title FROM games WHERE idgame IN ( SELECT gameid FROM gamers WHERE gameid<4 )', 207),
	(160, 'SELECT multiplayer, released FROM games UNION SELECT surname, gameid FROM gamers', 207),
	(161, 'SELECT games.multiplayer, games.released FROM games RIGHT JOIN gamers ON games.idgame=gamers.gameid WHERE NOT gamers.gameid=5', 207),
	(323, 'SELECT * FROM coffee', 220),
	(324, 'SELECT * FROM coffee WHERE idCoffee>1', 220),
	(325, 'SELECT DISTINCT kg FROM coffee', 220),
	(326, 'SELECT kg FROM coffee WHERE idCoffee=2', 220),
	(327, 'SELECT MIN(idCoffee) FROM coffee', 220),
	(328, 'SELECT COUNT(brand) FROM coffee', 220),
	(329, 'SELECT COUNT(brand) FROM coffee WHERE idCoffee BETWEEN 1 AND 5', 220),
	(330, 'SELECT brand, productiondate FROM coffee WHERE idCoffee=6 OR idCoffee=3', 220),
	(331, 'SELECT * FROM coffee ORDER BY idCoffee ASC', 220),
	(332, 'SELECT * FROM coffee ORDER BY idCoffee DESC', 220),
	(333, 'SELECT * FROM coffee ORDER BY kg ASC, brand DESC', 220),
	(334, 'SELECT * FROM coffee GROUP BY productiondate', 220),
	(335, 'SELECT AVG(idCoffee) FROM coffee WHERE idCoffee>2', 220),
	(336, 'SELECT SUM(idCoffee) FROM coffee WHERE idCoffee>2', 220),
	(337, 'SELECT kg, idCoffee FROM coffee WHERE NOT idCoffee>2', 220),
	(338, 'SELECT COUNT(DISTINCT kg)  FROM coffee', 220),
	(339, 'SELECT kg FROM coffee WHERE productiondate LIKE \'2%\'', 220),
	(340, 'SELECT MAX(idCoffee)  FROM coffee WHERE idCoffee<3', 220),
	(341, 'SELECT productiondate AS test FROM coffee', 220),
	(342, 'SELECT * FROM coffee WHERE productiondate LIKE \'%20%\'', 220),
	(343, 'SELECT coffee.brand, cafe.name_cafe, cafe.cafesize FROM coffee INNER JOIN cafe ON coffee.idCoffee=cafe.coffeeid ORDER BY coffee.idCoffee DESC', 221),
	(344, 'SELECT coffee.brand, cafe.name_cafe, cafe.cafesize FROM coffee INNER JOIN cafe ON coffee.idCoffee=cafe.coffeeid ORDER BY coffee.idCoffee ASC, coffee.kg DESC', 221),
	(345, 'SELECT coffee.brand, cafe.name_cafe, cafe.cafesize FROM coffee RIGHT JOIN cafe ON coffee.idCoffee=cafe.coffeeid WHERE coffee.idCoffee>3', 221),
	(346, 'SELECT coffee.brand, cafe.name_cafe, cafe.cafesize FROM coffee RIGHT JOIN cafe ON coffee.idCoffee=cafe.coffeeid WHERE coffee.idCoffee<5', 221),
	(347, 'SELECT coffee.brand, cafe.name_cafe, cafe.cafesize FROM coffee LEFT JOIN cafe ON coffee.idCoffee=cafe.coffeeid WHERE cafe.cafesize LIKE \'%2%\'', 221),
	(348, 'SELECT * FROM cafe CROSS JOIN coffee WHERE cafe.coffeeid>1 AND cafe.coffeeid<7', 221),
	(349, 'SELECT coffee.brand, cafe.name_cafe, cafe.cafesize FROM coffee LEFT JOIN cafe ON coffee.idCoffee=cafe.coffeeid', 221),
	(350, 'SELECT brand FROM coffee WHERE idCoffee IN ( SELECT coffeeid FROM cafe WHERE coffeeid<4 )', 221),
	(351, 'SELECT productiondate, kg FROM coffee UNION SELECT cafesize, coffeeid FROM cafe', 221),
	(352, 'SELECT coffee.productiondate, coffee.kg FROM coffee RIGHT JOIN cafe ON coffee.idCoffee=cafe.coffeeid WHERE NOT cafe.coffeeid=5', 221),
	(354, 'SELECT * FROM writters', 222),
	(355, 'SELECT * FROM writters WHERE idwritter>1', 222),
	(356, 'SELECT DISTINCT gender FROM writters', 222),
	(357, 'SELECT gender FROM writters WHERE idwritter=2', 222),
	(358, 'SELECT MIN(idwritter) FROM writters', 222),
	(359, 'SELECT COUNT(name) FROM writters', 222),
	(360, 'SELECT COUNT(name) FROM writters WHERE idwritter BETWEEN 1 AND 5', 222),
	(361, 'SELECT name, surname FROM writters WHERE idwritter=6 OR idwritter=3', 222),
	(362, 'SELECT * FROM writters ORDER BY birthdate ASC', 222),
	(363, 'SELECT * FROM writters ORDER BY birthdate DESC', 222),
	(364, 'SELECT * FROM writters ORDER BY gender ASC, name DESC', 222),
	(365, 'SELECT * FROM writters GROUP BY surname', 222),
	(366, 'SELECT AVG(idwritter) FROM writters WHERE idwritter>2', 222),
	(367, 'SELECT SUM(idwritter) FROM writters WHERE idwritter>2', 222),
	(368, 'SELECT gender, birthdate FROM writters WHERE NOT idwritter>2', 222),
	(369, 'SELECT COUNT(DISTINCT gender)  FROM writters', 222),
	(370, 'SELECT gender FROM writters WHERE surname LIKE \'a%\'', 222),
	(371, 'SELECT MAX(idwritter)  FROM writters WHERE idwritter<3', 222),
	(372, 'SELECT surname AS test FROM writters', 222),
	(373, 'SELECT * FROM writters WHERE surname LIKE \'%a%\'', 222),
	(374, 'SELECT writters.name, books.title, books.views FROM writters INNER JOIN books ON writters.idwritter=books.writterid ORDER BY writters.idwritter DESC', 223),
	(375, 'SELECT writters.name, books.title, books.views FROM writters INNER JOIN books ON writters.idwritter=books.writterid ORDER BY writters.idwritter ASC, writters.gender DESC', 223),
	(376, 'SELECT writters.name, books.title, books.views FROM writters RIGHT JOIN books ON writters.idwritter=books.writterid WHERE writters.idwritter>3', 223),
	(377, 'SELECT writters.name, books.title, books.views FROM writters RIGHT JOIN books ON writters.idwritter=books.writterid WHERE writters.idwritter<5', 223),
	(378, 'SELECT writters.name, books.title, books.views FROM writters LEFT JOIN books ON writters.idwritter=books.writterid WHERE books.title LIKE \'%e%\'', 223),
	(379, 'SELECT * FROM books CROSS JOIN writters WHERE books.writterid>1 AND books.writterid<7', 223),
	(380, 'SELECT writters.name, books.title, books.views FROM writters LEFT JOIN books ON writters.idwritter=books.writterid', 223),
	(381, 'SELECT name FROM writters WHERE idwritter IN ( SELECT writterid FROM books WHERE writterid<4 )', 223),
	(382, 'SELECT surname, gender FROM writters UNION SELECT views, releaseDate FROM books', 223),
	(383, 'SELECT writters.surname, writters.gender FROM writters RIGHT JOIN books ON writters.idwritter=books.writterid WHERE NOT books.writterid=5', 223);
/*!40000 ALTER TABLE `sql_random_queries_true_or_false` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.success_rate
DROP TABLE IF EXISTS `success_rate`;
CREATE TABLE IF NOT EXISTS `success_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_student` int(11) NOT NULL,
  `rate` varchar(300) COLLATE utf8_bin NOT NULL,
  `time` varchar(100) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(300) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type_excersice` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_student_idx` (`id_student`),
  CONSTRAINT `id_student` FOREIGN KEY (`id_student`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.success_rate: ~47 rows (approximately)
/*!40000 ALTER TABLE `success_rate` DISABLE KEYS */;
REPLACE INTO `success_rate` (`id`, `id_student`, `rate`, `time`, `table_name`, `created_at`, `updated_at`, `type_excersice`) VALUES
	(52, 5, 'Σωστές 0 στις 10', '00:00:16', 'books', '2021-04-26 15:39:58', '2021-04-26 15:39:58', 'Συμπλήρωσης-Κενού'),
	(53, 5, 'Σωστές 12 στις 20', '00:03:32', 'games', '2021-04-26 16:00:47', '2021-04-26 16:00:47', 'Σωστό-λάθος'),
	(54, 5, 'Σωστές 12 στις 20', '00:03:45', 'games', '2021-04-26 16:29:17', '2021-04-26 16:29:17', 'Σωστό-λάθος'),
	(55, 5, 'Σωστές 9 στις 20', '00:01:43', 'reporters', '2021-04-26 16:50:58', '2021-04-26 16:50:58', 'Σωστό-λάθος'),
	(56, 5, 'Σωστές 11 στις 20', '00:00:37', 'reporters', '2021-04-26 16:51:40', '2021-04-26 16:51:40', 'Σωστό-λάθος'),
	(57, 5, 'Σωστές 3 στις 10', '00:00:21', 'books', '2021-04-26 16:52:10', '2021-04-26 16:52:10', 'Σωστό-λάθος'),
	(58, 5, 'Σωστές 7 στις 10', '00:01:29', 'books', '2021-04-26 17:47:33', '2021-04-26 17:47:33', 'Συμπλήρωση-κενού'),
	(59, 5, 'Σωστές 17 στις 20', '00:01:11', 'writers', '2021-04-26 18:19:43', '2021-04-26 18:19:43', 'Σωστό-λάθος'),
	(60, 5, 'Σωστές 7 στις 10', '00:02:28', 'books', '2021-04-26 21:46:06', '2021-04-26 21:46:06', 'Σωστό-λάθος'),
	(61, 5, 'Σωστές 2 στις 3', '00:00:17', 'games', '2021-04-27 14:32:36', '2021-04-27 14:32:36', 'Σωστό-λάθος'),
	(62, 5, 'Σωστές 2 στις 4', '00:00:17', 'games', '2021-04-27 14:35:32', '2021-04-27 14:35:32', 'Σωστό-λάθος'),
	(63, 5, 'Σωστές 17 στις 20', '00:01:37', 'actors', '2021-04-27 17:32:57', '2021-04-27 17:32:57', 'Σωστό-λάθος'),
	(64, 5, 'Σωστές 9 στις 10', '00:00:49', 'movies', '2021-04-27 17:34:01', '2021-04-27 17:34:01', 'Σωστό-λάθος'),
	(65, 5, 'Σωστές 8 στις 10', '00:01:16', 'gamers', '2021-04-27 17:47:16', '2021-04-27 17:47:16', 'Συμπλήρωση-κενού'),
	(66, 5, 'Σωστές 11 στις 20', '00:02:05', 'husbands', '2021-04-27 21:36:13', '2021-04-27 21:36:13', 'Συμπλήρωση-κενού'),
	(67, 5, 'Σωστές 14 στις 20', '00:03:19', 'husbands', '2021-04-27 21:40:20', '2021-04-27 21:40:20', 'Σωστό-λάθος'),
	(68, 5, 'Σωστές 7 στις 10', '00:01:33', 'wifes', '2021-04-27 21:42:03', '2021-04-27 21:42:03', 'Σωστό-λάθος'),
	(69, 5, 'Σωστές 0 στις 1', '00:00:10', 'gamers', '2021-04-28 15:08:27', '2021-04-28 15:08:27', 'Σωστό-λάθος'),
	(70, 5, 'Σωστές 2 στις 2', '00:00:11', 'gamers', '2021-04-28 15:09:52', '2021-04-28 15:09:52', 'Σωστό-λάθος'),
	(71, 5, 'Σωστές 19 στις 20', '00:02:39', 'games', '2021-04-28 16:07:35', '2021-04-28 16:07:35', 'Συμπλήρωση-κενού'),
	(72, 5, 'Σωστές 9 στις 10', '00:01:26', 'gamers', '2021-04-28 16:09:09', '2021-04-28 16:09:09', 'Συμπλήρωση-κενού'),
	(73, 5, 'Σωστές 17 στις 20', '00:01:20', 'games', '2021-04-28 16:10:46', '2021-04-28 16:10:46', 'Σωστό-λάθος'),
	(74, 5, 'Σωστές 9 στις 10', '00:00:31', 'gamers', '2021-04-28 16:11:24', '2021-04-28 16:11:24', 'Σωστό-λάθος'),
	(75, 5, 'Σωστές 19 στις 20', '00:03:17', 'trips', '2021-05-01 16:54:33', '2021-05-01 16:54:33', 'Συμπλήρωση-κενού'),
	(76, 5, 'Σωστές 10 στις 10', '00:00:54', 'aeroplane', '2021-05-01 17:10:29', '2021-05-01 17:10:29', 'Συμπλήρωση-κενού'),
	(77, 5, 'Σωστές 19 στις 20', '00:02:03', 'trips', '2021-05-01 17:12:40', '2021-05-01 17:12:40', 'Σωστό-λάθος'),
	(78, 5, 'Σωστές 8 στις 10', '00:01:12', 'aeroplane', '2021-05-01 17:14:03', '2021-05-01 17:14:03', 'Σωστό-λάθος'),
	(79, 16, 'Σωστές 19 στις 20', '00:02:28', 'actors', '2021-05-03 13:06:51', '2021-05-03 13:06:51', 'Συμπλήρωση-κενού'),
	(80, 16, 'Σωστές 10 στις 10', '00:00:56', 'movies', '2021-05-03 13:08:51', '2021-05-03 13:08:51', 'Συμπλήρωση-κενού'),
	(81, 16, 'Σωστές 20 στις 20', '00:01:15', 'actors', '2021-05-03 13:13:37', '2021-05-03 13:13:37', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(82, 16, 'Σωστές 10 στις 10', '00:00:38', 'movies', '2021-05-03 13:14:36', '2021-05-03 13:14:36', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(83, 16, 'Σωστές 18 στις 20', '00:00:43', 'actors', '2021-05-03 13:16:59', '2021-05-03 13:16:59', 'Σωστό-λάθος σε 1 πίνακα'),
	(84, 16, 'Σωστές 10 στις 10', '00:00:23', 'gamers', '2021-05-03 13:17:37', '2021-05-03 13:17:37', 'Σωστό-λάθος σε 2 πίνακες'),
	(85, 16, 'Σωστές 19 στις 20', '00:01:08', 'owners', '2021-05-03 14:07:22', '2021-05-03 14:07:22', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(86, 16, 'Σωστές 10 στις 10', '00:00:40', 'shops', '2021-05-03 14:08:12', '2021-05-03 14:08:12', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(87, 16, 'Σωστές 9 στις 10', '00:00:58', 'shops', '2021-05-03 14:09:17', '2021-05-03 14:09:17', 'Σωστό-λάθος σε 2 πίνακες'),
	(88, 16, 'Σωστές 19 στις 20', '00:01:55', 'owners', '2021-05-03 14:11:18', '2021-05-03 14:11:18', 'Σωστό-λάθος σε 1 πίνακα'),
	(89, 5, 'Σωστές 20 στις 20', '00:01:18', 'owners', '2021-05-04 14:01:22', '2021-05-04 14:01:22', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(90, 5, 'Σωστές 9 στις 10', '00:00:36', 'shops', '2021-05-04 14:02:05', '2021-05-04 14:02:05', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(91, 5, 'Σωστές 10 στις 10', '00:00:26', 'shops', '2021-05-04 14:02:45', '2021-05-04 14:02:45', 'Σωστό-λάθος σε 2 πίνακες'),
	(92, 5, 'Σωστές 20 στις 20', '00:00:45', 'owners', '2021-05-04 14:03:40', '2021-05-04 14:03:40', 'Σωστό-λάθος σε 1 πίνακα'),
	(93, 22, 'Σωστές 14 στις 20', '00:01:40', 'coffee', '2021-05-10 14:28:00', '2021-05-10 14:28:00', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(94, 22, 'Σωστές 16 στις 20', '00:01:03', 'coffee', '2021-05-10 14:29:23', '2021-05-10 14:29:23', 'Σωστό-λάθος σε 1 πίνακα'),
	(95, 22, 'Σωστές 8 στις 10', '00:01:11', 'cafe', '2021-05-10 14:31:04', '2021-05-10 14:31:04', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(96, 22, 'Σωστές 7 στις 10', '00:00:29', 'cafe', '2021-05-10 14:31:51', '2021-05-10 14:31:51', 'Σωστό-λάθος σε 2 πίνακες'),
	(97, 22, 'Σωστές 10 στις 10', '00:00:35', 'cafe', '2021-05-10 14:32:52', '2021-05-10 14:32:52', 'Σωστό-λάθος σε 2 πίνακες'),
	(98, 22, 'Σωστές 20 στις 20', '00:00:53', 'coffee', '2021-05-10 14:33:56', '2021-05-10 14:33:56', 'Σωστό-λάθος σε 1 πίνακα'),
	(99, 5, 'Σωστές 20 στις 20', '00:01:36', 'coffee', '2021-05-12 20:50:27', '2021-05-12 20:50:27', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(100, 5, 'Σωστές 18 στις 20', '00:00:46', 'coffee', '2021-05-12 20:51:24', '2021-05-12 20:51:24', 'Σωστό-λάθος σε 1 πίνακα'),
	(101, 5, 'Σωστές 10 στις 10', '00:00:49', 'cafe', '2021-05-12 20:52:20', '2021-05-12 20:52:20', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(102, 5, 'Σωστές 9 στις 10', '00:00:23', 'cafe', '2021-05-12 20:52:53', '2021-05-12 20:52:53', 'Σωστό-λάθος σε 2 πίνακες'),
	(103, 28, 'Σωστές 18 στις 20', '00:01:40', 'writters', '2021-05-19 18:14:08', '2021-05-19 18:14:08', 'Συμπλήρωση-κενού σε 1 πίνακα'),
	(104, 28, 'Σωστές 9 στις 10', '00:00:40', 'books', '2021-05-19 18:15:22', '2021-05-19 18:15:22', 'Συμπλήρωση-κενού σε 2 πίνακες'),
	(105, 28, 'Σωστές 10 στις 10', '00:00:26', 'books', '2021-05-19 18:15:59', '2021-05-19 18:15:59', 'Σωστό-λάθος σε 2 πίνακες'),
	(106, 28, 'Σωστές 17 στις 20', '00:00:43', 'writters', '2021-05-19 18:16:49', '2021-05-19 18:16:49', 'Σωστό-λάθος σε 1 πίνακα');
/*!40000 ALTER TABLE `success_rate` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.user_table
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE IF NOT EXISTS `user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sex` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `verification_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.user_table: ~11 rows (approximately)
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
REPLACE INTO `user_table` (`id`, `first_name`, `last_name`, `sex`, `phone`, `email`, `username`, `password`, `role`, `verification_code`) VALUES
	(3, 'Dimitris', 'Motsios', 'male', '6395612353', 'www.motsios@hotmail.com', 'motsios', '$2a$10$ONRj/ZAx3inK8XdHbvaz6eR3WawOpKqG4zdLdhLzUa1.Y7lOZD3Yq', 'teacher', '3e248e1e-7a92-4873-908a-93f1a36a4785'),
	(4, 'giorgos', 'pappas', 'male', '6935146987', 'giorgos@gmail.com', 'giorgos', '$2a$10$1X8vht1REou23F.xMl51reymvMVky653wd7ElT5q/JEHGRpuZOFxy', 'teacher', NULL),
	(5, 'Kostas', 'kakkos', 'male', '6935123697', 'kostas@gmail.com', 'kostas', '$2a$10$mezTsIwg.Md7Guklprtk6uLrxmIQy4iUfsu5LxD15DutxhIM9yldq', 'student', '4c2b079d-42bf-4d14-b541-cfd688f22f5c'),
	(16, 'dionisis', 'papakwstas', 'male', '6936547892', 'dionisis@gmail.com', 'dioni', '$2a$10$AJQJhxAZVVTDbJwU75qGm.BW9LDld1qvaGy/n7dkU9Jw2j9jDSMbq', 'student', NULL),
	(22, 'aleksis', 'koumasis', 'male', '6932156941', 'aleksis@gmail.com', 'aleksis', '$2a$10$4kT52oOxyPwuXXU6LCSMY.OkC8uZOKrZXX2NXIdb7/6/N5GQuO9u.', 'student', NULL),
	(23, 'georgia', 'kali', 'female', '6932569515', 'georgia@gmail.com', 'georgia', '$2a$10$jGKcviqvwK3RqFy/kmUvfe3ofLmHU2HiYQw1G0uWjh.8ItYqZB7G.', 'student', NULL),
	(24, 'Iliana', 'papanikou', 'female', '6945611212', 'iliana@gmail.com', 'iliana', '$2a$10$kaBhe10ytWP.RhUxuYwgbe3x1cSG6/R0TUe.MsoMZf77BPAHwJyyi', 'student', NULL),
	(26, 'George', 'Andreou', 'male', '6354567891', 'giorgos@yahoo.gr', 'giorgos93', '$2a$10$m9YdINIylv4V6Rs0NSim3uJJhgGlPb89rRfbMd9SsRXFZU9T14xKa', 'student', NULL),
	(27, 'Γιώργος', 'Κοτσάμπασης', 'male', '6956212345', 'giorgos@hotmail.com', 'giorgakis', '$2a$10$6UjAGNlAT0l7yyFvMUe5m.cNFjkuiyOySqOX3BYHlR2f8oeGWGiju', 'teacher', NULL),
	(28, 'Ηλιάνα', 'Παππά', 'female', '6354123456', 'iliana94@gmail.com', 'iliana94', '$2a$10$/Bwak6vP6USgEEpWeOMO6OIkcYnL5Za1omurjzU7c.Gmj6/87QPAO', 'student', NULL),
	(36, 'adsd', 'asdasd', 'male', '12321313', 'asddad', 'kost', '$2a$10$f5vxpmGcGfyPpTk/RHg28e6wzUXAdbjOM7KQ2a4ObKcjZiFJgiv1a', 'teacher', NULL);
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;

-- Dumping structure for table diplwmatiki.writters
DROP TABLE IF EXISTS `writters`;
CREATE TABLE IF NOT EXISTS `writters` (
  `idwritter` int(12) NOT NULL,
  `name` varchar(22) COLLATE utf8_bin NOT NULL,
  `surname` varchar(22) COLLATE utf8_bin NOT NULL,
  `gender` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `isAlive` tinyint(4) NOT NULL,
  PRIMARY KEY (`idwritter`),
  KEY `idwritter` (`idwritter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table diplwmatiki.writters: ~8 rows (approximately)
/*!40000 ALTER TABLE `writters` DISABLE KEYS */;
REPLACE INTO `writters` (`idwritter`, `name`, `surname`, `gender`, `birthdate`, `isAlive`) VALUES
	(1, 'dimitris', 'motsios', 'male', '1994-01-01 00:00:00', 1),
	(2, 'kostas', 'mixas', 'male', NULL, 1),
	(3, 'ilianna', 'pappa', 'female', '1993-01-03 00:00:00', 1),
	(4, 'panagiota', 'pappa', 'female', '2001-03-06 00:00:00', 1),
	(5, 'konstantina', 'pournara', 'female', NULL, 0),
	(6, 'georgia', 'iliados', 'female', '1965-03-03 00:00:00', 0),
	(7, 'kostas', 'kakkos', 'male', '1999-03-03 00:00:00', 0),
	(8, 'dimitris', 'poli', 'male', '1999-03-03 00:00:00', 1),
	(9, 'panorea', 'pappa', 'female', '2001-02-03 00:00:00', 1),
	(10, 'dimitra', 'apostolidi', 'female', NULL, 0);
/*!40000 ALTER TABLE `writters` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
