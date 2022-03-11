-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for flexdash
CREATE DATABASE IF NOT EXISTS `flexdash` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `flexdash`;

-- Dumping structure for table flexdash.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table flexdash.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table flexdash.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.auth_permission: ~28 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add content type', 4, 'add_contenttype'),
	(14, 'Can change content type', 4, 'change_contenttype'),
	(15, 'Can delete content type', 4, 'delete_contenttype'),
	(16, 'Can view content type', 4, 'view_contenttype'),
	(17, 'Can add session', 5, 'add_session'),
	(18, 'Can change session', 5, 'change_session'),
	(19, 'Can delete session', 5, 'delete_session'),
	(20, 'Can view session', 5, 'view_session'),
	(21, 'Can add user', 6, 'add_user'),
	(22, 'Can change user', 6, 'change_user'),
	(23, 'Can delete user', 6, 'delete_user'),
	(24, 'Can view user', 6, 'view_user'),
	(25, 'Can add query', 7, 'add_query'),
	(26, 'Can change query', 7, 'change_query'),
	(27, 'Can delete query', 7, 'delete_query'),
	(28, 'Can view query', 7, 'view_query'),
	(29, 'Can add component', 8, 'add_component'),
	(30, 'Can change component', 8, 'change_component'),
	(31, 'Can delete component', 8, 'delete_component'),
	(32, 'Can view component', 8, 'view_component'),
	(33, 'Can add layout', 9, 'add_layout'),
	(34, 'Can change layout', 9, 'change_layout'),
	(35, 'Can delete layout', 9, 'delete_layout'),
	(36, 'Can view layout', 9, 'view_layout'),
	(37, 'Can add dashboard', 10, 'add_dashboard'),
	(38, 'Can change dashboard', 10, 'change_dashboard'),
	(39, 'Can delete dashboard', 10, 'delete_dashboard'),
	(40, 'Can view dashboard', 10, 'view_dashboard'),
	(41, 'Can add config', 11, 'add_config'),
	(42, 'Can change config', 11, 'change_config'),
	(43, 'Can delete config', 11, 'delete_config'),
	(44, 'Can view config', 11, 'view_config');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table flexdash.dash_component
CREATE TABLE IF NOT EXISTS `dash_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `author` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `uuid` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `component_name` (`name`),
  KEY `component_author_496dc400_fk_user_id` (`author`),
  KEY `component_updated_by_77dab664_fk_user_id` (`updated_by`),
  CONSTRAINT `component_author_496dc400_fk_user_id` FOREIGN KEY (`author`) REFERENCES `user` (`id`),
  CONSTRAINT `component_updated_by_77dab664_fk_user_id` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.dash_component: ~3 rows (approximately)
/*!40000 ALTER TABLE `dash_component` DISABLE KEYS */;
INSERT INTO `dash_component` (`id`, `name`, `description`, `title`, `date_created`, `date_updated`, `data`, `author`, `updated_by`, `uuid`) VALUES
	(20, '1810290b-8136-4c5c-83c4-8099e016e3c7', '', '', '2022-03-07 13:50:27.519556', '2022-03-07 13:50:27.519556', '{"id": null, "name": "1810290b-8136-4c5c-83c4-8099e016e3c7", "description": "", "title": "", "component_type": "TABLE", "query": {"query_selection": "2", "query": "SELECT * FROM world.country WHERE SurfaceArea > 1000000", "query_selected_fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"], "query_fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"]}, "visualization": {"visualization_type": "TS", "visualization_tab": "data-visualization-tables"}, "data_config": {"fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"]}}', NULL, NULL, '1810290b-8136-4c5c-83c4-8099e016e3c7'),
	(21, 'xxxxx', '', '', '2022-03-09 19:01:22.187295', '2022-03-09 19:01:22.187295', '{"id": null, "name": "xxxxx", "description": "", "title": "", "component_type": "GRAPH", "query": {"query_selection": "12", "query": "SELECT continent,\\tCOUNT(*) as total FROM world.country GROUP BY continent;", "query_selected_fields": ["continent", "total"], "query_fields": ["continent", "total"]}, "visualization": {"visualization_type": "G1N", "visualization_tab": "data-visualization-graphs"}, "data_config": {"fields": ["continent", "total"]}}', NULL, NULL, NULL),
	(22, 'xxxxxxxxxxxxddsds', '', '', '2022-03-09 19:03:48.783394', '2022-03-09 19:04:46.258105', '{"id": 22, "uuid": "0a0b502b-402a-4a71-8958-26863ac586e6", "name": "xxxxxxxxxxxxddsds", "description": "", "title": "", "component_type": "TABLE", "query": {"query_selection": "1", "query": "SELECT DISTINCT (continent) FROM world.country;", "query_selected_fields": ["continent"], "query_fields": ["continent"]}, "visualization": {"visualization_type": "TS", "visualization_tab": "data-visualization-tables"}, "data_config": {"fields": ["continent"]}}', NULL, NULL, '0a0b502b-402a-4a71-8958-26863ac586e6');
/*!40000 ALTER TABLE `dash_component` ENABLE KEYS */;

-- Dumping structure for table flexdash.dash_config
CREATE TABLE IF NOT EXISTS `dash_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `date` datetime(6) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `dashboard` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dash_config_author_aaebb991_fk_user_id` (`author`),
  KEY `dash_config_dashboard_7f9c3c39_fk_dash_dashboard_id` (`dashboard`),
  CONSTRAINT `dash_config_author_aaebb991_fk_user_id` FOREIGN KEY (`author`) REFERENCES `user` (`id`),
  CONSTRAINT `dash_config_dashboard_7f9c3c39_fk_dash_dashboard_id` FOREIGN KEY (`dashboard`) REFERENCES `dash_dashboard` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.dash_config: ~1 rows (approximately)
/*!40000 ALTER TABLE `dash_config` DISABLE KEYS */;
INSERT INTO `dash_config` (`id`, `name`, `date`, `author`, `dashboard`) VALUES
	(2, 'dsasd', '2022-03-01 16:39:41.000000', NULL, 21),
	(3, '579aecf9-b8a8-41c3-9bcd-eed8ad74178c', '2022-03-01 17:00:21.953938', NULL, 21);
/*!40000 ALTER TABLE `dash_config` ENABLE KEYS */;

-- Dumping structure for table flexdash.dash_dashboard
CREATE TABLE IF NOT EXISTS `dash_dashboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `author` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `layout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboard_name` (`name`),
  KEY `dashboard_author_8ef66c6d_fk_user_id` (`author`),
  KEY `dashboard_updated_by_546f3c4a_fk_user_id` (`updated_by`),
  KEY `dashboard_layout_1dce980e_fk_layout_id` (`layout`),
  CONSTRAINT `dashboard_author_8ef66c6d_fk_user_id` FOREIGN KEY (`author`) REFERENCES `user` (`id`),
  CONSTRAINT `dashboard_layout_1dce980e_fk_layout_id` FOREIGN KEY (`layout`) REFERENCES `dash_layout` (`id`),
  CONSTRAINT `dashboard_updated_by_546f3c4a_fk_user_id` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.dash_dashboard: ~7 rows (approximately)
