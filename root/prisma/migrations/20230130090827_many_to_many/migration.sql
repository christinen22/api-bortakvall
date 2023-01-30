/*
  Warnings:

  - You are about to drop the `_ordertoproduct` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_ordertoproduct` DROP FOREIGN KEY `_OrderToProduct_A_fkey`;

-- DropForeignKey
ALTER TABLE `_ordertoproduct` DROP FOREIGN KEY `_OrderToProduct_B_fkey`;

-- AlterTable
ALTER TABLE `product` ADD COLUMN `order_id` INTEGER UNSIGNED NULL;

-- DropTable
DROP TABLE `_ordertoproduct`;

-- AddForeignKey
ALTER TABLE `Product` ADD CONSTRAINT `Product_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
