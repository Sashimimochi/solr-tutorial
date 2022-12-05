CREATE TABLE IF NOT EXISTS `ratings` (
    `id` int(11) NOT NULL,
    `restaurant_id` bigint(20) DEFAULT NULL,
    `user_id` text COLLATE utf8mb4_unicode_ci,
    `total` bigint(20) DEFAULT NULL,
    `food` bigint(20) DEFAULT NULL,
    `service` bigint(20) DEFAULT NULL,
    `atmosphere` bigint(20) DEFAULT NULL,
    `cost_performance` bigint(20) DEFAULT NULL,
    `title` text COLLATE utf8mb4_unicode_ci,
    `body` text COLLATE utf8mb4_unicode_ci,
    `purpose` bigint(20) DEFAULT NULL,
    `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOAD DATA LOCAL INFILE '/data/ldgourmet/ratings.csv' IGNORE INTO TABLE ratings FIELDS TERMINATED BY ',' ENCLOSED BY '"';