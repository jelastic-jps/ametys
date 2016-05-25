-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Сен 04 2014 г., 14:04
-- Версия сервера: 5.6.17
-- Версия PHP: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `ametys`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Cache_RA_Back`
--

CREATE TABLE IF NOT EXISTS `Cache_RA_Back` (
  `Internal_Uuid` varchar(255) NOT NULL,
  `Page_Id` varchar(255) NOT NULL,
  `Page_Path_Hash` varchar(255) NOT NULL,
  `Page_Path` text NOT NULL,
  `Rendering_Context` varchar(255) NOT NULL,
  `Workspace_JCR` varchar(255) NOT NULL,
  `Cacheable` tinyint(1) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Processed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Cache_RA_Back_Page_Element`
--

CREATE TABLE IF NOT EXISTS `Cache_RA_Back_Page_Element` (
  `Internal_Uuid` varchar(255) NOT NULL,
  `Page_Element_Id` varchar(255) NOT NULL,
  `Page_Element_Type` varchar(255) NOT NULL,
  `Page_Id` varchar(255) NOT NULL,
  `Rendering_Context` varchar(255) NOT NULL,
  `Workspace_JCR` varchar(255) NOT NULL,
  `Cacheable` tinyint(1) NOT NULL,
  `Cache_Hit` tinyint(1) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Processed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Cache_RA_Front`
--

CREATE TABLE IF NOT EXISTS `Cache_RA_Front` (
  `Unique_Id` varchar(255) NOT NULL,
  `Internal_Uuid` varchar(255) NOT NULL,
  `Site` varchar(255) NOT NULL,
  `Ametys_Path_Hash` varchar(255) NOT NULL,
  `Ametys_Path` text NOT NULL,
  `Cacheable` tinyint(1) NOT NULL,
  `Cache_Hit_1` tinyint(1) NOT NULL,
  `Cache_Hit_2` tinyint(1) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Processed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Cache_RA_HTTPServer`
--

CREATE TABLE IF NOT EXISTS `Cache_RA_HTTPServer` (
  `Unique_Id` varchar(255) NOT NULL,
  `Site` varchar(255) NOT NULL,
  `Request_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Method` varchar(255) NOT NULL,
  `Path_Hash` varchar(255) NOT NULL,
  `Path` text NOT NULL,
  `Query_String` text NOT NULL,
  `Ori_Status_Code` char(3) NOT NULL,
  `Ret_Status_Code` char(3) NOT NULL,
  `Cache_Hit` tinyint(1) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Unique_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Cache_Stats_Back`
--

CREATE TABLE IF NOT EXISTS `Cache_Stats_Back` (
  `Page_Id` varchar(255) NOT NULL,
  `Page_Path_Hash` varchar(255) NOT NULL,
  `Page_Path` text NOT NULL,
  `Rendering_Context` varchar(255) NOT NULL,
  `Workspace_JCR` varchar(255) NOT NULL,
  `Cacheable` tinyint(1) NOT NULL,
  `Hits` int(11) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Updated_At` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Page_Id`,`Rendering_Context`,`Workspace_JCR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Cache_Stats_Back_Page_Element`
--

CREATE TABLE IF NOT EXISTS `Cache_Stats_Back_Page_Element` (
  `Page_Element_Id` varchar(255) NOT NULL,
  `Page_Id` varchar(255) NOT NULL,
  `Rendering_Context` varchar(255) NOT NULL,
  `Workspace_JCR` varchar(255) NOT NULL,
  `Cacheable` tinyint(1) NOT NULL,
  `Hits` int(11) NOT NULL,
  `Cache_Hits` int(11) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Updated_At` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Page_Element_Id`,`Page_Id`,`Rendering_Context`,`Workspace_JCR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Cache_Stats_Front`
--

CREATE TABLE IF NOT EXISTS `Cache_Stats_Front` (
  `Server_Site` varchar(255) NOT NULL DEFAULT '-',
  `Server_Path_Hash` varchar(255) NOT NULL DEFAULT '-',
  `Server_Path` text,
  `Server_Hits` int(11) NOT NULL DEFAULT '0',
  `Server_Cache_Hits` int(11) NOT NULL DEFAULT '0',
  `Front_Site` varchar(255) NOT NULL DEFAULT '-',
  `Front_Path_Hash` varchar(255) NOT NULL DEFAULT '-',
  `Front_Path` text,
  `Front_Cacheable` tinyint(1) NOT NULL DEFAULT '0',
  `Front_Hits` int(11) NOT NULL DEFAULT '0',
  `Front_Cache_Hits_1` int(11) NOT NULL DEFAULT '0',
  `Front_Cache_Hits_2` int(11) NOT NULL DEFAULT '0',
  `Created_At` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Updated_At` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `Server_Site` (`Server_Site`,`Server_Path_Hash`,`Front_Site`,`Front_Path_Hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `FOUserPreferences`
--

CREATE TABLE IF NOT EXISTS `FOUserPreferences` (
  `login` varchar(255) NOT NULL,
  `context` varchar(128) NOT NULL,
  `data` longblob,
  PRIMARY KEY (`login`,`context`),
  KEY `login` (`login`),
  KEY `context` (`context`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `FOUsers`
--

CREATE TABLE IF NOT EXISTS `FOUsers` (
  `login` varchar(255) NOT NULL,
  `firstname` varchar(64) DEFAULT NULL,
  `lastname` varchar(64) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Groups`
--

CREATE TABLE IF NOT EXISTS `Groups` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Label` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Groups_Users`
--

CREATE TABLE IF NOT EXISTS `Groups_Users` (
  `Group_Id` int(11) NOT NULL,
  `Login` varchar(200) NOT NULL,
  PRIMARY KEY (`Group_Id`,`Login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Newsletter_Subscribers`
--

CREATE TABLE IF NOT EXISTS `Newsletter_Subscribers` (
  `Email` varchar(255) NOT NULL,
  `Site_Name` varchar(48) NOT NULL,
  `Category` varchar(64) NOT NULL,
  `Subscribed_At` datetime NOT NULL,
  `Token` varchar(64) NOT NULL,
  PRIMARY KEY (`Email`,`Site_Name`,`Category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Rights_GroupRights`
--

CREATE TABLE IF NOT EXISTS `Rights_GroupRights` (
  `Profile_Id` int(11) NOT NULL,
  `Group_Id` varchar(200) NOT NULL,
  `Context` varchar(200) NOT NULL,
  PRIMARY KEY (`Profile_Id`,`Group_Id`,`Context`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Rights_Profile`
--

CREATE TABLE IF NOT EXISTS `Rights_Profile` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Label` varchar(200) DEFAULT NULL,
  `Context` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `Rights_ProfileRights`
--

CREATE TABLE IF NOT EXISTS `Rights_ProfileRights` (
  `Profile_Id` int(11) NOT NULL,
  `Right_Id` varchar(200) NOT NULL,
  PRIMARY KEY (`Profile_Id`,`Right_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Rights_UserRights`
--

CREATE TABLE IF NOT EXISTS `Rights_UserRights` (
  `Profile_Id` int(11) NOT NULL,
  `Login` varchar(200) NOT NULL,
  `Context` varchar(200) NOT NULL,
  PRIMARY KEY (`Profile_Id`,`Login`,`Context`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `UserPreferences`
--

CREATE TABLE IF NOT EXISTS `UserPreferences` (
  `login` varchar(32) NOT NULL,
  `context` varchar(128) NOT NULL,
  `data` longblob,
  PRIMARY KEY (`login`,`context`),
  KEY `login` (`login`),
  KEY `context` (`context`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `login` varchar(64) NOT NULL,
  `firstname` varchar(64) DEFAULT NULL,
  `lastname` varchar(64) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Users_PasswordChange`
--

CREATE TABLE IF NOT EXISTS `Users_PasswordChange` (
  `site` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `request_date` datetime NOT NULL,
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`site`,`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `Users_Temp`
--

CREATE TABLE IF NOT EXISTS `Users_Temp` (
  `site` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `subscription_date` datetime NOT NULL,
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`site`,`email`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
