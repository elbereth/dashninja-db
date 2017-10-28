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

-- Execute this MySQL script to update your Database from v10 to v11

--
-- Table structure for table `cmd_info_masternode2_list`
--

ALTER TABLE `cmd_info_masternode2_list`
  CHANGE `MasternodeStatusEx` `MasternodeStatusEx`
  SET('ENABLED','EXPIRED','VIN_SPENT','REMOVE','POS_ERROR','','PRE_ENABLED','WATCHDOG_EXPIRED','__UNKNOWN__')
  CHARACTER SET ascii
  COLLATE ascii_bin
  NOT NULL
  DEFAULT '';

--
-- Table structure for table `cmd_gobject_proposals`
--

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

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmd_gobject_votes` (
  `GovernanceObjectTestnet` tinyint(1) NOT NULL,
  `GovernanceObjectId` varchar(64) NOT NULL,
  `MasternodeOutputHash` varchar(64) NOT NULL,
  `MasternodeOutputIndex` int(11) NOT NULL,
  `VoteHash` varchar(64) CHARACTER SET armscii8 NOT NULL,
  `VoteValue` set('YES','NO','ABSTAIN') NOT NULL,
  `VoteTime` int(11) NOT NULL,
  PRIMARY KEY (`GovernanceObjectTestnet`,`GovernanceObjectId`,`MasternodeOutputHash`,`MasternodeOutputIndex`),
  KEY `VoteValue` (`VoteValue`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Update actual version number
--

UPDATE `cmd_config` SET `DataBaseVersion`=11 WHERE `DataBaseVersion`=10
