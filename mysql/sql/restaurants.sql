CREATE TABLE IF NOT EXISTS `restaurants` (
    `id` int(11) NOT NULL,
    `name` text COLLATE utf8mb4_unicode_ci,
    `property` text COLLATE utf8mb4_unicode_ci,
    `alphabet` text COLLATE utf8mb4_unicode_ci,
    `name_kana` text COLLATE utf8mb4_unicode_ci,
    `pref_id` bigint(20) DEFAULT NULL,
    `area_id` bigint(20) DEFAULT NULL,
    `station_id1` bigint(20) DEFAULT NULL,
    `station_time1` bigint(20) DEFAULT NULL,
    `station_distance1` bigint(20) DEFAULT NULL,
    `station_id2` bigint(20) DEFAULT NULL,
    `station_time2` bigint(20) DEFAULT NULL,
    `station_distance2` bigint(20) DEFAULT NULL,
    `station_id3` bigint(20) DEFAULT NULL,
    `station_time3` bigint(20) DEFAULT NULL,
    `station_distance3` bigint(20) DEFAULT NULL,
    `category_id1` bigint(20) DEFAULT NULL,
    `category_id2` bigint(20) DEFAULT NULL,
    `category_id3` bigint(20) DEFAULT NULL,
    `category_id4` bigint(20) DEFAULT NULL,
    `category_id5` bigint(20) DEFAULT NULL,
    `zip` text COLLATE utf8mb4_unicode_ci,
    `address` text COLLATE utf8mb4_unicode_ci,
    `north_latitude` text COLLATE utf8mb4_unicode_ci,
    `east_longitude` text COLLATE utf8mb4_unicode_ci,
    `description` text COLLATE utf8mb4_unicode_ci,
    `purpose` text COLLATE utf8mb4_unicode_ci,
    `open_morning` bigint(20) DEFAULT NULL,
    `open_lunch` bigint(20) DEFAULT NULL,
    `open_late` bigint(20) DEFAULT NULL,
    `photo_count` bigint(20) DEFAULT NULL,
    `special_count` bigint(20) DEFAULT NULL,
    `menu_count` bigint(20) DEFAULT NULL,
    `fan_count` bigint(20) DEFAULT NULL,
    `access_count` bigint(20) DEFAULT NULL,
    `created_on` text COLLATE utf8mb4_unicode_ci,
    `modified_on` text COLLATE utf8mb4_unicode_ci,
    `closed` bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

LOAD DATA LOCAL INFILE '/data/ldgourmet/restaurants.csv' IGNORE INTO TABLE restaurants FIELDS TERMINATED BY ',' ENCLOSED BY '"';