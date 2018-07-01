--
-- This file is part of Dash Ninja.
-- https://github.com/elbereth/dashninja-db
--
-- Dash Ninja is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- Dash Ninja is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Dash Ninja.  If not, see <http://www.gnu.org/licenses/>.
--

-- Execute this MySQL script to update your Database from v14 to v15

--
-- Update masternode list statusex for new POSE_BAN status
--

ALTER TABLE `cmd_info_masternode2_list` CHANGE `MasternodeStatusEx` `MasternodeStatusEx` SET('ENABLED','EXPIRED','VIN_SPENT','REMOVE','POS_ERROR','','PRE_ENABLED','WATCHDOG_EXPIRED','__UNKNOWN__','NEW_START_REQUIRED','UPDATE_REQUIRED','POSE_BAN') CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '';

--
-- Table structure for table `cmd_info_masternode_active`
--

DROP TABLE IF EXISTS `cmd_info_masternode_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_masternode_active` (
  `MasternodeOutputHash` varchar(64) NOT NULL,
  `MasternodeOutputIndex` int(11) NOT NULL,
  `MasternodeTestNet` tinyint(1) NOT NULL,
  `MasternodeProtocol` int(11) NOT NULL,
  `ActiveCount` int(11) DEFAULT NULL,
  `InactiveCount` int(11) DEFAULT NULL,
  `UnlistedCount` int(11) DEFAULT NULL,
  `LastSeen` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`MasternodeOutputHash`,`MasternodeOutputIndex`,`MasternodeTestNet`,`MasternodeProtocol`),
  KEY `LastSeen` (`LastSeen`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Update database version in config table
--

UPDATE `cmd_config` SET `ConfigValue` = '15' WHERE `cmd_config`.`ConfigKey` = 'DataBaseVersion';
