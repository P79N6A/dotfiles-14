SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


INSERT INTO `pma__column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`, `input_transformation`, `input_transformation_options`) VALUES(1, 'findpatt', 'property_photo', 'thumbnail', '', 'image_jpeg', 'output/image_jpeg_inline.php', '', 'input/Image_JPEG_Upload.php', '');
INSERT INTO `pma__column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`, `input_transformation`, `input_transformation_options`) VALUES(2, 'findpatt', 'property_photo', 'fullsize', '', 'text_plain', '', '', '', '');

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES('root', 'repro-gallery-master', 'genres', '{\"sorted_col\":\"`genres`.`id` ASC\"}', '2018-04-10 04:32:30');

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES('root', '2018-04-22 12:30:29', '{\"VersionCheck\":false,\"MaxDbList\":250,\"MaxCharactersInDisplayedSQL\":10000,\"RetainQueryBox\":true,\"LintEnable\":false,\"FirstLevelNavigationItems\":250,\"MaxNavigationItems\":250,\"NavigationTreeDbSeparator\":\"\",\"NavigationTreeTableSeparator\":\"\",\"NavigationLogoLinkWindow\":\"new\",\"NumRecentTables\":0,\"NumFavoriteTables\":0,\"NavigationTreeDisplayItemFilterMinimum\":100,\"NavigationTreeDisplayDbFilterMinimum\":100,\"NavigationTreeDefaultTabTable\":\"browse\",\"NavigationTreeDefaultTabTable2\":\"structure\",\"ShowStats\":false,\"ShowDbStructureCharset\":true,\"ShowDbStructureComment\":true,\"ShowDbStructureLastUpdate\":true,\"HideStructureActions\":false,\"ShowAll\":true,\"MaxRows\":50,\"MinSizeForInputField\":8,\"MaxSizeForInputField\":80,\"InsertRows\":1,\"DefaultForeignKeyChecks\":\"disable\",\"TabsMode\":\"text\",\"DefaultTabServer\":\"databases\",\"Export\\/method\":\"custom\",\"Export\\/quick_export_onserver_overwrite\":true,\"Export\\/sql_include_comments\":false,\"Export\\/sql_disable_fk\":true,\"Export\\/sql_insert_syntax\":\"complete\",\"TextareaCols\":80,\"TextareaRows\":16,\"CharTextareaCols\":80,\"CharTextareaRows\":4,\"LimitChars\":80,\"RowActionLinksWithoutUnique\":true,\"RepeatCells\":0,\"InitialSlidersState\":\"open\",\"SendErrorReports\":\"never\",\"Server\\/hide_db\":\"\",\"Server\\/only_db\":\"\",\"fontsize\":\"100%\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');


SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
