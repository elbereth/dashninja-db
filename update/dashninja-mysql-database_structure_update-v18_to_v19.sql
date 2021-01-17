ALTER TABLE cmd_gobject_votes MODIFY VoteValue SET('YES', 'NO', 'ABSTAIN', 'NONE') NOT NULL;

--
-- Update database version in config table
--

UPDATE `cmd_config` SET `ConfigValue` = '19' WHERE `cmd_config`.`ConfigKey` = 'DataBaseVersion';

