CREATE TABLE IF NOT EXISTS `prefs` (
    `id` int(11) NOT NULL,
    `name` text COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOAD DATA LOCAL INFILE '/data/ldgourmet/prefs.csv' IGNORE INTO TABLE prefs FIELDS TERMINATED BY ',' ENCLOSED BY '"';