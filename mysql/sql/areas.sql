CREATE TABLE IF NOT EXISTS `areas` (
    `id` int(11) NOT NULL,
    `pred_id` bigint(11) DEFAULT NULL,
    `name` text COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOAD DATA LOCAL INFILE '/data/ldgourmet/areas.csv' IGNORE INTO TABLE areas FIELDS TERMINATED BY ',' ENCLOSED BY '"'
IGNORE 1 ROWS;
