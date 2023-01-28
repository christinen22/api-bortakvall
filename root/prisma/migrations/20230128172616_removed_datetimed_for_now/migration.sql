/*
  Warnings:

  - You are about to drop the column `created_at` on the `order` table. All the data in the column will be lost.
  - You are about to drop the column `order_date` on the `order` table. All the data in the column will be lost.
  - You are about to drop the column `order_total` on the `order` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `order` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `order` DROP COLUMN `created_at`,
    DROP COLUMN `order_date`,
    DROP COLUMN `order_total`,
    DROP COLUMN `updated_at`;
