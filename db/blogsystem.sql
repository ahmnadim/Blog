-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2019 at 07:23 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Laravel', 'laravel', 'laravel-2019-04-24-5cc090fe90c77.jpg', '2019-04-24 10:38:23', '2019-04-24 10:38:23'),
(2, 'Codeigniter', 'codeigniter', 'codeigniter-2019-04-24-5cc0910e1efb8.jpg', '2019-04-24 10:38:38', '2019-04-24 10:38:38'),
(3, 'Programming', 'programming', 'programming-2019-04-24-5cc0913a57ff2.png', '2019-04-24 10:39:22', '2019-04-24 10:39:22'),
(4, 'Cricket', 'cricket', 'cricket-2019-04-24-5cc09145eb219.jpg', '2019-04-24 10:39:34', '2019-04-24 10:39:34'),
(5, 'Football', 'football', 'football-2019-04-24-5cc0914f2e0d1.jpg', '2019-04-24 10:39:43', '2019-04-24 10:39:43'),
(6, 'Database', 'database', 'database-2019-04-24-5cc091773e7ad.jpg', '2019-04-24 10:40:23', '2019-04-24 10:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `category_post`
--

CREATE TABLE `category_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_post`
--

INSERT INTO `category_post` (`id`, `category_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-04-24 10:43:45', '2019-04-24 10:43:45'),
(2, 3, 1, '2019-04-24 10:43:45', '2019-04-24 10:43:45'),
(3, 2, 2, '2019-04-24 10:46:01', '2019-04-24 10:46:01'),
(4, 3, 2, '2019-04-24 10:46:01', '2019-04-24 10:46:01'),
(5, 3, 3, '2019-04-24 10:47:37', '2019-04-24 10:47:37'),
(6, 3, 4, '2019-04-24 10:49:52', '2019-04-24 10:49:52'),
(7, 6, 4, '2019-04-24 10:49:52', '2019-04-24 10:49:52'),
(8, 4, 5, '2019-04-24 10:59:40', '2019-04-24 10:59:40'),
(9, 5, 6, '2019-04-24 11:00:56', '2019-04-24 11:00:56'),
(10, 3, 7, '2019-04-24 11:06:22', '2019-04-24 11:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_10_23_100841_create_roles_table', 1),
(4, '2018_10_24_033836_create_tags_table', 1),
(5, '2018_11_04_130012_create_categories_table', 1),
(6, '2018_11_05_043804_create_posts_table', 1),
(7, '2018_11_05_045841_create_post_tag_table', 1),
(8, '2018_11_05_045929_create_category_post_table', 1),
(9, '2018_11_07_135828_create_subscribers_table', 1),
(10, '2018_12_08_122803_create_jobs_table', 1),
(11, '2018_12_10_154638_create_post_user_table', 1),
(12, '2018_12_15_121024_create_comments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `image`, `body`, `view_count`, `status`, `is_approved`, `created_at`, `updated_at`) VALUES
(1, 1, 'What is Laravel', 'what-is-laravel', 'what-is-laravel-2019-04-24-5cc092415801d.jpg', '<p>Laravel is a free, open-source PHP web framework, created by Taylor Otwell and intended for the development of web applications following the model&ndash;view&ndash;controller (MVC) architectural pattern and based on Symfony. Some of the features of Laravel are a modular packaging system with a dedicated dependency manager, different ways for accessing relational databases, utilities that aid in application deployment and maintenance, and its orientation toward syntactic sugar.The source code of Laravel is hosted on GitHub and licensed under the terms of MIT License.</p>', 1, 1, 1, '2019-04-24 10:43:45', '2019-04-24 10:44:11'),
(2, 1, 'What is Codeigniter', 'what-is-codeigniter', 'what-is-codeigniter-2019-04-24-5cc092c8d9d45.jpg', '<p>CodeIgniter is loosely based on the popular model&ndash;view&ndash;controller (MVC) development pattern. While controller classes are a necessary part of development under CodeIgniter, models and views are optional. Codeigniter can be also modified to use Hierarchical Model View Controller (HMVC) which allows developers to maintain modular grouping of Controller, Models and View arranged in a sub-directory format.</p>\r\n<p>CodeIgniter is most often noted for its speed when compared to other PHP frameworks. In a critical take on PHP frameworks in general, PHP creator Rasmus Lerdorf spoke at frOSCon in August 2008, noting that he liked CodeIgniter \"because it is faster, lighter and the least like a framework.</p>', 1, 1, 1, '2019-04-24 10:46:01', '2019-04-24 10:47:52'),
(3, 1, 'First Lesson about Php', 'first-lesson-about-php', 'first-lesson-about-php-2019-04-24-5cc09328d2de6.png', '<p>PHP: Hypertext Preprocessor (or simply PHP) is a general-purpose programming language originally designed for web development. It was originally created by Rasmus Lerdorf in 1994 the PHP reference implementation is now produced by The PHP Group. PHP originally stood for Personal Home Page, but it now stands for the recursive initialism PHP: Hypertext Preprocessor.</p>\r\n<p>PHP code may be executed with a command line interface (CLI), embedded into HTML code, or it can be used in combination with various web template systems, web content management systems, and web frameworks. PHP code is usually processed by a PHP interpreter implemented as a module in a web server or as a Common Gateway Interface (CGI) executable. The web server combines the results of the interpreted and executed PHP code, which may be any type of data, including images, with the generated web page. PHP can be used for many programming tasks outside of the web context, such as standalone graphical applications and robotic drone control.</p>\r\n<p>The standard PHP interpreter, powered by the Zend Engine, is free software released under the PHP License. PHP has been widely ported and can be deployed on most web servers on almost every operating system and platform, free of charge.The PHP language evolved without a written formal specification or standard until 2014, with the original implementation acting as the de facto standard which other implementations aimed to follow. Since 2014, work has gone on to create a formal PHP specification.</p>', 2, 1, 1, '2019-04-24 10:47:37', '2019-04-24 11:17:14'),
(4, 1, 'How to use MySQL with PHP', 'how-to-use-mysql-with-php', 'how-to-use-mysql-with-php-2019-04-24-5cc093b002100.jpg', '<p>MySQL (/ˌmaɪˌɛsˌkjuːˈɛl/ \"My S-Q-L\")[5] is an open-source relational database management system (RDBMS).[6] Its name is a combination of \"My\", the name of co-founder Michael Widenius\'s daughter,[7] and \"SQL\", the abbreviation for Structured Query Language.</p>\r\n<p>MySQL is free and open-source software under the terms of the GNU General Public License, and is also available under a variety of proprietary licenses. MySQL was owned and sponsored by the Swedish company MySQL AB, which was bought by Sun Microsystems (now Oracle Corporation).[8] In 2010, when Oracle acquired Sun, Widenius forked the open-source MySQL project to create MariaDB.</p>\r\n<p>MySQL is a component of the LAMP web application software stack (and others), which is an acronym for Linux, Apache, MySQL, Perl/PHP/Python. MySQL is used by many database-driven web applications, including Drupal, Joomla, phpBB, and WordPress. MySQL is also used by many popular websites, including Facebook,[9][10][11] Twitter,[12] Flickr,[13] and YouTube.</p>', 0, 1, 1, '2019-04-24 10:49:52', '2019-04-24 10:49:52'),
(5, 2, 'The gentlemen\'s game Cricket', 'the-gentlemens-game-cricket', 'the-gentlemens-game-cricket-2019-04-24-5cc095fb8d5ef.jpg', '<p>Cricket is a bat-and-ball game played between two teams of eleven players on a field at the centre of which is a 20-metre (22-yard) pitch with a wicket at each end, each comprising two bails balanced on three stumps. The batting side scores runs by striking the ball bowled at the wicket with the bat, while the bowling and fielding side tries to prevent this and dismiss each player (so they are \"out\"). Means of dismissal include being bowled, when the ball hits the stumps and dislodges the bails, and by the fielding side catching the ball after it is hit by the bat, but before it hits the ground. When ten players have been dismissed, the innings ends and the teams swap roles. The game is adjudicated by two umpires, aided by a third umpire and match referee in international matches. They communicate with two off-field scorers who record the match\'s statistical information.</p>\r\n<p>There are various formats ranging from Twenty20, played over a few hours with each team batting for a single innings of 20 overs, to Test matches, played over five days with unlimited overs and the teams each batting for two innings of unlimited length. Traditionally cricketers play in all-white kit, but in limited overs cricket they wear club or team colours. In addition to the basic kit, some players wear protective gear to prevent injury caused by the ball, which is a hard, solid spheroid made of compressed leather with a slightly raised sewn seam enclosing a cork core which is layered with tightly wound string.</p>\r\n<p>Historically, cricket\'s origins are uncertain and the earliest definite reference is in south-east England in the middle of the 16th century. It spread globally with the expansion of the British Empire, leading to the first international matches in the second half of the 19th century. The game\'s governing body is the International Cricket Council (ICC), which has over 100 members, twelve of which are full members who play Test matches. The game\'s rules are held in a code called the Laws of Cricket which is owned and maintained by Marylebone Cricket Club (MCC) in London. The sport is followed primarily in the Indian subcontinent, Australasia, the United Kingdom, Ireland, southern Africa and the West Indies, its globalisation occurring during the expansion of the British Empire and remaining popular into the 21st century.[1] Women\'s cricket, which is organised and played separately, has also achieved international standard. The most successful side playing international cricket is Australia, having won seven One Day International trophies, including five World Cups, more than any other country and having been the top-rated Test side more than any other country.</p>\r\n<p>&nbsp;</p>', 0, 1, 1, '2019-04-24 10:59:39', '2019-04-24 10:59:39'),
(6, 2, 'This article is about the overall concept of games called football.', 'this-article-is-about-the-overall-concept-of-games-called-football', 'this-article-is-about-the-overall-concept-of-games-called-football-2019-04-24-5cc09648846f9.jpg', '<p>Football is a family of team sports that involve, to varying degrees, kicking a ball to score a goal. Unqualified, the word football is understood to refer to whichever form of football is the most popular in the regional context in which the word appears. Sports commonly called football in certain places include association football (known as soccer in some countries); gridiron football (specifically American football or Canadian football); Australian rules football; rugby football (either rugby league or rugby union); and Gaelic football.[1][2] These different variations of football are known as football codes.</p>\r\n<p>There are a number of references to traditional, ancient, or prehistoric ball games played by indigenous peoples in many different parts of the world.[3][4][5] Contemporary codes of football can be traced back to the codification of these games at English public schools during the nineteenth century.[6][7] The expansion of the British Empire allowed these rules of football to spread to areas of British influence outside the directly controlled Empire.[8] By the end of the nineteenth century, distinct regional codes were already developing: Gaelic football, for example, deliberately incorporated the rules of local traditional football games in order to maintain their heritage.[9] In 1888, The Football League was founded in England, becoming the first of many professional football competitions. During the twentieth century, several of the various kinds of football grew to become some of the most popular team sports in the world.[10]</p>\r\n<p>The various codes of football share certain common elements and can be grouped into two main classes of football: carrying codes like American football, Canadian football, rugby union and rugby league, where the ball is moved about the field while being held in the hands or thrown, and kicking codes such as Association football and Gaelic football, where the ball is moved primarily with the feet, and where handling is strictly limited.[11]</p>\r\n<p>Common rules among the sports include:[12]</p>\r\n<p>Two teams of usually between 11 and 18 players; some variations that have fewer players (five or more per team) are also popular.<br />A clearly defined area in which to play the game.<br />Scoring goals or points by moving the ball to an opposing team\'s end of the field and either into a goal area, or over a line.<br />Goals or points resulting from players putting the ball between two goalposts.<br />The goal or line being defended by the opposing team.<br />Players being required to move the ball&mdash;depending on the code&mdash;by kicking, carrying, or hand-passing the ball.<br />Players using only their body to move the ball.<br />In all codes, common skills include passing, tackling, evasion of tackles, catching and kicking.[11] In most codes, there are rules restricting the movement of players offside, and players scoring a goal must put the ball either under or over a crossbar between the goalposts.</p>', 1, 1, 1, '2019-04-24 11:00:56', '2019-04-24 11:16:51'),
(7, 2, 'For the uses of JavaScript', 'for-the-uses-of-javascript', 'for-the-uses-of-javascript-2019-04-24-5cc0978d99d23.png', '<p>JavaScript (/ˈdʒɑːvəˌskrɪpt/),[8] often abbreviated as JS, is a high-level, interpreted programming language that conforms to the ECMAScript specification. JavaScript has curly-bracket syntax, dynamic typing, prototype-based object-orientation, and first-class functions.</p>\r\n<p>Alongside HTML and CSS, JavaScript is one of the core technologies of the World Wide Web.[9] JavaScript enables interactive web pages and is an essential part of web applications. The vast majority of websites use it,[10] and major web browsers have a dedicated JavaScript engine to execute it.</p>\r\n<p>As a multi-paradigm language, JavaScript supports event-driven, functional, and imperative (including object-oriented and prototype-based) programming styles. It has APIs for working with text, arrays, dates, regular expressions, and the DOM, but the language itself does not include any I/O, such as networking, storage, or graphics facilities. It relies upon the host environment in which it is embedded to provide these features.</p>\r\n<p>Initially only implemented client-side in web browsers, JavaScript engines are now embedded in many other types of host software, including server-side in web servers and databases, and in non-web programs such as word processors and PDF software, and in runtime environments that make JavaScript available for writing mobile and desktop applications, including desktop widgets.</p>\r\n<p>The terms Vanilla JavaScript and Vanilla JS refer to JavaScript not extended by any frameworks or additional libraries. Scripts written in Vanilla JS are plain JavaScript code.[11][12]</p>\r\n<p>Although there are similarities between JavaScript and Java, including language name, syntax, and respective standard libraries, the two languages are distinct and differ greatly in design. JavaScript was influenced by programming languages such as Self and Scheme.[13]</p>\r\n<p>In 1993, the&nbsp;<a title=\"National Center for Supercomputing Applications\" href=\"https://en.wikipedia.org/wiki/National_Center_for_Supercomputing_Applications\">National Center for Supercomputing Applications</a>&nbsp;(NCSA), a unit of the&nbsp;<a title=\"University of Illinois at Urbana&ndash;Champaign\" href=\"https://en.wikipedia.org/wiki/University_of_Illinois_at_Urbana%E2%80%93Champaign\">University of Illinois at Urbana-Champaign</a>, released&nbsp;<a title=\"Mosaic (web browser)\" href=\"https://en.wikipedia.org/wiki/Mosaic_(web_browser)\">NCSA Mosaic</a>, the first popular graphical&nbsp;<a title=\"Web browser\" href=\"https://en.wikipedia.org/wiki/Web_browser\">Web browser</a>, which played an important part in expanding the growth of the nascent&nbsp;<a title=\"World Wide Web\" href=\"https://en.wikipedia.org/wiki/World_Wide_Web\">World Wide Web</a>&nbsp;beyond the&nbsp;<a title=\"NeXTSTEP\" href=\"https://en.wikipedia.org/wiki/NeXTSTEP\">NeXTSTEP</a>&nbsp;niche where the&nbsp;<a title=\"WorldWideWeb\" href=\"https://en.wikipedia.org/wiki/WorldWideWeb\">WorldWideWeb</a>&nbsp;had formed three years earlier. In 1994, a company called&nbsp;<a title=\"Netscape\" href=\"https://en.wikipedia.org/wiki/Netscape\">Mosaic Communications</a>&nbsp;was founded in&nbsp;<a title=\"Mountain View, California\" href=\"https://en.wikipedia.org/wiki/Mountain_View,_California\">Mountain View, California</a>&nbsp;and employed many of the original NCSA Mosaic authors to create&nbsp;<a title=\"Netscape Navigator\" href=\"https://en.wikipedia.org/wiki/Netscape_Navigator\">Mosaic Netscape</a>. However, it intentionally shared no code with NCSA Mosaic. The internal codename for the company\'s browser was&nbsp;<a title=\"Mozilla\" href=\"https://en.wikipedia.org/wiki/Mozilla\">Mozilla</a>, a portmanteau of \"Mosaic and Godzilla\"<sup id=\"cite_ref-google_14-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/JavaScript#cite_note-google-14\">[14]</a></sup>&nbsp;. The first version of the Web browser, Mosaic Netscape 0.9, was released in late 1994. Within four months it had already taken three-quarters of the browser market and became the main web browser for the 1990s. To avoid trademark ownership problems with the NCSA, the browser was subsequently renamed Netscape Navigator in the same year, and the company took the name Netscape Communications. Netscape Communications realized that the Web needed to become more dynamic.&nbsp;<a title=\"Marc Andreessen\" href=\"https://en.wikipedia.org/wiki/Marc_Andreessen\">Marc Andreessen</a>, the founder of the company, believed that&nbsp;<a title=\"HTML\" href=\"https://en.wikipedia.org/wiki/HTML\">HTML</a>&nbsp;needed a \"glue language\" that was easy to use by Web designers and part-time programmers to assemble components such as images and plugins, where the code could be written directly in the Web page markup.</p>\r\n<p>In 1995, Netscape Communications recruited&nbsp;<a title=\"Brendan Eich\" href=\"https://en.wikipedia.org/wiki/Brendan_Eich\">Brendan Eich</a>&nbsp;with the goal of embedding the&nbsp;<a title=\"Scheme (programming language)\" href=\"https://en.wikipedia.org/wiki/Scheme_(programming_language)\">Scheme</a>&nbsp;programming language into its Netscape Navigator.<sup id=\"cite_ref-15\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/JavaScript#cite_note-15\">[15]</a></sup>&nbsp;Before he could get started, Netscape Communications collaborated with&nbsp;<a title=\"Sun Microsystems\" href=\"https://en.wikipedia.org/wiki/Sun_Microsystems\">Sun Microsystems</a>&nbsp;to include in Netscape Navigator Sun\'s more static programming language&nbsp;<a title=\"Java (programming language)\" href=\"https://en.wikipedia.org/wiki/Java_(programming_language)\">Java</a>, in order to compete with&nbsp;<a title=\"Microsoft\" href=\"https://en.wikipedia.org/wiki/Microsoft\">Microsoft</a>&nbsp;for user adoption of Web technologies and platforms.<sup id=\"cite_ref-16\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/JavaScript#cite_note-16\">[16]</a></sup>&nbsp;Netscape Communications then decided that the scripting language they wanted to create would complement Java and should have a similar syntax, which excluded adopting other languages such as&nbsp;<a title=\"\" href=\"https://en.wikipedia.org/wiki/Perl\">Perl</a>,&nbsp;<a title=\"Python (programming language)\" href=\"https://en.wikipedia.org/wiki/Python_(programming_language)\">Python</a>,&nbsp;<a title=\"Tcl\" href=\"https://en.wikipedia.org/wiki/Tcl\">TCL</a>, or Scheme. To defend the idea of JavaScript against competing proposals, the company needed a prototype. Eich wrote one in 10 days, in May 1995.</p>', 0, 1, 1, '2019-04-24 11:06:22', '2019-04-24 11:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2019-04-24 10:43:45', '2019-04-24 10:43:45'),
(2, 1, 7, '2019-04-24 10:43:45', '2019-04-24 10:43:45'),
(3, 1, 8, '2019-04-24 10:43:45', '2019-04-24 10:43:45'),
(4, 2, 3, '2019-04-24 10:46:01', '2019-04-24 10:46:01'),
(5, 2, 8, '2019-04-24 10:46:01', '2019-04-24 10:46:01'),
(6, 2, 9, '2019-04-24 10:46:01', '2019-04-24 10:46:01'),
(7, 3, 3, '2019-04-24 10:47:37', '2019-04-24 10:47:37'),
(8, 3, 8, '2019-04-24 10:47:37', '2019-04-24 10:47:37'),
(9, 4, 3, '2019-04-24 10:49:52', '2019-04-24 10:49:52'),
(10, 4, 8, '2019-04-24 10:49:52', '2019-04-24 10:49:52'),
(11, 4, 13, '2019-04-24 10:49:52', '2019-04-24 10:49:52'),
(12, 4, 14, '2019-04-24 10:49:52', '2019-04-24 10:49:52'),
(13, 5, 1, '2019-04-24 10:59:40', '2019-04-24 10:59:40'),
(14, 5, 2, '2019-04-24 10:59:40', '2019-04-24 10:59:40'),
(15, 5, 5, '2019-04-24 10:59:40', '2019-04-24 10:59:40'),
(16, 6, 1, '2019-04-24 11:00:56', '2019-04-24 11:00:56'),
(17, 6, 2, '2019-04-24 11:00:56', '2019-04-24 11:00:56'),
(18, 6, 6, '2019-04-24 11:00:56', '2019-04-24 11:00:56'),
(19, 7, 3, '2019-04-24 11:06:22', '2019-04-24 11:06:22'),
(20, 7, 10, '2019-04-24 11:06:22', '2019-04-24 11:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `post_user`
--

CREATE TABLE `post_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_user`
--

INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2019-04-24 10:47:47', '2019-04-24 10:47:47'),
(2, 3, 1, '2019-04-24 10:51:56', '2019-04-24 10:51:56'),
(3, 1, 2, '2019-04-24 11:07:07', '2019-04-24 11:07:07'),
(4, 5, 2, '2019-04-24 11:07:13', '2019-04-24 11:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, NULL),
(2, 'Author', 'author', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Sports', 'sports', '2019-04-24 10:29:26', '2019-04-24 10:29:26'),
(2, 'International', 'international', '2019-04-24 10:29:44', '2019-04-24 10:29:44'),
(3, 'Education', 'education', '2019-04-24 10:30:56', '2019-04-24 10:30:56'),
(4, 'Economics', 'economics', '2019-04-24 10:31:16', '2019-04-24 10:31:16'),
(5, 'Cricket', 'cricket', '2019-04-24 10:31:25', '2019-04-24 10:31:25'),
(6, 'Football', 'football', '2019-04-24 10:31:33', '2019-04-24 10:31:33'),
(7, 'Laravel', 'laravel', '2019-04-24 10:31:41', '2019-04-24 10:31:41'),
(8, 'PHP', 'php', '2019-04-24 10:31:49', '2019-04-24 10:31:49'),
(9, 'Condeigniter', 'condeigniter', '2019-04-24 10:31:58', '2019-04-24 10:31:58'),
(10, 'Javascript', 'javascript', '2019-04-24 10:32:06', '2019-04-24 10:32:06'),
(11, 'Html', 'html', '2019-04-24 10:32:13', '2019-04-24 10:32:13'),
(12, 'Css', 'css', '2019-04-24 10:32:17', '2019-04-24 10:32:17'),
(13, 'MySql', 'mysql', '2019-04-24 10:32:26', '2019-04-24 10:32:26'),
(14, 'Query Builder', 'query-builder', '2019-04-24 10:32:36', '2019-04-24 10:32:36'),
(15, 'Migration', 'migration', '2019-04-24 10:32:42', '2019-04-24 10:32:42'),
(16, 'Session', 'session', '2019-04-24 10:32:52', '2019-04-24 10:32:52'),
(17, 'Coockie', 'coockie', '2019-04-24 10:32:58', '2019-04-24 10:32:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `about` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `password`, `image`, `about`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ahmad Ul Hoq Nadim', 'nadim@gmail.com', '$2y$10$aiQUrs.0NobkBaZBoGXJ9.R8qfC5agzc3mDooF48kw8u3KOUB3pnm', 'ahmad-ul-hoq-nadim-2019-04-24-5cc0941e1106f.jpg', 'This is Ahmad ul hoq Nadim. laravel is my one of the favorite technology.', 'OrumTHr3vBMpDHVohfbBORbSP1nQPlxxZnXEUIijQgxay4mnYfFuvtFxBi8g', NULL, '2019-04-24 10:51:42'),
(2, 2, 'Md. Author', 'author@gmail.com', '$2y$10$HGIY01p97N39iZ6MSRH7UeRA5ewMosEnzKZgzMbvOoPyZDUomvYhW', 'md-author-2019-04-24-5cc09570a4d26.jpg', 'This is about Author', NULL, NULL, '2019-04-24 10:57:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_user`
--
ALTER TABLE `post_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_user_post_id_foreign` (`post_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `post_user`
--
ALTER TABLE `post_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_user`
--
ALTER TABLE `post_user`
  ADD CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
