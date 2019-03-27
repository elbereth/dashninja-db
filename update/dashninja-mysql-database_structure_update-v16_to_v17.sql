ALTER TABLE `cmd_info_masternode2` CHANGE `MasternodeSentinelState` `MasternodeSentinelState` ENUM('current','expired','') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'expired';

--
-- Table structure for table `cmd_protx`
--
CREATE TABLE `cmd_protx` (
  `proTxTestNet` tinyint(4) NOT NULL,
  `proTxHash` varchar(64) NOT NULL,
  `collateralHash` varchar(64) NOT NULL,
  `collateralIndex` int(11) NOT NULL,
  `operatorReward` decimal(5,2) NOT NULL DEFAULT 0.00,
  `confirmations` int(11) NOT NULL,
  `LastSeen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Indexes for table `cmd_protx`
--
ALTER TABLE `cmd_protx`
  ADD PRIMARY KEY (`proTxTestNet`,`proTxHash`),
  ADD KEY `collateralHash` (`collateralHash`,`collateralIndex`);
COMMIT;

--
-- Table structure for table `cmd_protx_state`
--
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
  `addrPort` smallint(5) UNSIGNED NOT NULL,
  `payoutAddress` varchar(34) NOT NULL,
  `operatorRewardAddress` varchar(34) NOT NULL,
  `StateDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Indexes for table `cmd_protx_state`
--
ALTER TABLE `cmd_protx_state`
  ADD PRIMARY KEY (`proTxTestNet`,`proTxHash`,`NodeID`),
  ADD KEY `addrIP` (`addrIP`,`addrPort`),
  ADD KEY `payoutAddress` (`payoutAddress`),
  ADD KEY `operatorRewardAddress` (`operatorRewardAddress`);
COMMIT;
