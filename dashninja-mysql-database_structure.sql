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

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cmd_budget`
--

DROP TABLE IF EXISTS `cmd_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_budget` (
  `BudgetTestnet` tinyint(1) NOT NULL,
  `BudgetHash` varchar(64) NOT NULL,
  `BudgetId` varchar(64) NOT NULL,
  `BudgetURL` varchar(255) NOT NULL,
  `FeeHash` varchar(64) NOT NULL,
  `BlockStart` int(11) NOT NULL,
  `BlockEnd` int(11) NOT NULL,
  `TotalPaymentCount` int(11) NOT NULL,
  `RemainingPaymentCount` int(11) NOT NULL,
  `PaymentAddress` varchar(64) NOT NULL,
  `Ratio` decimal(10,8) NOT NULL,
  `Yeas` int(11) NOT NULL,
  `Nays` int(11) NOT NULL,
  `Abstains` int(11) NOT NULL,
  `TotalPayment` decimal(24,8) NOT NULL,
  `MonthlyPayment` decimal(24,8) NOT NULL,
  `IsEstablished` tinyint(1) NOT NULL,
  `IsValid` tinyint(1) NOT NULL,
  `IsValidReason` varchar(255) NOT NULL,
  `fValid` tinyint(1) NOT NULL,
  `FirstReported` datetime NOT NULL,
  `LastReported` datetime NOT NULL,
  PRIMARY KEY (`BudgetTestnet`,`BudgetHash`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_budget_dashwhale_comments`
--

