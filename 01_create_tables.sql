CREATE TABLE `orders` (
    `row_id` VARCHAR(50) NOT NULL,
    `order_id` VARCHAR(50) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `quantity` INT NOT NULL,
    `cast_name` VARCHAR(50) NOT NULL,
    `in_out` BOOLEAN NOT NULL,
    PRIMARY KEY (`row_id`)
);
CREATE TABLE `items` (
    `item_id` VARCHAR(50) NOT NULL,
    `sku` VARCHAR(20) NOT NULL,
    `item_name` VARCHAR(50) NOT NULL,
    `item_cat` VARCHAR(50) NOT NULL,
    `item_size` VARCHAR(20) NOT NULL,
    `item_price` DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (`item_id`)
);
CREATE TABLE `ingredients` (
    `ing_id` VARCHAR(50) NOT NULL,
    `ing_name` VARCHAR(200) NOT NULL,
    `ing_weight` INT NOT NULL,
    `ing_meas` VARCHAR(20) NOT NULL,
    `ing_price` DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (`ing_id`)
);
CREATE TABLE `recipe` (
    `row_id` VARCHAR(50) NOT NULL,
    `recipe_id` VARCHAR(20) NOT NULL,
    `ing_id` VARCHAR(50) NOT NULL,
    `quantity` INT NOT NULL,
    PRIMARY KEY (`row_id`),
    FOREIGN KEY (`ing_id`) REFERENCES `ingredients` (`ing_id`)
);
CREATE TABLE `inventory` (
    `inv_id` VARCHAR(50) NOT NULL,
    `ing_id` VARCHAR(50) NOT NULL,
    `quantity` INT NOT NULL,
    PRIMARY KEY (`inv_id`),
    FOREIGN KEY (`ing_id`) REFERENCES `items` (`item_id`)
);
CREATE TABLE `staff` (
    `staff_id` VARCHAR(50) NOT NULL,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `position` VARCHAR(100) NOT NULL,
    `sal_per_hour` DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (`staff_id`)
);
CREATE TABLE `shift` (
    `shift_id` VARCHAR(50) NOT NULL,
    `day_of_week` VARCHAR(10) NOT NULL,
    `start_time` TIME NOT NULL,
    `end_time` TIME NOT NULL,
    PRIMARY KEY (`shift_id`)
);
CREATE TABLE `rota` (
    `row_id` VARCHAR(50) NOT NULL,
    `rota_id` VARCHAR(20) NOT NULL,
    `date` DATETIME NOT NULL,
    `shift_id` VARCHAR(50) NOT NULL,
    `staff_id` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`row_id`),
    FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`),
    FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
);