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

-- Execute this MySQL script to update your Database from v9 to v10

--
-- Table structure for table `cmd_info_masternode_list`
--

ALTER TABLE `cmd_info_masternode_list`
  CHANGE `MasternodeStatusEx` `MasternodeStatusEx`
  SET('ENABLED','EXPIRED','VIN_SPENT','REMOVE','POS_ERROR','','PRE_ENABLED')
  CHARACTER SET ascii
  COLLATE ascii_bin
  NOT NULL
  DEFAULT '';

--
-- Update actual version number
--

UPDATE `cmd_config` SET `DataBaseVersion`=10 WHERE `DataBaseVersion`=9