DROP TABLE IF EXISTS `cmd_budget_dashwhale_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_budget_dashwhale_comments` (
  `BudgetHash` varchar(64) CHARACTER SET ascii NOT NULL,
  `CommentHash` varchar(32) CHARACTER SET ascii NOT NULL,
  `CommentUsername` varchar(64) CHARACTER SET ascii NOT NULL,
  `CommentDate` datetime NOT NULL,
  `CommentOrder` int(11) NOT NULL,
  `CommentLevel` int(11) NOT NULL,
  `CommentRecentPost` tinyint(1) NOT NULL,
  `CommentByOwner` tinyint(1) NOT NULL,
  `CommentReplyURL` varchar(255) CHARACTER SET ascii NOT NULL,
  `CommentContent` text COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`BudgetHash`,`CommentHash`),
  KEY `CommentOrder` (`CommentOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_budget_final`
--

DROP TABLE IF EXISTS `cmd_budget_final`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_budget_final` (
  `BudgetTestnet` tinyint(1) NOT NULL,
  `BudgetHash` varchar(64) CHARACTER SET ascii NOT NULL,
  `FeeTx` varchar(64) CHARACTER SET ascii NOT NULL,
  `BudgetName` varchar(64) CHARACTER SET ascii NOT NULL,
  `BlockStart` int(11) NOT NULL,
  `BlockEnd` int(11) NOT NULL,
  `VoteCount` int(11) NOT NULL,
  `Status` varchar(32) COLLATE ascii_bin NOT NULL,
  `IsValid` tinyint(1) NOT NULL,
  `IsValidReason` varchar(255) COLLATE ascii_bin NOT NULL,
  `Proposals` text COLLATE ascii_bin NOT NULL,
  `FirstReported` datetime NOT NULL,
  `LastReported` datetime NOT NULL,
  PRIMARY KEY (`BudgetTestnet`,`BudgetHash`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_budget_projection`
--

DROP TABLE IF EXISTS `cmd_budget_projection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_budget_projection` (
  `BudgetTestnet` tinyint(1) NOT NULL,
  `BudgetHash` varchar(64) NOT NULL,
  `BudgetId` varchar(64) NOT NULL,
  `BudgetURL` varchar(255) NOT NULL,
  `BlockStart` int(11) NOT NULL,
  `BlockEnd` int(11) NOT NULL,
  `TotalPaymentCount` int(11) NOT NULL,
  `RemainingPaymentCount` int(11) NOT NULL,
  `PaymentAddress` varchar(64) NOT NULL,
  `Ratio` decimal(10,8) NOT NULL,
  `Yeas` int(11) NOT NULL,
  `Nays` int(11) NOT NULL,
  `Abstains` int(11) NOT NULL,
  `TotalPayment` decimal(24,8) NOT NULL,
  `MonthlyPayment` decimal(24,8) NOT NULL,
  `Alloted` decimal(24,8) NOT NULL,
  `TotalBudgetAlloted` decimal(24,8) NOT NULL,
  `IsValid` tinyint(1) NOT NULL,
  `IsValidReason` varchar(255) NOT NULL,
  `fValid` tinyint(1) NOT NULL,
  `FirstReported` datetime NOT NULL,
  `LastReported` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`BudgetTestnet`,`BudgetHash`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_budget_votes`
--

DROP TABLE IF EXISTS `cmd_budget_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_budget_votes` (
  `BudgetTestnet` tinyint(1) NOT NULL,
  `BudgetId` varchar(64) NOT NULL,
  `MasternodeOutputHash` varchar(64) NOT NULL,
  `MasternodeOutputIndex` int(11) NOT NULL,
  `VoteHash` varchar(64) CHARACTER SET armscii8 NOT NULL,
  `VoteValue` set('YES','NO','ABSTAIN') NOT NULL,
  `VoteTime` int(11) NOT NULL,
  `VoteIsValid` tinyint(1) NOT NULL,
  PRIMARY KEY (`BudgetTestnet`,`BudgetId`,`MasternodeOutputHash`,`MasternodeOutputIndex`),
  KEY `VoteValue` (`VoteValue`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_config`
--

DROP TABLE IF EXISTS `cmd_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_config` (
  `ConfigKey` varchar(32) COLLATE ascii_bin NOT NULL,
  `ConfigValue` varchar(128) COLLATE ascii_bin NOT NULL,
  PRIMARY KEY (`ConfigKey`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `cmd_config` (`ConfigKey`, `ConfigValue`) VALUES
('DataBaseVersion', '19');

--
-- Table structure for table `cmd_gobject_proposals`
--

DROP TABLE IF EXISTS `cmd_gobject_proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_gobject_proposals` (
  `GovernanceObjectTestnet` tinyint(4) NOT NULL,
  `GovernanceObjectId` varchar(64) NOT NULL,
  `GovernanceObjectName` text CHARACTER SET utf8 NOT NULL,
  `GovernanceObjectPaymentAddress` varchar(34) NOT NULL,
  `GovernanceObjectPaymentAmount` decimal(20,8) NOT NULL,
  `GovernanceObjectEpochStart` int(11) NOT NULL,
  `GovernanceObjectEpochEnd` int(11) NOT NULL,
  `GovernanceObjectURL` text CHARACTER SET utf8 NOT NULL,
  `GovernanceObjectCollateral` varchar(64) NOT NULL,
  `GovernanceObjectVotesAbsoluteYes` int(11) NOT NULL,
  `GovernanceObjectVotesYes` int(11) NOT NULL,
  `GovernanceObjectVotesNo` int(11) NOT NULL,
  `GovernanceObjectVotesAbstain` int(11) NOT NULL,
  `GovernanceObjectBlockchainValidity` tinyint(1) NOT NULL,
  `GovernanceObjectCachedValid` tinyint(1) NOT NULL,
  `GovernanceObjectCachedFunding` tinyint(1) NOT NULL,
  `GovernanceObjectCachedDelete` tinyint(1) NOT NULL,
  `GovernanceObjectCachedEndorsed` tinyint(1) NOT NULL,
  `GovernanceObjectIsValidReason` text CHARACTER SET utf8 NOT NULL,
  `FirstReported` datetime NOT NULL,
  `LastReported` datetime NOT NULL,
  PRIMARY KEY (`GovernanceObjectTestnet`,`GovernanceObjectId`),
  KEY `GovernanceObjectPaymentAddress` (`GovernanceObjectPaymentAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_gobject_triggers`
--

DROP TABLE IF EXISTS `cmd_gobject_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_gobject_triggers` (
  `GovernanceObjectTestnet` tinyint(4) NOT NULL,
  `GovernanceObjectId` varchar(64) NOT NULL,
  `GovernanceObjectEventBlockHeight` int(11) NOT NULL,
  `GovernanceObjectVotesAbsoluteYes` int(11) NOT NULL,
  `GovernanceObjectVotesYes` int(11) NOT NULL,
  `GovernanceObjectVotesNo` int(11) NOT NULL,
  `GovernanceObjectVotesAbstain` int(11) NOT NULL,
  `GovernanceObjectBlockchainValidity` tinyint(1) NOT NULL,
  `GovernanceObjectCachedValid` tinyint(1) NOT NULL,
  `GovernanceObjectCachedFunding` tinyint(1) NOT NULL,
  `GovernanceObjectCachedDelete` tinyint(1) NOT NULL,
  `GovernanceObjectCachedEndorsed` tinyint(1) NOT NULL,
  `GovernanceObjectIsValidReason` text CHARACTER SET utf8 NOT NULL,
  `FirstReported` datetime NOT NULL,
  `LastReported` datetime NOT NULL,
  PRIMARY KEY (`GovernanceObjectTestnet`,`GovernanceObjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_gobject_triggers_payments`
--

DROP TABLE IF EXISTS `cmd_gobject_triggers_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_gobject_triggers_payments` (
  `GovernanceObjectTestnet` tinyint(4) NOT NULL,
  `GovernanceObjectId` varchar(64) NOT NULL,
  `GovernanceObjectPaymentPosition` int(11) NOT NULL,
  `GovernanceObjectPaymentAddress` varchar(34) NOT NULL,
  `GovernanceObjectPaymentAmount` decimal(20,8) NOT NULL,
  `GovernanceObjectPaymentProposalHash` varchar(64) NOT NULL,
  PRIMARY KEY (`GovernanceObjectTestnet`,`GovernanceObjectId`,`GovernanceObjectPaymentPosition`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_gobject_votes`
--

DROP TABLE IF EXISTS `cmd_gobject_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_gobject_votes` (
  `GovernanceObjectTestnet` tinyint(1) NOT NULL,
  `GovernanceObjectId` varchar(64) NOT NULL,
  `MasternodeOutputHash` varchar(64) NOT NULL,
  `MasternodeOutputIndex` int(11) NOT NULL,
  `VoteHash` varchar(64) CHARACTER SET armscii8 NOT NULL,
  `VoteValue` set('YES','NO','ABSTAIN','NONE') NOT NULL,
  `VoteTime` int(11) NOT NULL,
  PRIMARY KEY (`GovernanceObjectTestnet`,`GovernanceObjectId`,`MasternodeOutputHash`,`MasternodeOutputIndex`),
  KEY `VoteValue` (`VoteValue`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_hub`
--

DROP TABLE IF EXISTS `cmd_hub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_hub` (
  `HubID` int(11) NOT NULL AUTO_INCREMENT,
  `HubIPv6` varbinary(16) NOT NULL,
  `HubEnabled` tinyint(1) NOT NULL,
  `HubCertificate` varchar(128) COLLATE ascii_bin NOT NULL,
  `HubDescription` varchar(64) COLLATE ascii_bin NOT NULL,
  PRIMARY KEY (`HubID`),
  KEY `HubEnabled` (`HubEnabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='List of Hubs (Servers)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_hub_nodes`
--

DROP TABLE IF EXISTS `cmd_hub_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_hub_nodes` (
  `HubID` int(11) NOT NULL,
  `NodeID` int(11) NOT NULL,
  PRIMARY KEY (`HubID`,`NodeID`),
  KEY `NodeID` (`NodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Link between Hub and Node';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_info_blocks`
--

DROP TABLE IF EXISTS `cmd_info_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_blocks` (
  `BlockTestNet` tinyint(1) NOT NULL DEFAULT 0,
  `BlockId` int(11) NOT NULL,
  `BlockHash` varchar(64) COLLATE ascii_bin NOT NULL,
  `BlockMNPayee` varchar(34) COLLATE ascii_bin NOT NULL,
  `BlockMNValue` float NOT NULL,
  `BlockSupplyValue` float NOT NULL,
  `BlockMNPayed` tinyint(1) NOT NULL DEFAULT 0,
  `BlockPoolPubKey` varchar(34) COLLATE ascii_bin NOT NULL,
  `BlockMNProtocol` int(11) NOT NULL,
  `BlockTime` bigint(20) NOT NULL,
  `BlockDifficulty` float NOT NULL,
  `BlockMNPayeeDonation` tinyint(1) NOT NULL DEFAULT 0,
  `BlockMNPayeeExpected` varchar(34) COLLATE ascii_bin NOT NULL,
  `BlockMNValueRatioExpected` decimal(10,8) NOT NULL,
  `IsSuperblock` tinyint(1) NOT NULL DEFAULT 0,
  `SuperBlockBudgetName` varchar(64) COLLATE ascii_bin NOT NULL,
  `BlockDarkSendTXCount` int(11) NOT NULL DEFAULT 0,
  `MemPoolDarkSendTXCount` int(11) NOT NULL DEFAULT 0,
  `SuperblockBudgetPayees` int(11) NOT NULL,
  `SuperblockBudgetAmount` double NOT NULL,
  `BlockVersion` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`BlockTestNet`,`BlockId`),
  KEY `BlockMNPayed` (`BlockMNPayed`),
  KEY `BlockMNProtocol` (`BlockMNProtocol`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_info_blocks_history2`
--

DROP TABLE IF EXISTS `cmd_info_blocks_history2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_blocks_history2` (
  `BlockHeight` int(11) NOT NULL,
  `BlockTestNet` tinyint(1) NOT NULL,
  `NodeID` int(11) NOT NULL,
  `BlockMNPayee` varchar(34) COLLATE ascii_bin NOT NULL,
  `LastUpdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Protocol` int(11) NOT NULL,
  `BlockMNRatio` decimal(10,8) NOT NULL,
  PRIMARY KEY (`BlockHeight`,`BlockTestNet`,`NodeID`),
  KEY `Protocol` (`Protocol`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `cmd_info_masternode`
--

DROP TABLE IF EXISTS `cmd_info_masternode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_masternode` (
  `MasternodeIP` int(10) unsigned NOT NULL,
  `MasternodePort` smallint(5) unsigned NOT NULL,
  `MNTestNet` tinyint(1) NOT NULL,
  `MNPubKey` varchar(34) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `MNActiveSeconds` bigint(20) NOT NULL,
  `MNLastSeen` bigint(20) NOT NULL,
  `MNCountry` varchar(64) COLLATE utf8_bin NOT NULL,
  `MNCountryCode` varchar(2) COLLATE utf8_bin NOT NULL,
  `MNLastReported` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`MasternodeIP`,`MasternodePort`,`MNTestNet`),
  KEY `MNTestNet` (`MNTestNet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_info_masternode2`
--

DROP TABLE IF EXISTS `cmd_info_masternode2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_masternode2` (
  `MasternodeOutputHash` varchar(64) NOT NULL,
  `MasternodeOutputIndex` int(11) NOT NULL DEFAULT 0,
  `MasternodeTestNet` tinyint(1) NOT NULL,
  `MasternodeListed` tinyint(1) NOT NULL DEFAULT 1,
  `MasternodeProtocol` int(11) NOT NULL,
  `MasternodePubkey` varchar(34) NOT NULL,
  `MasternodeIP` int(11) unsigned NOT NULL,
  `MasternodeIPv6` varbinary(16) NOT NULL,
  `MasternodeTor` varchar(16) NOT NULL,
  `MasternodePort` smallint(5) unsigned NOT NULL,
  `MasternodeLastSeen` int(11) NOT NULL,
  `MasternodeActiveSeconds` int(11) NOT NULL,
  `MasternodeLastPaid` int(11) NOT NULL,
  `MasternodeLastPaidBlock` int(11) NOT NULL DEFAULT 0,
  `MasternodeDaemonVersion` varchar(32) NOT NULL DEFAULT '',
  `MasternodeSentinelVersion` varchar(32) NOT NULL DEFAULT '',
  `MasternodeSentinelState` enum('current','expired','') NOT NULL DEFAULT 'expired',
  PRIMARY KEY (`MasternodeOutputHash`,`MasternodeOutputIndex`,`MasternodeTestNet`),
  KEY `MasternodePubkey` (`MasternodePubkey`),
  KEY `MasternodeIP` (`MasternodeIP`,`MasternodePort`),
  KEY `MasternodeIPv6` (`MasternodeIPv6`,`MasternodePort`),
  KEY `MasternodeTor` (`MasternodeTor`,`MasternodePort`),
  KEY `MasternodeProtocol` (`MasternodeProtocol`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_info_masternode2_list`
--

DROP TABLE IF EXISTS `cmd_info_masternode2_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_masternode2_list` (
  `MasternodeOutputHash` varchar(64) COLLATE ascii_bin NOT NULL,
  `MasternodeOutputIndex` int(11) NOT NULL DEFAULT 0,
  `MasternodeTestNet` tinyint(1) NOT NULL,
  `NodeID` int(11) NOT NULL,
  `MasternodeStatus` set('active','inactive','unlisted','current') COLLATE ascii_bin NOT NULL,
  `MasternodeStatusEx` set('ENABLED','EXPIRED','VIN_SPENT','REMOVE','POS_ERROR','','PRE_ENABLED','WATCHDOG_EXPIRED','__UNKNOWN__','NEW_START_REQUIRED','UPDATE_REQUIRED','POSE_BAN','OUTPOINT_SPENT','SENTINEL_PING_EXPIRED','POSE_BANNED') COLLATE ascii_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`MasternodeOutputHash`,`MasternodeOutputIndex`,`MasternodeTestNet`,`NodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `cmd_info_masternode_balance`
--

DROP TABLE IF EXISTS `cmd_info_masternode_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_masternode_balance` (
  `TestNet` tinyint(1) NOT NULL DEFAULT 0,
  `PubKey` varchar(34) COLLATE ascii_bin NOT NULL,
  `Balance` decimal(20,9) NOT NULL,
  `LastUpdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`TestNet`,`PubKey`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_info_masternode_donation`
--

DROP TABLE IF EXISTS `cmd_info_masternode_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_masternode_donation` (
  `MasternodeIP` int(10) unsigned NOT NULL,
  `MasternodePort` smallint(5) unsigned NOT NULL,
  `MNTestNet` tinyint(1) NOT NULL,
  `MNPubKey` varchar(34) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `MNDonationPercentage` tinyint(4) NOT NULL DEFAULT 0,
  `MNLastReported` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`MasternodeIP`,`MasternodePort`,`MNTestNet`,`MNPubKey`),
  KEY `MNTestNet` (`MNTestNet`),
  KEY `MasternodeIP` (`MasternodeIP`,`MasternodePort`,`MNTestNet`),
  KEY `MNLastReported` (`MNLastReported`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_info_masternode_lastpaid`
--

DROP TABLE IF EXISTS `cmd_info_masternode_lastpaid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_masternode_lastpaid` (
  `MNTestNet` int(11) NOT NULL,
  `MNPubKey` varchar(34) COLLATE ascii_bin NOT NULL,
  `MNLastPaidBlock` int(11) NOT NULL,
  PRIMARY KEY (`MNTestNet`,`MNPubKey`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_info_masternode_list`
--

DROP TABLE IF EXISTS `cmd_info_masternode_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_masternode_list` (
  `MasternodeIP` int(10) unsigned NOT NULL,
  `MasternodePort` smallint(5) unsigned NOT NULL,
  `MNTestNet` tinyint(1) NOT NULL,
  `NodeID` int(11) NOT NULL,
  `MasternodeStatus` set('active','inactive','unlisted','current') COLLATE ascii_bin NOT NULL,
  `MasternodeStatusPoS` tinyint(4) NOT NULL DEFAULT 0,
  `MasternodeStatusEx` set('ENABLED','EXPIRED','VIN_SPENT','REMOVE','POS_ERROR','','PRE_ENABLED','WATCHDOG_EXPIRED') COLLATE ascii_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`MasternodeIP`,`MasternodePort`,`MNTestNet`,`NodeID`),
  KEY `MasternodeStatus` (`MasternodeStatus`),
  KEY `MNTestNet` (`MNTestNet`),
  KEY `NodeID` (`NodeID`),
  KEY `MasternodeStatusPoS` (`MasternodeStatusPoS`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_info_masternode_pubkeys`
--

DROP TABLE IF EXISTS `cmd_info_masternode_pubkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_masternode_pubkeys` (
  `MasternodeIP` int(10) unsigned NOT NULL,
  `MasternodePort` smallint(5) unsigned NOT NULL,
  `MNTestNet` tinyint(1) NOT NULL,
  `MNPubKey` varchar(34) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `MNLastReported` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`MasternodeIP`,`MasternodePort`,`MNTestNet`,`MNPubKey`),
  KEY `MNTestNet` (`MNTestNet`),
  KEY `MasternodeIP` (`MasternodeIP`,`MasternodePort`,`MNTestNet`),
  KEY `MNLastReported` (`MNLastReported`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_info_masternode_votes`
--

DROP TABLE IF EXISTS `cmd_info_masternode_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_masternode_votes` (
  `MasternodeIP` int(10) unsigned NOT NULL,
  `MasternodePort` smallint(5) unsigned NOT NULL,
  `MNTestNet` tinyint(1) NOT NULL,
  `NodeID` int(11) NOT NULL,
  `MasternodeVote` set('YEA','NAY','ABSTAIN') COLLATE ascii_bin NOT NULL,
  PRIMARY KEY (`MasternodeIP`,`MasternodePort`,`MNTestNet`,`NodeID`),
  KEY `MasternodeStatus` (`MasternodeVote`),
  KEY `MNTestNet` (`MNTestNet`),
  KEY `NodeID` (`NodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_info_protocol_description`
--

DROP TABLE IF EXISTS `cmd_info_protocol_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_info_protocol_description` (
  `Protocol` int(11) NOT NULL,
  `ProtocolDescription` varchar(64) COLLATE ascii_bin NOT NULL,
  PRIMARY KEY (`Protocol`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_nodes`
--

DROP TABLE IF EXISTS `cmd_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_nodes` (
  `NodeID` int(11) NOT NULL AUTO_INCREMENT,
  `NodeName` varchar(16) COLLATE ascii_bin NOT NULL,
  `NodeTestNet` tinyint(1) NOT NULL,
  `NodeEnabled` tinyint(1) NOT NULL,
  `NodeType` set('masternode','p2pool') COLLATE ascii_bin NOT NULL DEFAULT 'masternode',
  `VersionID` int(11) NOT NULL,
  `KeepUpToDate` tinyint(1) NOT NULL DEFAULT 0,
  `KeepRunning` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`NodeID`),
  KEY `TestNet` (`NodeTestNet`,`VersionID`,`NodeEnabled`),
  KEY `VersionID` (`VersionID`),
  KEY `NodeType` (`NodeType`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_nodes_spork`
--

DROP TABLE IF EXISTS `cmd_nodes_spork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_nodes_spork` (
  `NodeID` int(11) NOT NULL,
  `SporkName` varchar(128) COLLATE ascii_bin NOT NULL,
  `SporkValue` bigint(20) NOT NULL,
  PRIMARY KEY (`NodeID`,`SporkName`),
  KEY `NodeID` (`NodeID`),
  KEY `SporkName` (`SporkName`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_nodes_status`
--

DROP TABLE IF EXISTS `cmd_nodes_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_nodes_status` (
  `NodeId` int(11) NOT NULL,
  `NodeProcessStatus` set('stopped','notresponding','running','disabled') CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'stopped',
  `NodeVersion` int(11) NOT NULL,
  `NodeProtocol` int(11) NOT NULL,
  `NodeBlocks` int(11) NOT NULL,
  `NodeLastBlockHash` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `NodeConnections` int(11) NOT NULL,
  `NodeCountry` varchar(32) COLLATE utf8_bin NOT NULL,
  `NodeCountryCode` varchar(2) COLLATE utf8_bin NOT NULL,
  `LastUpdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`NodeId`),
  KEY `NodeProcessStatus` (`NodeProcessStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_pools_list`
--

DROP TABLE IF EXISTS `cmd_pools_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_pools_list` (
  `PoolID` int(11) NOT NULL,
  `IRCNickOwner` varchar(32) NOT NULL,
  `URL` varchar(128) NOT NULL,
  `PoolType` varchar(16) NOT NULL,
  `Fee` decimal(8,4) NOT NULL,
  `WDMin` decimal(16,8) NOT NULL,
  `WDAutoFee` decimal(16,8) NOT NULL,
  `WDManFee` decimal(16,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_pools_pubkey`
--

DROP TABLE IF EXISTS `cmd_pools_pubkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_pools_pubkey` (
  `PoolTestNet` tinyint(1) NOT NULL DEFAULT 0,
  `PoolPubKey` varchar(64) COLLATE ascii_bin NOT NULL,
  `PoolDescription` varchar(32) COLLATE ascii_bin NOT NULL,
  PRIMARY KEY (`PoolPubKey`,`PoolTestNet`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_portcheck`
--

DROP TABLE IF EXISTS `cmd_portcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_portcheck` (
  `NodeIP` varbinary(16) NOT NULL,
  `NodePort` smallint(5) unsigned NOT NULL,
  `NodeTestNet` tinyint(1) NOT NULL,
  `NodePortCheck` set('unknown','open','closed','timeout','rogue') COLLATE utf8_bin NOT NULL DEFAULT 'unknown',
  `NextCheck` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `NodeSubVer` varchar(64) COLLATE utf8_bin NOT NULL,
  `ErrorMessage` varchar(64) COLLATE utf8_bin NOT NULL,
  `NodeCountry` varchar(64) COLLATE utf8_bin NOT NULL,
  `NodeCountryCode` varchar(2) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`NodeIP`,`NodePort`,`NodeTestNet`) USING BTREE,
  KEY `NodePortCheck` (`NodePortCheck`),
  KEY `NextCheck` (`NextCheck`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_portcheck_config`
--

DROP TABLE IF EXISTS `cmd_portcheck_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_portcheck_config` (
  `TestNet` tinyint(1) NOT NULL,
  `Version` int(11) NOT NULL,
  `SatoshiVersion` varchar(32) COLLATE ascii_bin NOT NULL,
  `ProtocolVersion` int(11) NOT NULL,
  `ProtocolMagic` binary(4) NOT NULL,
  PRIMARY KEY (`TestNet`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_protx`
--

DROP TABLE IF EXISTS `cmd_protx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_protx` (
  `proTxTestNet` tinyint(4) NOT NULL,
  `proTxHash` varchar(64) NOT NULL,
  `collateralHash` varchar(64) NOT NULL,
  `collateralIndex` int(11) NOT NULL,
  `operatorReward` decimal(5,2) NOT NULL DEFAULT 0.00,
  `confirmations` int(11) NOT NULL,
  `LastSeen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`proTxTestNet`,`proTxHash`),
  KEY `collateralHash` (`collateralHash`,`collateralIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_protx_state`
--

DROP TABLE IF EXISTS `cmd_protx_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_protx_state` (
  `proTxTestNet` tinyint(4) NOT NULL,
  `proTxHash` varchar(64) NOT NULL,
  `NodeID` int(11) NOT NULL,
  `registeredHeight` int(11) NOT NULL,
  `lastPaidHeight` int(11) NOT NULL,
  `PoSePenalty` int(11) NOT NULL,
  `PoSeRevivedHeight` int(11) NOT NULL,
  `PoSeBanHeight` int(11) NOT NULL,
  `revocationReason` int(11) NOT NULL,
  `keyIDOwner` varchar(40) NOT NULL,
  `pubKeyOperator` varchar(96) NOT NULL,
  `keyIDVoting` varchar(40) NOT NULL,
  `addrIP` varbinary(16) NOT NULL,
  `addrPort` smallint(5) unsigned NOT NULL,
  `payoutAddress` varchar(34) NOT NULL,
  `operatorRewardAddress` varchar(34) NOT NULL,
  `StateDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`proTxTestNet`,`proTxHash`,`NodeID`),
  KEY `addrIP` (`addrIP`,`addrPort`),
  KEY `payoutAddress` (`payoutAddress`),
  KEY `operatorRewardAddress` (`operatorRewardAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_stats_history`
--

DROP TABLE IF EXISTS `cmd_stats_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_stats_history` (
  `TestNet` tinyint(1) NOT NULL,
  `StatDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ActiveMNCount` int(11) NOT NULL,
  `NetworkHashPerSec` bigint(20) NOT NULL,
  `PriceUSD` decimal(30,10) NOT NULL,
  `PriceBTC` decimal(30,10) NOT NULL,
  `PriceEUR` decimal(30,10) NOT NULL,
  PRIMARY KEY (`TestNet`,`StatDate`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_stats_values`
--

DROP TABLE IF EXISTS `cmd_stats_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_stats_values` (
  `StatKey` varchar(24) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `StatValue` varchar(32) COLLATE utf8_bin NOT NULL,
  `LastUpdate` bigint(20) NOT NULL,
  `Source` varchar(16) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`StatKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_twitter`
--

DROP TABLE IF EXISTS `cmd_twitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_twitter` (
  `account` varchar(64) NOT NULL,
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `text` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmd_versions`
--

DROP TABLE IF EXISTS `cmd_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_versions` (
  `VersionId` int(11) NOT NULL AUTO_INCREMENT,
  `VersionPath` varchar(255) COLLATE ascii_bin NOT NULL,
  `VersionRaw` varchar(64) COLLATE ascii_bin NOT NULL,
  `VersionDisplay` varchar(32) COLLATE ascii_bin NOT NULL,
  `VersionTestnet` tinyint(1) NOT NULL,
  `VersionEnabled` tinyint(1) NOT NULL,
  `VersionURL` varchar(255) COLLATE ascii_bin NOT NULL,
  `VersionSHA1` varchar(40) COLLATE ascii_bin NOT NULL,
  `VersionSize` int(11) NOT NULL,
  `VersionHandling` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`VersionId`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=ascii COLLATE=ascii_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-17 15:44:46
