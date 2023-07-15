-- Create connections table
CREATE TABLE `ttc_directory`.`connections`
    ( `connection_id` INT NOT NULL AUTO_INCREMENT , `connection_type` VARCHAR(50) NOT NULL , PRIMARY KEY (`connection_id`)) ENGINE = InnoDB;

-- Insert data into connections table
INSERT INTO `connections`
    (`connection_id`, `connection_type`)
VALUES
    (NULL, 'streetcar'), (NULL, 'bus')

-- Create services table
CREATE TABLE `ttc_directory`.`services`
    ( `service_id` INT NOT NULL AUTO_INCREMENT , `service_type` VARCHAR(50) NOT NULL , PRIMARY KEY (`service_id`)) ENGINE = InnoDB;

-- Insert data into services table
INSERT INTO `services`
    (`service_id`, `service_type`)
VALUES
    (NULL, 'accessible'), (NULL, 'washrooms')

-- Create sations table
CREATE TABLE `ttc_directory`.`stations`
    ( `station_id` INT NOT NULL AUTO_INCREMENT , `station_name` VARCHAR(50) NOT NULL , `services` INT NULL , `connections` INT NULL , PRIMARY KEY (`station_id`)) ENGINE = InnoDB;

-- Assign foreign keys (services/connections)
ALTER TABLE `stations` ADD FOREIGN KEY (`services`) REFERENCES `services`(`service_id`) ON DELETE CASCADE ON UPDATE CASCADE; ALTER TABLE `stations` ADD FOREIGN KEY (`connections`) REFERENCES `connections`(`connection_id`) ON DELETE CASCADE ON UPDATE CASCADE;


-- Table structure for table `users`
CREATE TABLE `users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first` varchar(25) DEFAULT NULL,
  `last` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `active` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `dateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`user_id`, `first`, `last`, `email`, `password`, `active`, `dateAdded`)
VALUES
    (NULL, 'Jane', 'Doe', 'email@email.com', 'password', 'Yes', CURRENT_TIMESTAMP)

-- Insert ttc station information
INSERT INTO ttc_stations (id, name)
VALUES
(1, 'Finch'),
(2, 'North York Centre'),
(3, 'Sheppard–Yonge'),
(4, 'York Mills'),
(5, 'Lawrence'),
(6, 'Eglinton'),
(7, 'Davisville'),
(8, 'St. Clair'),
(9, 'Summerhill'),
(10, 'Rosedale'),
(11, 'Bloor–Yonge'),
(12, 'Wellesley'),
(13, 'College'),
(14, 'Dundas'),
(15, 'Queen'),
(16, 'King'),
(17, 'Union'),
(18, 'St. Andrew'),
(19, 'Osgoode'),
(20, 'St. Patrick'),
(21, 'Queen\'s Park'),
(22, 'Museum'),
(23, 'St. George'),
(24, 'Spadina'),
(25, 'Dupont'),
(26, 'St. Clair West'),
(27, 'Eglinton West'),
(28, 'Glencairn'),
(29, 'Lawrence West'),
(30, 'Yorkdale'),
(31, 'Wilson'),
(32, 'Sheppard West'),
(33, 'Downsview Park'),
(34, 'Finch West'),
(35, 'York University'),
(36, 'Pioneer Village'),
(37, 'Highway 407'),
(38, 'Vaughan'),
(39, 'Kipling'),
(40, 'Islington'),
(41, 'Royal York'),
(42, 'Old Mill'),
(43, 'Jane'),
(44, 'Runnymede'),
(45, 'High Park'),
(46, 'Keele'),
(47, 'Dundas West'),
(48, 'Lansdowne'),
(49, 'Dufferin'),
(50, 'Ossington'),
(51, 'Christie'),
(52, 'Bathurst'),
(53, 'Bay'),
(54, 'Sherbourne'),
(55, 'Castle Frank'),
(56, 'Broadview'),
(57, 'Chester'),
(58, 'Pape'),
(59, 'Donlands'),
(60, 'Greenwood'),
(61, 'Coxwell'),
(62, 'Woodbine'),
(63, 'Main Street'),
(64, 'Victoria Park'),
(65, 'Warden'),
(66, 'Kennedy'),
(67, 'Lawrence East'),
(68, 'Ellesmere'),
(69, 'Midland'),
(70, 'Scarborough Centre'),
(71, 'McCowan'),
(72, 'Bayview'),
(73, 'Bessarion'),
(74, 'Leslie'),
(75, 'Don Mills');
