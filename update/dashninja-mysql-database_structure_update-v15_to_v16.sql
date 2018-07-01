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

-- Execute this MySQL script to update your Database from v15 to v16

--
-- Update masternode2 list statusex for new statuses
--

ALTER TABLE `cmd_info_masternode2_list` CHANGE `MasternodeStatusEx` `MasternodeStatusEx` SET('ENABLED','EXPIRED','VIN_SPENT','REMOVE','POS_ERROR','','PRE_ENABLED','WATCHDOG_EXPIRED','__UNKNOWN__','NEW_START_REQUIRED','UPDATE_REQUIRED','POSE_BAN','OUTPOINT_SPENT','SENTINEL_PING_EXPIRED') CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '';

--
-- Update masternode2 for new Sentinel fields
--

ALTER TABLE `cmd_info_masternode2` ADD `MasternodeLastPaidBlock` INT NOT NULL DEFAULT '0' AFTER `MasternodeLastPaid`, ADD `MasternodeDaemonVersion` VARCHAR(32) NOT NULL DEFAULT '' AFTER `MasternodeLastPaidBlock`, ADD `MasternodeSentinelVersion` VARCHAR(32) NOT NULL DEFAULT '' AFTER `MasternodeDaemonVersion`, ADD `MasternodeSentinelState` ENUM('current','expired') NOT NULL DEFAULT 'expired' AFTER `MasternodeSentinelVersion`;

--
-- Update database version in config table
--

UPDATE `cmd_config` SET `ConfigValue` = '16' WHERE `cmd_config`.`ConfigKey` = 'DataBaseVersion';

