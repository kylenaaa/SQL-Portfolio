-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/0f1AdA
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `ORDERS` (
    `row_id` int  NOT NULL ,
    `order_id` varchar(10)  NOT NULL ,
    `created_at` timestamp  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    `cust_id` varchar(10)  NOT NULL ,
    `delivery` tinyint  NOT NULL ,
    `add_id` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `CUSTOMERS` (
    `cust_id` varchar(10)  NOT NULL ,
    `cust_fname` varchar(50)  NOT NULL ,
    `cust_lname` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `cust_id`
    )
);

CREATE TABLE `ADDRESS` (
    `add_id` varchar(10)  NOT NULL ,
    `del_address_1` varchar(100)  NOT NULL ,
    `del_city` varchar(100)  NOT NULL ,
    `del_zipcode` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `add_id`
    )
);

CREATE TABLE `ITEMS` (
    `item_id` varchar(10)  NOT NULL ,
    `sku` varchar(20)  NOT NULL ,
    `item_name` varchar(50)  NOT NULL ,
    `item_cat` varchar(20)  NOT NULL ,
    `item_size` varchar(20)  NOT NULL ,
    `item_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `item_id`
    )
);

CREATE TABLE `RECIPE` (
    `row_id` int  NOT NULL ,
    `recipe_id` varchar(20)  NOT NULL ,
    `ingre_id` varchar(20)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `INGREDIENTS` (
    `ingre_id` varchar(20)  NOT NULL ,
    `ingre_name` varchar(50)  NOT NULL ,
    `ingre_weight` int  NOT NULL ,
    `ingre_meas` varchar(20)  NOT NULL ,
    `ingre_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `ingre_id`
    )
);

CREATE TABLE `INVENTORY` (
    `inv_id` varchar(10)  NOT NULL ,
    `item_id` varchar(20)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `inv_id`
    )
);

CREATE TABLE `STAFF` (
    `staff_id` varchar(10)  NOT NULL ,
    `fname` varchar(20)  NOT NULL ,
    `lname` varchar(20)  NOT NULL ,
    `position` varchar(30)  NOT NULL ,
    `hrly_rate` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `staff_id`
    )
);

CREATE TABLE `SHIFT` (
    `shift_id` varchar(10)  NOT NULL ,
    `day_of_week` timestamp  NOT NULL ,
    `start_time` timestamp  NOT NULL ,
    `end_time` timestamp  NOT NULL ,
    PRIMARY KEY (
        `shift_id`
    )
);

CREATE TABLE `ROTA` (
    `row_id` int  NOT NULL ,
    `rota_id` varchar(10)  NOT NULL ,
    `date` timestamp  NOT NULL ,
    `shift_id` varchar(10)  NOT NULL ,
    `staff_id` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

ALTER TABLE `CUSTOMERS` ADD CONSTRAINT `fk_CUSTOMERS_cust_id` FOREIGN KEY(`cust_id`)
REFERENCES `ORDERS` (`cust_id`);

ALTER TABLE `ADDRESS` ADD CONSTRAINT `fk_ADDRESS_add_id` FOREIGN KEY(`add_id`)
REFERENCES `ORDERS` (`add_id`);

ALTER TABLE `ITEMS` ADD CONSTRAINT `fk_ITEMS_item_id` FOREIGN KEY(`item_id`)
REFERENCES `ORDERS` (`item_id`);

ALTER TABLE `RECIPE` ADD CONSTRAINT `fk_RECIPE_recipe_id` FOREIGN KEY(`recipe_id`)
REFERENCES `ITEMS` (`sku`);

ALTER TABLE `INGREDIENTS` ADD CONSTRAINT `fk_INGREDIENTS_ingre_id` FOREIGN KEY(`ingre_id`)
REFERENCES `RECIPE` (`ingre_id`);

ALTER TABLE `INVENTORY` ADD CONSTRAINT `fk_INVENTORY_item_id` FOREIGN KEY(`item_id`)
REFERENCES `RECIPE` (`ingre_id`);

ALTER TABLE `STAFF` ADD CONSTRAINT `fk_STAFF_staff_id` FOREIGN KEY(`staff_id`)
REFERENCES `ROTA` (`staff_id`);

ALTER TABLE `SHIFT` ADD CONSTRAINT `fk_SHIFT_shift_id` FOREIGN KEY(`shift_id`)
REFERENCES `ROTA` (`shift_id`);

ALTER TABLE `ROTA` ADD CONSTRAINT `fk_ROTA_row_id` FOREIGN KEY(`row_id`)
REFERENCES `ORDERS` (`created_at`);

