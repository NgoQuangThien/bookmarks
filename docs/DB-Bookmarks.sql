CREATE TABLE `users` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255) UNIQUE NOT NULL,
  `hash_password` varchar(255) NOT NULL,
  `email` varchar(255) UNIQUE,
  `created_at` timestamp DEFAULT 'CURRENT_TIMESTAMP'
);

CREATE TABLE `links` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `url` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255),
  `user_id` integer NOT NULL,
  `isPublic` TINYINT(1) DEFAULT 0
);

CREATE TABLE `labels` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) UNIQUE NOT NULL
);

CREATE TABLE `user_label` (
  `user_id` integer,
  `label_id` integer,
  PRIMARY KEY (`user_id`, `label_id`)
);

CREATE TABLE `link_label` (
  `link_id` integer,
  `label_id` integer,
  PRIMARY KEY (`link_id`, `label_id`)
);

CREATE TABLE `token` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `user_id` integer NOT NULL,
  `token_value` varchar(255) UNIQUE NOT NULL,
  `created_at` timestamp,
  `expires_at` timestamp
);

ALTER TABLE `links` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_label` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_label` ADD FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`);

ALTER TABLE `link_label` ADD FOREIGN KEY (`link_id`) REFERENCES `links` (`id`);

ALTER TABLE `link_label` ADD FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`);

ALTER TABLE `token` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
