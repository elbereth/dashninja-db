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

-- Execute this MySQL script to update your Database from v12 to v13

--
-- Update nodes status table to remove IP and port (unneeded and potential privacy issue)
--

ALTER TABLE `cmd_nodes_status`
  DROP `NodeIP`,
  DROP `NodePort`;

--
-- Table structure for table `cmd_config`
--

DROP TABLE IF EXISTS `cmd_config`;
CREATE TABLE `cmd_config` (
  `ConfigKey` varchar(32) COLLATE ascii_bin NOT NULL,
  `ConfigValue` varchar(128) COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Dumping data for table `cmd_config`
--

INSERT INTO `cmd_config` (`ConfigKey`, `ConfigValue`) VALUES
('DataBaseVersion', '13');

--
-- Indexes for table `cmd_config`
--
ALTER TABLE `cmd_config`
  ADD PRIMARY KEY (`ConfigKey`);
COMMIT;