/*!40000 ALTER TABLE `dash_dashboard` DISABLE KEYS */;
INSERT INTO `dash_dashboard` (`id`, `name`, `description`, `title`, `date_created`, `date_updated`, `data`, `author`, `updated_by`, `layout`) VALUES
	(21, 'b6245ee3-df5e-4852-b999-0465239d8781', '', NULL, '2022-01-28 06:58:19.555546', '2022-03-10 14:33:09.157286', '{"0": {"id": null, "name": "1810290b-8136-4c5c-83c4-8099e016e3c7", "description": "", "title": "", "component_type": "TABLE", "query": {"query_selection": "2", "query": "SELECT * FROM world.country WHERE SurfaceArea > 1000000", "query_selected_fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"], "query_fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"]}, "visualization": {"visualization_type": "TC", "visualization_tab": "data-visualization-tables"}, "data_config": {"fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"]}, "uuid": "a8d54062-6eab-43af-ac58-9bc9a1623617"}, "1": {"id": null, "name": "3843185f-1047-4587-9927-2650ec5e13f4", "description": "", "title": "", "component_type": "GRAPH", "query": {"query_selection": "12", "query": "SELECT continent,\\tCOUNT(*) as total FROM world.country GROUP BY continent;", "query_selected_fields": [], "query_fields": []}, "visualization": {"visualization_type": "G1N", "visualization_tab": "data-visualization-graphs"}, "data_config": {"fields": ["continent", "total"]}, "uuid": "506b2773-d520-4a5d-afd3-1f4d1f963fe3"}}', 1, NULL, 2),
	(24, '9c493001-ab31-4a0b-ab2e-f2510f7aa7e4', '', NULL, '2022-01-28 14:09:46.118512', '2022-01-28 14:09:46.118512', '{"0": {"id": null, "name": "3b4929d7-75b4-4cfd-b9a5-70c273148cc0", "description": "", "title": "", "component_type": "INFO", "query": {"query_selection": "13", "query": "SELECT \\n\\tCOUNT(*) AS Count, (SELECT COUNT(*) FROM world.country) AS Total\\nFROM\\n\\tworld.country\\nWHERE \\n\\tworld.country.SurfaceArea > 1000000", "query_selected_fields": [], "query_fields": []}, "visualization": {"visualization_type": "ISL", "visualization_tab": "data-visualization-info"}, "data_config": {"value": "Count", "text_1": "Count", "text_2": "", "icon": "icon ion-md-alert", "fields": []}}, "1": {"id": null, "name": null, "description": null, "title": null, "component_type": null, "query": {"query_selection": null, "query": null, "query_selected_fields": null, "query_fields": null}, "visualization": {"visualization_type": null, "visualization_tab": null}, "data_config": {}}}', 1, 1, 2),
	(25, '333333', '', NULL, '2022-01-28 15:01:39.540385', '2022-01-28 15:01:39.540385', '{"0": {"id": null, "name": "3b012a46-be9e-4a1f-8554-14fbce7e71e0", "description": "", "title": "", "component_type": "TABLE", "query": {"query_selection": "2", "query": "SELECT * FROM world.country WHERE SurfaceArea > 1000000", "query_selected_fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"], "query_fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"]}, "visualization": {"visualization_type": "TS", "visualization_tab": "data-visualization-tables"}, "data_config": {"fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"]}}, "1": {"id": null, "name": "1655eedb-7815-465c-bba6-100b2eb3b4ff", "description": "", "title": "", "component_type": "GRAPH", "query": {"query_selection": "12", "query": "SELECT continent,\\tCOUNT(*) as total FROM world.country GROUP BY continent;", "query_selected_fields": [], "query_fields": []}, "visualization": {"visualization_type": "G1N", "visualization_tab": "data-visualization-graphs"}, "data_config": {"fields": ["continent", "total"]}}}', 1, 1, 5),
	(26, '76103efa-eb73-41a4-969e-4b58f7d3a690', '', NULL, '2022-03-04 11:17:50.968434', '2022-03-04 11:17:50.968434', '{"0": {"id": null, "name": "1810290b-8136-4c5c-83c4-8099e016e3c7", "description": "", "title": "", "component_type": "TEMPLATE", "query": {"query_selection": "2", "query": "SELECT * FROM world.country WHERE SurfaceArea > 1000000", "query_selected_fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"], "query_fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"]}, "visualization": {"visualization_type": "TEC", "visualization_tab": "data-visualization-templates"}, "data_config": {"fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"]}}, "1": {"id": null, "name": "3843185f-1047-4587-9927-2650ec5e13f4", "description": "", "title": "", "component_type": "GRAPH", "query": {"query_selection": "12", "query": "SELECT continent,\\tCOUNT(*) as total FROM world.country GROUP BY continent;", "query_selected_fields": [], "query_fields": []}, "visualization": {"visualization_type": "G1N", "visualization_tab": "data-visualization-graphs"}, "data_config": {"fields": ["continent", "total"]}}}', NULL, NULL, 2),
	(27, '58b56083-8265-482f-b675-374f24813545', '', NULL, '2022-03-04 16:00:26.780427', '2022-03-04 16:00:26.780427', '{"0": {"id": null, "name": null, "description": null, "title": null, "component_type": null, "query": {"query_selection": null, "query": null, "query_selected_fields": null, "query_fields": null}, "visualization": {"visualization_type": null, "visualization_tab": null}, "data_config": {}}, "1": {"id": null, "name": null, "description": null, "title": null, "component_type": null, "query": {"query_selection": null, "query": null, "query_selected_fields": null, "query_fields": null}, "visualization": {"visualization_type": null, "visualization_tab": null}, "data_config": {}}}', NULL, NULL, 2),
	(28, 'ee5f66ec-7bf0-4237-b607-abdbb40db83e', '', NULL, '2022-03-04 16:01:35.011473', '2022-03-04 16:01:35.011473', '{"0": {"id": null, "name": null, "description": null, "title": null, "component_type": null, "query": {"query_selection": null, "query": null, "query_selected_fields": null, "query_fields": null}, "visualization": {"visualization_type": null, "visualization_tab": null}, "data_config": {}}, "1": {"id": null, "name": null, "description": null, "title": null, "component_type": null, "query": {"query_selection": null, "query": null, "query_selected_fields": null, "query_fields": null}, "visualization": {"visualization_type": null, "visualization_tab": null}, "data_config": {}}}', NULL, NULL, 2),
	(29, '7ef64baa-03cf-4952-9cea-28d261fbe85d', '', NULL, '2022-03-07 13:44:50.800943', '2022-03-07 13:44:50.800943', '{"0": {"id": null, "name": "1810290b-8136-4c5c-83c4-8099e016e3c7", "description": "", "title": "", "component_type": "TABLE", "query": {"query_selection": "2", "query": "SELECT * FROM world.country WHERE SurfaceArea > 1000000", "query_selected_fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"], "query_fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"]}, "visualization": {"visualization_type": "TS", "visualization_tab": "data-visualization-tables"}, "data_config": {"fields": ["Code", "Name", "Continent", "Region", "SurfaceArea", "IndepYear", "Population", "LifeExpectancy", "GNP", "GNPOld", "LocalName", "GovernmentForm", "HeadOfState", "Capital", "Code2"]}}, "1": {"id": null, "name": "3843185f-1047-4587-9927-2650ec5e13f4", "description": "", "title": "", "component_type": "GRAPH", "query": {"query_selection": "12", "query": "SELECT continent,\\tCOUNT(*) as total FROM world.country GROUP BY continent;", "query_selected_fields": [], "query_fields": []}, "visualization": {"visualization_type": "G1N", "visualization_tab": "data-visualization-graphs"}, "data_config": {"fields": ["continent", "total"]}}}', NULL, NULL, 2);
