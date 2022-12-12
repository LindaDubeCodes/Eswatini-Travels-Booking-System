
--
-- Database: `booking_db`
--


CREATE TABLE IF NOT EXISTS `admin` (
  `fullname` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(40) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `email` varchar(140) DEFAULT NULL,
  `username` varchar(70) DEFAULT NULL,
  `password` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`fullname`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;



INSERT INTO `admin` (`fullname`, `id`, `contact`, `email`, `username`, `password`) VALUES
(1, '1', '090765453425', 'lindadube207@gmail.com', 'admin', 'admin');



CREATE TABLE IF NOT EXISTS `available_class` (
  `class_id` varchar(120) NOT NULL,
  `class_name` varchar(80) NOT NULL,
  `class_capacity` smallint(6) NOT NULL DEFAULT '0',
  `class_price` double NOT NULL DEFAULT '10',
  `description` longtext,
  PRIMARY KEY (`class_id`,`class_name`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS `booking_details` (
  `order_ref` varchar(255) NOT NULL,
  `fullname` varchar(120) NOT NULL,
  `contact` varchar(40) DEFAULT NULL,
  `gender` varchar(40) DEFAULT NULL,
  `class_reserved` varchar(255) NOT NULL,
  `destination` varchar(180) NOT NULL,
  `seats_reserved` varchar(50) NOT NULL DEFAULT '1',
  `date_reserved` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(190) NOT NULL,
  `account` varchar(130) NOT NULL,
  `amount` varchar(50) NOT NULL,
  PRIMARY KEY (`order_ref`),
  KEY `available_classbooking_details` (`class_reserved`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



INSERT INTO `booking_details` (`order_ref`, `fullname`, `contact`, `gender`, `class_reserved`, `destination`, `seats_reserved`, `date_reserved`, `transaction_id`, `account`, `amount`) VALUES
('RA84O43T53E', 'Linda Dube', '76767987', 'MALE', 'Bus', 'Mbabane to Manzini', '1', 'March 28, 2022', '38329432422', 'MoMo', '52.03'),
('BE19O27T62R', 'Luyanda Buthelezi', '79331872', 'MALE', 'Kombi', 'Mbabane to Piggs Peak', '1', 'December 22, 2012', '807678678', 'eMali', '52.03'),
('TA59C71B27O', 'Sibongile Bhembe', '78348345', 'FEMALE', 'Taxi', 'Manzini to Nhlangano', '4', 'May 27, 2022', '76887888', 'InstaCash', '52.03');


CREATE TABLE IF NOT EXISTS `tickets_generated` (
  `ticket_ref` varchar(120) NOT NULL,
  `order_ref` varchar(120) NOT NULL,
  `travel_class` varchar(255) NOT NULL,
  `date_processed` datetime DEFAULT NULL,
  `destination` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`ticket_ref`),
  KEY `available_classtickets_generated` (`travel_class`),
  KEY `booking_detailstickets_generated` (`order_ref`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `transactions` (
  `amount` double DEFAULT '0',
  `payment_via` varchar(180) DEFAULT NULL,
  `transaction_id` varchar(210) NOT NULL,
  `status` varchar(80) DEFAULT 'unused',
  PRIMARY KEY (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `transactions` (`amount`, `payment_via`, `transaction_id`, `status`) VALUES
(7500, 'MoMo', 'LORSO93045KWE', 'used');
