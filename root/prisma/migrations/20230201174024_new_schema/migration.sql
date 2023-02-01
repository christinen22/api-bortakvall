-- CreateTable
CREATE TABLE `Product` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` TEXT NOT NULL,
    `price` INTEGER NOT NULL,
    `on_sale` BOOLEAN NOT NULL,
    `images` JSON NOT NULL,
    `stock_status` VARCHAR(191) NOT NULL,
    `stock_quantity` INTEGER UNSIGNED NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `order_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `customer_first_name` VARCHAR(191) NOT NULL,
    `customer_last_name` VARCHAR(191) NOT NULL,
    `customer_address` VARCHAR(191) NOT NULL,
    `customer_postcode` VARCHAR(191) NOT NULL,
    `customer_city` VARCHAR(191) NOT NULL,
    `customer_email` VARCHAR(191) NOT NULL,
    `customer_phone` VARCHAR(191) NULL,
    `order_total` INTEGER UNSIGNED NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order_items` (
    `product_id` INTEGER UNSIGNED NOT NULL,
    `order_id` INTEGER UNSIGNED NOT NULL,
    `qty` INTEGER NOT NULL,
    `item_price` INTEGER NOT NULL,
    `item_total` INTEGER NOT NULL,

    PRIMARY KEY (`order_id`, `product_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Order_items` ADD CONSTRAINT `Order_items_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order_items` ADD CONSTRAINT `Order_items_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
