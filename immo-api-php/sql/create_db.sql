CREATE TABLE IF NOT EXISTS `property` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('house','apartment','commercial') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `surface` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `is_sold` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `option` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `option_property` (
  `property_id` int unsigned NOT NULL,
  `option_id` int unsigned NOT NULL,
  PRIMARY KEY (`property_id`,`option_id`),
  KEY `id_option` (`option_id`),
  CONSTRAINT `option_property_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `option_property_ibfk_2` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




INSERT INTO property (name, type, description, city, surface, price, is_sold, created_at, updated_at)
VALUES
  ('Spacious Family Home', 'house', 'Beautiful 4-bedroom family home with a large backyard.', 'New York', 200, 500000, 0, NOW(), NOW()),
  ('Luxury Apartment in Downtown', 'apartment', 'Stunning 2-bedroom apartment with modern amenities.', 'Los Angeles', 100, 250000, 0, NOW(), NOW()),
  ('Commercial Space for Lease', 'commercial', 'Prime location commercial space available for lease.', 'London', 300, 1000000, 0, NOW(), NOW()),
  ('Charming Cottage in the Heart of Paris', 'house', 'Quaint 3-bedroom cottage with a garden in a quiet neighborhood.', 'Paris', 150, 400000, 0, NOW(), NOW()),
  ('Modern Apartment near City Center', 'apartment', 'Contemporary 1-bedroom apartment with a balcony and city views.', 'Berlin', 120, 300000, 0, NOW(), NOW());



INSERT INTO `option` (`name`, `updated_at`, `created_at`) VALUES
("Balconny", NOW(), NOW()),
("Terrace", NOW(), NOW()),
("Parking", NOW(), NOW()),
("Swimming Pool", NOW(), NOW()),
("Laundry Room", NOW(), NOW()),
("Elevator", NOW(), NOW()),
("Ensuite Bathroom", NOW(), NOW()),
("Air Conditioning", NOW(), NOW()),
("Central Heating", NOW(), NOW()),
("Sea View", NOW(), NOW()),
("Garage", NOW(), NOW()),
("Fiber Optic", NOW(), NOW()),
("Close to Public Transportation", NOW(), NOW()),
("Roller Shutter", NOW(), NOW()),
("Alarm System", NOW(), NOW()),
("Garden", NOW(), NOW()),
("Fireplace", NOW(), NOW());