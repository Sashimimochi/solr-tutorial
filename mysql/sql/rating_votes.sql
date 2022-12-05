CREATE TABLE IF NOT EXISTS `rating_votes` (
    `rating_id` bigint(20) DEFAULT NULL,
    `user` text COLLATE utf8mb4_unicode_ci,
    `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOAD DATA LOCAL INFILE '/data/ldgourmet/rating_votes.csv' IGNORE INTO TABLE categories FIELDS TERMINATED BY ',' ENCLOSED BY '"';