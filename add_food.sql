/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` date DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `arr_sub_id` varchar(100) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` date DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(100) DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(100) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Pizza', 'pizza.jpg', 10.99, 'Delicious pizza with various toppings', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Salad', 'salad.jpg', 7.99, 'Fresh and healthy salad', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Ice Cream', 'ice_cream.jpg', 4.99, 'Sweet and creamy ice cream', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Burger', 'burger.jpg', 8.99, 'Juicy burger with cheese and vegetables', 2),
(5, 'Pasta', 'pasta.jpg', 12.99, 'Homemade pasta with rich tomato sauce', 2),
(6, 'Cappuccino', 'cappuccino.jpg', 3.99, 'Classic Italian cappuccino', 4),
(7, 'Sushi', 'sushi.jpg', 15.99, 'Assorted sushi with fresh seafood', 6),
(8, 'Vegetable Curry', 'vegetable_curry.jpg', 9.99, 'Spicy vegetable curry with rice', 8),
(9, 'Grilled Steak', 'grilled_steak.jpg', 17.99, 'Tender grilled steak with side dishes', 9),
(10, 'Cheesecake', 'cheesecake.jpg', 6.99, 'Creamy cheesecake with fruit topping', 3);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Appetizer');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Main Course');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Dessert');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Beverage'),
(5, 'Snack'),
(6, 'Soup'),
(7, 'Seafood'),
(8, 'Vegetarian'),
(9, 'Grill'),
(10, 'Dairy');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2024-03-11');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2024-03-11');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 1, '2024-03-12');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 1, '2024-03-12'),
(3, 1, '2024-03-12'),
(3, 1, '2024-03-13'),
(4, 1, '2024-03-14'),
(4, 1, '2024-03-15'),
(5, 1, '2024-03-16'),
(5, 1, '2024-03-17'),
(6, 8, '2024-03-18'),
(7, 8, '2024-03-19'),
(8, 10, '2024-03-20'),
(1, 1, '2024-03-11');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ORDER123', '1,2');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 3, 1, 'ORDER456', '3');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 2, 3, 'ORDER789', '2,3');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 5, 1, 'ORDER101', '4'),
(5, 4, 2, 'ORDER202', '5,6'),
(6, 6, 1, 'ORDER303', '7'),
(7, 7, 4, 'ORDER404', '8,9'),
(8, 8, 2, 'ORDER505', '10'),
(9, 9, 3, 'ORDER606', '1,2,3'),
(10, 10, 2, 'ORDER707', '4,5');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2024-03-11');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 3, 4, '2024-03-12');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 2, 3, '2024-03-13');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 5, 2, '2024-03-14'),
(5, 4, 5, '2024-03-15'),
(6, 6, 1, '2024-03-16'),
(7, 7, 4, '2024-03-17'),
(8, 8, 3, '2024-03-18'),
(9, 9, 2, '2024-03-19'),
(10, 10, 5, '2024-03-20');

INSERT INTO `restaurant` (`res_id`, `res_name`, `Image`, `description`) VALUES
(1, 'Restaurant 1', 'image1.jpg', 'Description 1');
INSERT INTO `restaurant` (`res_id`, `res_name`, `Image`, `description`) VALUES
(2, 'Restaurant 2', 'image2.jpg', 'Description 2');
INSERT INTO `restaurant` (`res_id`, `res_name`, `Image`, `description`) VALUES
(3, 'Restaurant 3', 'image3.jpg', 'Description 3');
INSERT INTO `restaurant` (`res_id`, `res_name`, `Image`, `description`) VALUES
(4, 'Restaurant 4', 'image4.jpg', 'Description 4'),
(5, 'Restaurant 5', 'image5.jpg', 'Description 5'),
(6, 'Restaurant 6', 'image6.jpg', 'Description 6'),
(7, 'Restaurant 7', 'image7.jpg', 'Description 7'),
(8, 'Restaurant 8', 'image8.jpg', 'Description 8'),
(9, 'Restaurant 9', 'image9.jpg', 'Description 9'),
(10, 'Restaurant 10', 'image10.jpg', 'Description 10');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Pepperoni', 1.99, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Caesar Salad', 2.99, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Chocolate Chip', 0.99, 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Chicken Wings', 5.99, 4),
(5, 'Alfredo Pasta', 14.99, 5),
(6, 'Espresso', 2.49, 6),
(7, 'Sashimi Platter', 19.99, 7),
(8, 'Tofu Stir-Fry', 8.99, 8),
(9, 'Ribeye Steak', 22.99, 9),
(10, 'Blueberry Cheesecake', 7.99, 10);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'john.doe@example.com', 'password1');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Jane Smith', 'jane.smith@example.com', 'password2');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Alice Johnson', 'alice.johnson@example.com', 'password3');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Bob Williams', 'bob.williams@example.com', 'password4'),
(5, 'Eva Davis', 'eva.davis@example.com', 'password5'),
(6, 'Michael Brown', 'michael.brown@example.com', 'password6'),
(7, 'Sara Taylor', 'sara.taylor@example.com', 'password7'),
(8, 'David Miller', 'david.miller@example.com', 'password8'),
(9, 'Emily Wilson', 'emily.wilson@example.com', 'password9'),
(10, 'Daniel Lee', 'daniel.lee@example.com', 'password10'),
(11, 'Olivia Moore', 'olivia.moore@example.com', 'password11'),
(12, 'William Clark', 'william.clark@example.com', 'password12'),
(13, 'Emma Taylor', 'emma.taylor@example.com', 'password13'),
(14, 'James White', 'james.white@example.com', 'password14'),
(15, 'Sophia Martinez', 'sophia.martinez@example.com', 'password15'),
(16, 'Jackson Adams', 'jackson.adams@example.com', 'password16'),
(17, 'Ava Turner', 'ava.turner@example.com', 'password17'),
(18, 'Liam Garcia', 'liam.garcia@example.com', 'password18'),
(19, 'Grace Harris', 'grace.harris@example.com', 'password19'),
(20, 'Mason Thomas', 'mason.thomas@example.com', 'password20');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;