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

-- Execute this MySQL script to update your Database from v3 to v4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Table structure for table `cmd_budget_votes`
--

CREATE TABLE IF NOT EXISTS `cmd_budget_votes` (
  `BudgetTestnet` tinyint(1) NOT NULL,
  `BudgetId` varchar(64) NOT NULL,
  `MasternodeOutputHash` varchar(64) NOT NULL,
  `MasternodeOutputIndex` int(11) NOT NULL,
  `VoteHash` varchar(64) CHARACTER SET armscii8 NOT NULL,
  `VoteValue` set('YES','NO','ABSTAIN') NOT NULL,
  `VoteTime` int(11) NOT NULL,
  `VoteIsValid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Indexes for table `cmd_budget_votes`
--
ALTER TABLE `cmd_budget_votes`
  ADD PRIMARY KEY (`BudgetTestnet`,`BudgetId`,`MasternodeOutputHash`,`MasternodeOutputIndex`),
  ADD KEY `VoteValue` (`VoteValue`);

--
-- Update actual version number
--

UPDATE `cmd_config` SET `DataBaseVersion`=4 WHERE `DataBaseVersion`=3

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

