-- Create connections table
CREATE TABLE `ttc_directory`.`connections`
    ( `connection_id` INT NOT NULL AUTO_INCREMENT , `connection_type` VARCHAR(50) NOT NULL , PRIMARY KEY (`connection_id`)) ENGINE = InnoDB;

-- Insert data into connections table
INSERT INTO `connections`
    (`connection_id`, `connection_type`)
VALUES
    (NULL, "streetcar"), (NULL, "bus")

-- Create services table
CREATE TABLE `ttc_directory`.`services`
    ( `service_id` INT NOT NULL AUTO_INCREMENT , `service_type` VARCHAR(50) NOT NULL , PRIMARY KEY (`service_id`)) ENGINE = InnoDB;

-- Insert data into services table
INSERT INTO `services`
    (`service_id`, `service_type`)
VALUES
    (NULL, "accessible"), (NULL, "washrooms")

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
  `active` enum("Yes","No") NOT NULL DEFAULT "Yes",
  `dateAdded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`user_id`, `first`, `last`, `email`, `password`, `active`, `dateAdded`)
VALUES
    (NULL, "Jane", "Doe", "email@email.com", "password", "Yes", CURRENT_TIMESTAMP)

-- Insert ttc station information
INSERT INTO `stations` (`station_name`)
VALUES
    ("Finch"),
    ("North York Centre"),
    ("Sheppard–Yonge"),
    ("York Mills"),
    ("Lawrence"),
    ("Eglinton"),
    ("Davisville"),
    ("St. Clair"),
    ("Summerhill"),
    ("Rosedale"),
    ("Bloor–Yonge"),
    ("Wellesley"),
    ("College"),
    ("Dundas"),
    ("Queen"),
    ("King"),
    ("Union"),
    ("St. Andrew"),
    ("Osgoode"),
    ("St. Patrick"),
    ("Queen's Park"),
    ("Museum"),
    ("St. George"),
    ("Spadina"),
    ("Dupont"),
    ("St. Clair West"),
    ("Eglinton West"),
    ("Glencairn"),
    ("Lawrence West"),
    ("Yorkdale"),
    ("Wilson"),
    ("Sheppard West"),
    ("Downsview Park"),
    ("Finch West"),
    ("York University"),
    ("Pioneer Village"),
    ("Highway 407"),
    ("Vaughan"),
    ("Kipling"),
    ("Islington"),
    ("Royal York"),
    ("Old Mill"),
    ("Jane"),
    ("Runnymede"),
    ("High Park"),
    ("Keele"),
    ("Dundas West"),
    ("Lansdowne"),
    ("Dufferin"),
    ("Ossington"),
    ("Christie"),
    ("Bathurst"),
    ("Bay"),
    ("Sherbourne"),
    ("Castle Frank"),
    ("Broadview"),
    ("Chester"),
    ("Pape"),
    ("Donlands"),
    ("Greenwood"),
    ("Coxwell"),
    ("Woodbine"),
    ("Main Street"),
    ("Victoria Park"),
    ("Warden"),
    ("Kennedy"),
    ("Lawrence East"),
    ("Ellesmere"),
    ("Midland"),
    ("Scarborough Centre"),
    ("McCowan"),
    ("Bayview"),
    ("Bessarion"),
    ("Leslie"),
    ("Don Mills");
