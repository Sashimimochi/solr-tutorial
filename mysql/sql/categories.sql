CREATE TABLE IF NOT EXISTS `categories` (
    `id` int(11) NOT NULL,
    `name` text COLLATE utf8mb4_unicode_ci,
    `name_kana` text COLLATE utf8mb4_unicode_ci,
    `parent1` bigint(20) DEFAULT NULL,
    `parent2` bigint(20) DEFAULT NULL,
    `similar` text COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOAD DATA LOCAL INFILE '/data/ldgourmet/categories.csv' IGNORE INTO TABLE categories FIELDS TERMINATED BY ',' ENCLOSED BY '"'
IGNORE 1 ROWS;
