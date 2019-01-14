ALTER TABLE `cmd_info_masternode2` CHANGE `MasternodeSentinelState` `MasternodeSentinelState` ENUM('current','expired','') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'expired';
