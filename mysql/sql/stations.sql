CREATE TABLE IF NOT EXISTS `stations` (
    `id` int(11) NOT NULL,
    `pref_id` bigint(20) DEFAULT NULL,
    `name` text COLLATE utf8mb4_unicode_ci,
    `name_kana` text COLLATE utf8mb4_unicode_ci,
    `property` text COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOAD DATA LOCAL INFILE '/data/ldgourmet/stations.csv' IGNORE INTO TABLE stations FIELDS TERMINATED BY ',' ENCLOSED BY '"';