/*!40000 ALTER TABLE `dash_dashboard` ENABLE KEYS */;

-- Dumping structure for table flexdash.dash_layout
CREATE TABLE IF NOT EXISTS `dash_layout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `layout_name` (`name`),
  KEY `layout_author_b466a2db_fk_user_id` (`author`),
  CONSTRAINT `layout_author_b466a2db_fk_user_id` FOREIGN KEY (`author`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.dash_layout: ~26 rows (approximately)
/*!40000 ALTER TABLE `dash_layout` DISABLE KEYS */;
INSERT INTO `dash_layout` (`id`, `name`, `description`, `date`, `author`, `data`) VALUES
	(1, 'L1', NULL, '2022-01-25 20:49:30.954973', NULL, '[[12, 1]]'),
	(2, 'L2', NULL, '2022-01-25 20:49:50.062396', NULL, '[[6, 1], [6, 1]]'),
	(3, 'L3', NULL, '2022-01-25 20:50:00.171559', NULL, '[[4, 1], [4, 1], [4, 1]]'),
	(4, 'L4', NULL, '2022-01-25 20:50:11.215543', NULL, '[[3, 1], [3, 1], [3, 1], [3, 1]]'),
	(5, 'L5', NULL, '2022-01-25 20:50:26.780900', NULL, '[[12, 1], [12, 1]]'),
	(6, 'L6', NULL, '2022-01-25 20:50:46.962823', NULL, '[[6, 1], [6, 1], [6, 1], [6, 1]]'),
	(7, 'L7', NULL, '2022-01-25 20:51:07.965077', NULL, '[[4, 1], [4, 1], [4, 1], [4, 1], [4, 1], [4, 1]]'),
	(8, 'L8', NULL, '2022-01-25 20:52:04.429029', NULL, '[[3, 1], [3, 1], [3, 1], [3, 1], [3, 1], [3, 1], [3, 1], [3, 1]]'),
	(9, 'L9', NULL, '2022-01-25 20:52:25.834887', NULL, '[[12, 1], [6, 1], [6, 1]]'),
	(10, 'L10', NULL, '2022-01-25 20:52:49.417081', NULL, '[[6, 1], [6, 1], [12, 1]]'),
	(11, 'L11', NULL, '2022-01-25 20:53:12.935108', NULL, '[[4, 1], [4, 1], [4, 1], [12, 1]]'),
	(12, 'L12', NULL, '2022-01-25 20:53:28.585124', NULL, '[[4, 1], [4, 1], [4, 1], [6, 1], [6, 1]]'),
	(13, 'L13', NULL, '2022-01-25 20:53:46.899496', NULL, '[[12, 1], [12, 1], [12, 1]]'),
	(14, 'L14', NULL, '2022-01-25 20:54:04.858227', NULL, '[[6, 1], [6, 1], [6, 1], [6, 1], [6, 1], [6, 1]]'),
	(15, 'L15', NULL, '2022-01-25 20:54:21.781655', NULL, '[[4, 1], [4, 1], [4, 1], [4, 1], [4, 1], [4, 1], [4, 1], [4, 1], [4, 1]]'),
	(16, 'L16', NULL, '2022-01-25 20:54:38.920623', NULL, '[[3, 1], [3, 1], [3, 1], [3, 1], [3, 1], [3, 1], [3, 1], [3, 1], [3, 1], [3, 1], [3, 1], [3, 1]]'),
	(17, 'L17', NULL, '2022-01-25 20:54:54.297992', NULL, '[[12, 1], [6, 1], [6, 1], [6, 1], [6, 1]]'),
	(18, 'L18', NULL, '2022-01-25 20:55:07.561416', NULL, '[[6, 1], [6, 1], [6, 1], [6, 1], [12, 1]]'),
	(19, 'L19', NULL, '2022-01-25 20:55:20.787483', NULL, '[[6, 1], [6, 1], [12, 1], [12, 1]]'),
	(20, 'L20', NULL, '2022-01-25 20:55:36.176156', NULL, '[[4, 1], [4, 1], [4, 1], [12, 1], [12, 1]]'),
	(21, 'L21', NULL, '2022-01-25 20:55:50.535485', NULL, '[[4, 1], [4, 1], [4, 1], [6, 1], [6, 1], [6, 1], [6, 1]]'),
	(22, 'L22', NULL, '2022-01-25 20:56:05.058632', NULL, '[[4, 1], [4, 1], [4, 1], [6, 1], [6, 1], [12, 1]]'),
	(23, 'L23', NULL, '2022-01-25 20:56:44.661720', NULL, '[[4, 1], [4, 1], [4, 1], [6, 1], [6, 2], [6, 1]]'),
	(24, 'L24', NULL, '2022-01-25 20:57:09.181208', NULL, '[[4, 1], [4, 1], [4, 1], [4, 1], [8, 2], [4, 1]]'),
	(42, '710f1ba8-4ad9-4007-bcba-a4bbfaee9091', '', '2022-02-03 13:45:37.140145', NULL, '[[1, 1], [1, 1], [1, 1], [1, 1], [8, 1]]'),
	(44, 'fce0f09a-bb6a-4e44-8432-dbd6fa931e29', '', '2022-02-03 14:08:27.633164', NULL, '[[1, 1], [1, 1], [1, 1], [3, 1], [3, 1], [3, 1]]'),
	(45, 'c80e0013-aa9f-41ed-9b08-239c1b96be91', '', '2022-02-03 14:12:21.682229', NULL, '[[1, 1], [1, 1], [1, 1]]'),
	(48, '5ba942a5-1ea0-45b7-96d9-2f26dd99087b', '', '2022-03-03 12:33:17.189691', NULL, '[[1, 1], [1, 1], [1, 1], [5, 3], [4, 3], [1, 1], [1, 1], [1, 1], [1, 1], [1, 1], [1, 1]]'),
	(49, '2dfcd32e-8007-4c2a-bed6-8e7f2b78399e', '', '2022-03-03 14:38:31.069764', NULL, '[[1, 1], [1, 1], [1, 1], [1, 1], [1, 1], [1, 1], [1, 1], [1, 1], [1, 1], [1, 1], [1, 1], [1, 1]]');
/*!40000 ALTER TABLE `dash_layout` ENABLE KEYS */;

-- Dumping structure for table flexdash.dash_query
CREATE TABLE IF NOT EXISTS `dash_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `query` varchar(1024) NOT NULL,
  `author` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `query_name` (`name`),
  KEY `query_author_22678fe3_fk_user_id` (`author`),
  CONSTRAINT `query_author_22678fe3_fk_user_id` FOREIGN KEY (`author`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.dash_query: ~4 rows (approximately)
/*!40000 ALTER TABLE `dash_query` DISABLE KEYS */;
INSERT INTO `dash_query` (`id`, `name`, `description`, `date`, `query`, `author`) VALUES
	(1, 'continents', 'list all continents', '2021-10-18 05:09:20.373951', 'SELECT DISTINCT (continent) FROM world.country;', 1),
	(2, 'big area countries', '> 1000000 square miles', '2021-10-18 05:56:40.408013', 'SELECT * FROM world.country WHERE SurfaceArea > 1000000', 1),
	(12, 'graph 1 num', '', '2021-12-31 06:17:32.643507', 'SELECT continent,	COUNT(*) as total FROM world.country GROUP BY continent;', NULL),
	(13, 'info simple', '', '2021-12-30 14:38:39.646270', 'SELECT \r\n	COUNT(*) AS Count, (SELECT COUNT(*) FROM world.country) AS Total\r\nFROM\r\n	world.country\r\nWHERE \r\n	world.country.SurfaceArea > 1000000', NULL);
/*!40000 ALTER TABLE `dash_query` ENABLE KEYS */;

-- Dumping structure for table flexdash.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.django_admin_log: ~122 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2021-10-18 05:00:59.981942', '1', 'admin', 2, '[{"changed": {"fields": ["password"]}}]', 6, 1),
	(2, '2021-10-18 05:09:20.373951', '1', 'continents', 1, '[{"added": {}}]', 7, 1),
	(3, '2021-10-18 05:12:06.032947', '2', 'big area countries', 1, '[{"added": {}}]', 7, 1),
	(4, '2021-10-18 05:56:40.408013', '2', 'big area countries', 2, '[{"changed": {"fields": ["Query"]}}]', 7, 1),
	(5, '2022-01-24 13:57:57.275653', '1', 'L1', 1, '[{"added": {}}]', 9, 1),
	(6, '2022-01-24 13:58:01.470305', '2', 'L2', 1, '[{"added": {}}]', 9, 1),
	(7, '2022-01-24 13:58:04.445942', '3', 'L3', 1, '[{"added": {}}]', 9, 1),
	(8, '2022-01-24 13:58:07.426252', '4', 'L4', 1, '[{"added": {}}]', 9, 1),
	(9, '2022-01-24 13:58:10.490391', '5', 'L5', 1, '[{"added": {}}]', 9, 1),
	(10, '2022-01-24 13:58:13.664857', '6', 'L6', 1, '[{"added": {}}]', 9, 1),
	(11, '2022-01-24 13:58:17.076189', '7', 'L7', 1, '[{"added": {}}]', 9, 1),
	(12, '2022-01-24 13:58:19.959166', '8', 'L8', 1, '[{"added": {}}]', 9, 1),
	(13, '2022-01-24 13:58:23.490069', '9', 'L9', 1, '[{"added": {}}]', 9, 1),
	(14, '2022-01-24 13:58:27.442115', '10', 'L10', 1, '[{"added": {}}]', 9, 1),
	(15, '2022-01-24 13:58:30.062017', '11', 'L11', 1, '[{"added": {}}]', 9, 1),
	(16, '2022-01-24 13:58:32.645953', '12', 'L12', 1, '[{"added": {}}]', 9, 1),
	(17, '2022-01-24 13:58:35.432363', '13', 'L13', 1, '[{"added": {}}]', 9, 1),
	(18, '2022-01-24 13:58:38.417041', '14', 'L14', 1, '[{"added": {}}]', 9, 1),
	(19, '2022-01-24 13:58:41.165034', '15', 'L15', 1, '[{"added": {}}]', 9, 1),
	(20, '2022-01-24 13:58:45.300680', '16', 'L16', 1, '[{"added": {}}]', 9, 1),
	(21, '2022-01-24 13:58:48.250946', '17', 'L17', 1, '[{"added": {}}]', 9, 1),
	(22, '2022-01-24 13:58:52.200931', '18', 'L18', 1, '[{"added": {}}]', 9, 1),
	(23, '2022-01-24 13:58:54.326731', '19', 'L19', 1, '[{"added": {}}]', 9, 1),
	(24, '2022-01-24 13:58:56.995820', '20', 'L20', 1, '[{"added": {}}]', 9, 1),
	(25, '2022-01-24 13:58:58.930357', '21', 'L21', 1, '[{"added": {}}]', 9, 1),
	(26, '2022-01-24 13:59:00.995882', '22', 'L22', 1, '[{"added": {}}]', 9, 1),
	(27, '2022-01-24 13:59:03.280484', '23', 'L23', 1, '[{"added": {}}]', 9, 1),
	(28, '2022-01-24 13:59:05.642844', '24', 'L24', 1, '[{"added": {}}]', 9, 1),
	(29, '2022-01-25 07:22:08.194859', '24', 'L24', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(30, '2022-01-25 07:22:17.037285', '23', 'L23', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(31, '2022-01-25 07:22:25.538456', '22', 'L22', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(32, '2022-01-25 07:22:35.174666', '21', 'L21', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(33, '2022-01-25 07:22:43.702928', '20', 'L20', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(34, '2022-01-25 07:22:51.282895', '19', 'L19', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(35, '2022-01-25 07:23:01.282672', '18', 'L18', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(36, '2022-01-25 07:23:11.552397', '17', 'L17', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(37, '2022-01-25 07:23:20.309352', '16', 'L16', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(38, '2022-01-25 07:23:29.128212', '15', 'L15', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(39, '2022-01-25 07:23:37.908752', '14', 'L14', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(40, '2022-01-25 07:23:47.485334', '13', 'L13', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(41, '2022-01-25 07:23:55.771104', '12', 'L12', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(42, '2022-01-25 07:24:04.852144', '11', 'L11', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(43, '2022-01-25 07:24:13.201982', '10', 'L10', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(44, '2022-01-25 07:24:23.348915', '9', 'L9', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(45, '2022-01-25 07:24:32.805848', '8', 'L8', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(46, '2022-01-25 07:24:41.522200', '7', 'L7', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(47, '2022-01-25 07:24:49.806986', '6', 'L6', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(48, '2022-01-25 07:24:58.903012', '5', 'L5', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(49, '2022-01-25 07:25:08.417865', '4', 'L4', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(50, '2022-01-25 07:25:18.166199', '3', 'L3', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(51, '2022-01-25 07:25:27.463569', '2', 'L2', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(52, '2022-01-25 07:25:35.283342', '1', 'L1', 2, '[{"changed": {"fields": ["Data"]}}]', 9, 1),
	(53, '2022-01-25 20:49:30.954973', '1', 'L1', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(54, '2022-01-25 20:49:50.062396', '2', 'L2', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(55, '2022-01-25 20:50:00.171559', '3', 'L3', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(56, '2022-01-25 20:50:11.215543', '4', 'L4', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(57, '2022-01-25 20:50:26.784907', '5', 'L5', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(58, '2022-01-25 20:50:46.967602', '6', 'L6', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(59, '2022-01-25 20:51:07.965077', '7', 'L7', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(60, '2022-01-25 20:52:04.429029', '8', 'L8', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(61, '2022-01-25 20:52:25.834887', '9', 'L9', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(62, '2022-01-25 20:52:49.421077', '10', 'L10', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(63, '2022-01-25 20:53:12.935108', '11', 'L11', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(64, '2022-01-25 20:53:28.586124', '12', 'L12', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(65, '2022-01-25 20:53:46.900497', '13', 'L13', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(66, '2022-01-25 20:54:04.858227', '14', 'L14', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(67, '2022-01-25 20:54:21.781655', '15', 'L15', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(68, '2022-01-25 20:54:38.920623', '16', 'L16', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(69, '2022-01-25 20:54:54.297992', '17', 'L17', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(70, '2022-01-25 20:55:07.561416', '18', 'L18', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(71, '2022-01-25 20:55:20.791488', '19', 'L19', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(72, '2022-01-25 20:55:36.180160', '20', 'L20', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(73, '2022-01-25 20:55:50.535485', '21', 'L21', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(74, '2022-01-25 20:56:05.062634', '22', 'L22', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(75, '2022-01-25 20:56:44.661720', '23', 'L23', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(76, '2022-01-25 20:57:09.181208', '24', 'L24', 2, '[{"changed": {"fields": ["Temp"]}}]', 9, 1),
	(77, '2022-01-27 15:27:17.642683', '40', '2a1fd3df-c992-4191-b27a-7d3002c475c2', 3, '', 9, 1),
	(78, '2022-01-27 15:27:17.644539', '39', '6697de21-a115-4cdd-a87e-66cd31e67c30', 3, '', 9, 1),
	(79, '2022-01-27 15:27:17.645553', '38', '4564ad7e-5831-479f-a793-7d98fea97e96', 3, '', 9, 1),
	(80, '2022-01-27 15:27:17.646555', '37', '14ef18c3-7da5-492f-8110-25077caf6f00', 3, '', 9, 1),
	(81, '2022-01-27 15:27:17.647552', '35', 'f47bae90-50a1-43a0-8218-94513c754db5', 3, '', 9, 1),
	(82, '2022-01-27 15:27:17.648551', '34', '0e3641a1-dfa1-4387-a379-eada74b91b22', 3, '', 9, 1),
	(83, '2022-01-27 15:27:17.649551', '33', 'fb869575-cae0-45b1-a928-df261a21601e', 3, '', 9, 1),
	(84, '2022-01-27 15:27:17.649551', '32', 'b8e18301-612a-4877-a682-708cf89c9d37', 3, '', 9, 1),
	(85, '2022-01-27 15:27:17.650554', '31', 'f6ddacf9-deb2-4454-b1c3-92407b5e9d63', 3, '', 9, 1),
	(86, '2022-01-27 15:27:17.651553', '30', 'fc8dab95-4ba9-49de-9ed6-3cfb81861745', 3, '', 9, 1),
	(87, '2022-01-27 15:27:17.652550', '29', 'bbfabea9-5c98-4f7c-a9d3-2f48d580b6a5', 3, '', 9, 1),
	(88, '2022-01-27 15:27:17.653551', '28', 'eba4edf1-147a-4b68-9eba-6dd87f304a2a', 3, '', 9, 1),
	(89, '2022-01-27 15:47:55.332275', '20', 'f6d6a93a-ff76-40b6-928c-c02c1f443358', 3, '', 10, 1),
	(90, '2022-01-27 15:47:55.336890', '19', '97c90749-6cbe-44ad-813f-7d95d978f999', 3, '', 10, 1),
	(91, '2022-01-27 15:47:55.336890', '18', 'e9206a8f-1c53-4b1c-afa1-1dbb250ba9b0', 3, '', 10, 1),
	(92, '2022-01-27 15:47:55.336890', '17', '796c9e8a-b70b-4ebb-b3a9-597bca649b4e', 3, '', 10, 1),
	(93, '2022-01-27 15:47:55.336890', '16', 'e45ddd8a-4585-45f3-9a80-75deccfd2da3', 3, '', 10, 1),
	(94, '2022-01-27 15:47:55.340907', '15', 'f032f36d-9f04-4839-ade1-e128408653ce', 3, '', 10, 1),
	(95, '2022-01-27 15:47:55.341605', '14', 'a62c4fa9-c290-40cd-9897-3f01028e9701', 3, '', 10, 1),
	(96, '2022-01-27 15:47:55.341605', '13', '1a84c0b1-db9d-46cb-8dd4-b2e770209cf6', 3, '', 10, 1),
	(97, '2022-01-27 15:47:55.341605', '12', '0b002af1-2e51-4b97-9201-27511db572c6', 3, '', 10, 1),
	(98, '2022-01-27 15:47:55.341605', '11', '345e7cea-ee85-4635-a004-4131c3bd853f', 3, '', 10, 1),
	(99, '2022-01-27 15:47:55.341605', '10', '34656546hfghfg', 3, '', 10, 1),
	(100, '2022-01-27 15:47:55.345618', '9', '34656546', 3, '', 10, 1),
	(101, '2022-01-27 15:47:55.345618', '8', '34', 3, '', 10, 1),
	(102, '2022-01-27 15:47:55.345618', '7', '222222222', 3, '', 10, 1),
	(103, '2022-01-27 15:47:55.345618', '5', 'a7b60143-2f5d-4372-84f3-522844f1b99c', 3, '', 10, 1),
	(104, '2022-01-27 15:47:55.345618', '4', 'l1', 3, '', 10, 1),
	(105, '2022-01-27 15:47:55.345618', '3', 'd2a3c523-4c08-4f34-856b-7024ac4f0844', 3, '', 10, 1),
	(106, '2022-01-27 15:48:13.990345', '19', '3d8f074e-71aa-4b78-a20d-e13f1109a27f', 3, '', 8, 1),
	(107, '2022-01-27 15:48:14.005974', '18', 'ebb6f761-8418-4114-a5be-b4f5ff6fad42', 3, '', 8, 1),
	(108, '2022-01-27 15:48:14.005974', '17', 'f9f639a2-f963-40f5-b62f-0f206d9505dc', 3, '', 8, 1),
	(109, '2022-01-27 15:48:14.005974', '16', '4690bf65-6d81-43e9-8aa0-8a66ec12d486', 3, '', 8, 1),
	(110, '2022-01-27 15:48:14.005974', '15', 'e4d18e4e-f140-409e-94c7-6f9e09cd486a', 3, '', 8, 1),
	(111, '2022-01-27 15:48:14.005974', '14', 'info', 3, '', 8, 1),
	(112, '2022-01-27 15:48:14.005974', '13', 'cc7c8754-8e96-4bba-9bf0-7e42e9486de7', 3, '', 8, 1),
	(113, '2022-01-27 15:48:14.005974', '11', 'b93e6959-c6b6-4e56-a84f-3dfedfb4f82c', 3, '', 8, 1),
	(114, '2022-01-27 15:48:14.005974', '10', 'd2824b40-14d3-4875-a53a-c5f07961189f', 3, '', 8, 1),
	(115, '2022-01-27 15:48:14.005974', '9', '6631f0c7-a4e8-4b6e-8a4c-cdbde54d69bb', 3, '', 8, 1),
	(116, '2022-01-27 15:48:26.475509', '21', 'cccccccccccc', 3, '', 7, 1),
	(117, '2022-01-27 15:48:26.475509', '20', 'aaaaaaaaaaaa', 3, '', 7, 1),
	(118, '2022-01-27 15:48:26.475509', '19', '6666666666', 3, '', 7, 1),
	(119, '2022-01-27 15:48:26.475509', '18', '5555555555', 3, '', 7, 1),
	(120, '2022-01-27 15:48:26.475509', '17', '4444444', 3, '', 7, 1),
	(121, '2022-01-27 15:48:26.475509', '16', 'ccc', 3, '', 7, 1),
	(122, '2022-01-27 15:48:26.475509', '14', '222222', 3, '', 7, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table flexdash.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.django_content_type: ~6 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(6, 'accounts', 'user'),
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(8, 'dashboards', 'component'),
	(11, 'dashboards', 'config'),
	(10, 'dashboards', 'dashboard'),
	(9, 'dashboards', 'layout'),
	(7, 'dashboards', 'query'),
	(5, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table flexdash.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.django_migrations: ~19 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2021-10-14 16:22:04.033097'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2021-10-14 16:22:04.091096'),
	(3, 'auth', '0001_initial', '2021-10-14 16:22:04.153096'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2021-10-14 16:22:04.234099'),
	(5, 'auth', '0003_alter_user_email_max_length', '2021-10-14 16:22:04.242094'),
	(6, 'auth', '0004_alter_user_username_opts', '2021-10-14 16:22:04.249095'),
	(7, 'auth', '0005_alter_user_last_login_null', '2021-10-14 16:22:04.257095'),
	(8, 'auth', '0006_require_contenttypes_0002', '2021-10-14 16:22:04.260096'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2021-10-14 16:22:04.267093'),
	(10, 'auth', '0008_alter_user_username_max_length', '2021-10-14 16:22:04.274096'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2021-10-14 16:22:04.282096'),
	(12, 'auth', '0010_alter_group_name_max_length', '2021-10-14 16:22:04.294095'),
	(13, 'auth', '0011_update_proxy_permissions', '2021-10-14 16:22:04.304094'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2021-10-14 16:22:04.311095'),
	(15, 'accounts', '0001_initial', '2021-10-14 16:22:04.364093'),
	(16, 'admin', '0001_initial', '2021-10-14 16:22:04.482095'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2021-10-14 16:22:04.533095'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2021-10-14 16:22:04.543093'),
	(19, 'sessions', '0001_initial', '2021-10-14 16:22:04.561095'),
	(20, 'dashboards', '0001_initial', '2021-10-18 05:00:17.351526'),
	(21, 'dashboards', '0002_auto_20211018_0601', '2021-10-18 05:01:51.861818'),
	(22, 'dashboards', '0003_auto_20211212_2013', '2021-12-12 20:13:13.721670'),
	(23, 'dashboards', '0004_auto_20220107_0900', '2022-01-07 09:00:21.051719'),
	(24, 'dashboards', '0005_auto_20220107_1307', '2022-01-07 13:07:32.318254'),
	(25, 'dashboards', '0006_auto_20220124_1312', '2022-01-24 13:12:42.870432'),
	(26, 'dashboards', '0007_auto_20220124_1339', '2022-01-24 13:39:49.812791'),
	(27, 'dashboards', '0008_dashboard_layout', '2022-01-24 13:43:23.105966'),
	(28, 'dashboards', '0009_layout_data', '2022-01-25 07:20:37.540693'),
	(29, 'dashboards', '0010_layout_temp', '2022-01-25 20:46:22.670134'),
	(30, 'dashboards', '0011_remove_layout_temp', '2022-01-26 11:53:53.705438'),
	(31, 'dashboards', '0012_auto_20220301_1558', '2022-03-01 15:58:52.067663'),
	(32, 'dashboards', '0013_auto_20220301_1625', '2022-03-01 16:25:41.286050'),
	(33, 'dashboards', '0014_auto_20220301_1629', '2022-03-01 16:29:13.295937'),
	(34, 'dashboards', '0015_component_uuid', '2022-03-09 18:55:10.119519');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table flexdash.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.django_session: ~13 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('6iaa3jq8lip5z6kyu1ho052cwh5oy23a', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mdTFn:q1JMOsJVm9rAyAXyAuGh4isIudNA6wDilwxfG2j4c9U', '2021-11-04 08:16:47.207011'),
	('6zigayiq76ygseqrb7mncpjga5uc0igb', '.eJxVjMsOwiAQRf-FtSGd4RVcuvcbyACDVA0kpV0Z_12bdKHbe865LxFoW2vYBi9hzuIsQJx-t0jpwW0H-U7t1mXqbV3mKHdFHnTIa8_8vBzu30GlUb_15E1EdNZyAkxAjpMpbHROUKgAgrOaFVokS-yj9WCY_FSiVkprjeL9AeDAN5Q:1mb3Vu:DHDxX4FIFuiYkWA5WlwCeANWnBTWzGmLnzqhG__B2ec', '2021-10-28 16:23:26.926824'),
	('9o4ph8wdg7os2noscecv9t4ydr9s8zmf', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1nBzhG:nILv7cznkTldrSFYuF6k4ohRr4HpoLzOxnf0VbF2TTQ', '2022-02-07 13:47:50.179836'),
	('a1x806i8t2g2tjtzhvvngbuqmj8vcgvx', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1muxZT:TKVTyOMD-1twJYte07vPMG9WpcuBUtB9EUlCYD-Xss0', '2021-12-22 14:05:23.373157'),
	('a9fh1jnxvqjxx9ybg0q4vh60hvmmr68b', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mcKlf:th0F2YlzGQ7iEt2-7CQf-y5Bh4PAk_jS8V_aI_C4BCw', '2021-11-01 05:00:59.989957'),
	('azto2wmtjfyyyiasd1jtt6svgsw2tju7', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1meuhU:OOpq1fPyum6KhJGHwmatIZbF2NC5Nr_QbMpJFXbRytI', '2021-11-08 07:47:20.996101'),
	('cyrtsklkrbc5qgmwrtu6kimuvimc7mon', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1muuU0:-FZoSB_oSAFjOmxyogHPbWf5sZW8NLPfPD-AHg0MPPs', '2021-12-22 10:47:32.929127'),
	('gbf48wv7lk36pqaf7w20hwbwxi1p17pb', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mf1ER:0129EbX2l3GXIgbOmqUHWZEshlvqbAkiIqvT5wJHgG0', '2021-11-08 14:45:47.443067'),
	('khvtfvd4cvgsgs9znznll4ylim46vlpo', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mdwaQ:ZpmiBX81y-FhQcwsOCC48DGOPOea_wLaFghJ9YLBkkQ', '2021-11-05 15:36:02.790415'),
	('pno5y5monn60wues5e13f2fffbm3dy9y', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mcOhN:U-lrOyC0T7Stp963i43-jJAsFoNZWLD2nydmqtJvSeQ', '2021-11-01 09:12:49.584693'),
	('prwo9cat6m612cb5t2ii9lpdxesm1xyn', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mcVE7:fEAtKdXnMjMFi1mJkHeVGBoxdbz3wPqkP2LwJr2DcQY', '2021-11-01 16:11:03.940756'),
	('qosiluk1hvljx4lpl84ogqekm378uuqo', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mx8FO:_TD2aAOhzbzyXj-NR5KYntaW6t5NHfkvpvfkPPMKnhg', '2021-12-28 13:53:38.697090'),
	('s2fpakl485rnapd3n8or30qzsbe48gz2', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mcMN0:2DQ6IAejWUia_T0Jdv7Gb_O_SXyqJRPjUd51vXzFQTA', '2021-11-01 06:43:38.372271'),
	('ttpxewalz15113dfj6405ej7w9i4m88e', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mj0AU:KAnx2zcX3fpl5QP90JFKubLGgOxadjfVHbwibHHSAEQ', '2021-11-19 14:26:10.305475'),
	('uadi28faz9f35setjec8oga0koong7kq', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mdZhw:H5Fp8zUlbwT0fMUdrFztm7-xuU5e5ey2mfscSUL295c', '2021-11-04 15:10:16.620878'),
	('w53far8borkyy5srkxiue24j85nls7sh', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mj0Pe:t-rKfvMR_r05zN-OMJWWQzzn0fuek_anfvkqAmIKKrE', '2021-11-19 14:41:50.447157'),
	('yczavbv67kdb1f18jtuhei1mwtr91okq', '.eJxVjDsOwjAQRO_iGlnybw2U9JzB2rXXOIBsKU6qiLsTSymgmWLem9lEwHUpYe08hymJq1Di9NsRxhfXAdIT66PJ2OoyTySHIg_a5b0lft8O9--gYC_72gNHp5TGCzufLRgDJhJZ0soQsaccCeC8h-WIShnrhgOJGVDrLD5f54I4Jg:1mcM7o:11kVKAeFddtytcigutEIp0BIa9-xq8sSDZLAFo3h7OA', '2021-11-01 06:27:56.565587');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table flexdash.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$216000$gUQNPHOWH1ov$DcBDWzLl1NUzNwxGR8ZTLgXZGxXPVduJM1I5BogE74U=', '2022-01-24 13:47:50.176811', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2021-10-14 16:22:53.040080');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table flexdash.user_groups
CREATE TABLE IF NOT EXISTS `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_groups_user_id_group_id_40beef00_uniq` (`user_id`,`group_id`),
  KEY `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_groups_user_id_abaea130_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;

-- Dumping structure for table flexdash.user_user_permissions
CREATE TABLE IF NOT EXISTS `user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id`,`permission_id`),
  KEY `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flexdash.user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_permissions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;