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

-- Create stations table
CREATE TABLE
    `ttc_directory`.`stations`
    (
        `station_id` INT NOT NULL AUTO_INCREMENT ,
        `station_name` VARCHAR(50) NOT NULL ,
        `washroom` ENUM('Y','N') NOT NULL ,
        `accessibility` ENUM('Y','N') NOT NULL ,
        `streetcar` ENUM('Y','N') NOT NULL ,
        PRIMARY KEY (`station_id`)
    ) ENGINE = InnoDB;

-- SET washroom, accessibility, streetcar default to 'N'
ALTER TABLE `stations` CHANGE `washroom` `washroom` ENUM('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'N';
ALTER TABLE `stations` CHANGE `accessibility` `accessibility` ENUM('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Y';
ALTER TABLE `stations` CHANGE `streetcar` `streetcar` ENUM('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'N';

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

UPDATE `stations`
    SET `washroom` = 'Y'
    WHERE `station_id` IN (1, 3, 75, 32, 31, 6, 39, 11, 65, 66);

UPDATE `stations`
    SET `streetcar` = 'Y'
    WHERE `station_id` IN (13, 16, 8, 14, 15, 18, 19, 20, 21, 26, 52, 56, 24, 47, 63, 17);
