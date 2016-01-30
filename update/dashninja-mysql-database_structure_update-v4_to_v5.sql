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

-- Execute this MySQL script to update your Database from v4 to v5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Table structure for table `cmd_budget_dashwhale_comments`
--

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
  `CommentContent` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Indexes for table `cmd_budget_dashwhale_comments`
--

ALTER TABLE `cmd_budget_dashwhale_comments`
  ADD PRIMARY KEY (`BudgetHash`,`CommentHash`),
  ADD KEY `CommentOrder` (`CommentOrder`);

--
-- Update actual version number
--

UPDATE `cmd_config` SET `DataBaseVersion`=5 WHERE `DataBaseVersion`=4

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

