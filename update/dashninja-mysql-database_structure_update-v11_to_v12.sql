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

-- Execute this MySQL script to update your Database from v11 to v12

--
-- Table structure for table `cmd_info_masternode2_list`
--

ALTER TABLE `cmd_info_masternode2_list` CHANGE `MasternodeStatusEx` `MasternodeStatusEx` SET('ENABLED','EXPIRED','VIN_SPENT','REMOVE','POS_ERROR','','PRE_ENABLED','WATCHDOG_EXPIRED','__UNKNOWN__','NEW_START_REQUIRED','UPDATE_REQUIRED') CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '';

--
-- Table structure for table `cmd_info_blocks`
--

ALTER TABLE `cmd_info_blocks` ADD `SuperblockBudgetPayees` INT NOT NULL AFTER `MemPoolDarkSendTXCount`, ADD `SuperblockBudgetAmount` DOUBLE NOT NULL AFTER `SuperblockBudgetPayees`;

--
-- Table structure for table `cmd_info_blocks_superblockpayments`
--

DROP TABLE IF EXISTS `cmd_info_blocks_superblockpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_blocks_superblockpayments` (
  `BlockTestnet` tinyint(4) NOT NULL,
  `BlockId` int(11) NOT NULL,
  `GovernanceObjectPaymentAddress` varchar(34) NOT NULL,
  `GovernanceObjectPaymentAmount` decimal(20,8) NOT NULL,
  `GovernanceObjectPaymentProposalHash` varchar(64) NOT NULL,
  PRIMARY KEY (`BlockTestnet`,`BlockId`,`GovernanceObjectPaymentProposalHash`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Update actual version number
--

UPDATE `cmd_config` SET `DataBaseVersion`=12 WHERE `DataBaseVersion`=11

